## Tutorial: The Impact of Outliers on Logistic Regression

This tutorial covers how outliers affect Logistic Regression, why its response differs from Linear Regression, the exact mathematics behind both scenarios, and how to handle them in practice.

---

### 1. Fundamentals: Linear Boundary & Log-Loss

In binary classification, Logistic Regression fits a linear decision boundary separating two classes:

* **Class 0 (Negative):** $y = 0$

* **Class 1 (Positive):** $y = 1$


#### The Pipeline

1. **Linear Combination ($z$):**
$$z = w^T x + w_0 = w_1 x_1 + w_2 x_2 + \dots + w_0$$




$z$ measures the signed distance of a sample from the decision boundary ($z = 0$).


2. **Sigmoid Transformation ($\sigma$):**
$$\hat{y} = \sigma(z) = \frac{1}{1 + e^{-z}}$$




Maps any value from $(-\infty, +\infty)$ into a valid probability between $0$ and $1$.


3. **Binary Cross-Entropy Loss (Log Loss):**
$$L = -y \log(\hat{y}) - (1 - y) \log(1 - \hat{y})$$




---

### 2. Why Logistic Regression Behaves Differently from Linear Regression

* **Linear Regression:** Minimizes squared error, $L = (y - \hat{y})^2$. A single extreme point produces a massive residual, dragging the line toward itself regardless of direction.
* **Logistic Regression:** Uses the **Sigmoid function**, which **saturates** at extreme positive and negative values.


* Once a point is correctly classified far beyond the boundary, its probability caps at $1.0$ (or $0.0$). Additional distance causes no extra loss.


* However, if an extreme point ends up on the **wrong side**, the logarithmic penalty approaches infinity, severely distorting the model.





---

### 3. The Two Core Cases

```text
                  Decision Boundary (z = 0)
                              |
     Class 0 (y = 0)          |          Class 1 (y = 1)
                              |
            O   O             |                *   *
          O   O   O           |              *   *   *
            O   O             |                *   *
                              |
   * <------------------------+--------------------------------> *
 [Case 2: Wrong Side]         |                     [Case 1: Correct Side]
 (Severe Impact)              |                     (Zero / Low Impact)

```

#### Case 1: Outlier on the Correct Side (Low Impact)

* **Scenario:** A positive observation ($y = 1$) has an unusually large feature value, placing it far into the positive territory.


* **Linear Distance:** $z \to +\infty$

* **Predicted Probability:**
$$\hat{y} = \sigma(z) = \frac{1}{1 + e^{-\infty}} = \frac{1}{1 + 0} = 1$$



* **Loss Evaluation:**
For $y = 1$, the $(1 - y)$ term is zero:



$$L = -1 \cdot \log(1) - 0 = 0$$



* **Result:** The gradient is zero. The outlier contributes no penalty, so **the decision boundary does not move**.



---

#### Case 2: Outlier on the Wrong Side (High Impact)

* **Scenario:** A data point labeled $y = 1$ has extreme feature values that place it deep inside Class 0's cluster (often caused by mislabeling, sensor malfunction, or severe data noise).


* **Linear Distance:** $z \to -\infty$

* **Predicted Probability:**
$$\hat{y} = \sigma(z) = \frac{1}{1 + e^{-(-\infty)}} = \frac{1}{1 + \infty} = 0$$



* **Loss Evaluation:**
$$L = -1 \cdot \log(0) \to +\infty$$



* **Result:** An infinite loss produces huge gradient updates. Gradient descent violently **rotates and shifts the boundary** toward this single point to reduce the penalty, misclassifying normal points nearby.



---

### 4. Summary Matrix

| Metric / Property | Case 1: Outlier on Correct Side | Case 2: Outlier on Wrong Side |
| --- | --- | --- |
| **True Label ($y$)** | $1$<br> | $1$<br> |
| **Linear Projection ($z$)** | Very large positive ($z \gg 0$)

 | Very large negative ($z \ll 0$)

 |
| **Predicted Probability ($\hat{y}$)** | $\approx 1.0$<br> | $\approx 0.0$<br> |
| **Log Loss ($L$)** | $\approx 0.0$<br> | $\to +\infty$ (Huge penalty)

 |
| **Gradient Magnitude** | Negligible ($\approx 0$)

 | Extremely large

 |
| **Impact on Decision Boundary** | **None / Negligible**<br> | **Severe distortion**<br> |

---

### 5. Practical Implementation & Outlier Treatment

### Step 1: Detect Potential Outliers

Before training, inspect continuous features using the Interquartile Range (IQR) method:

```python
import numpy as np
import pandas as pd

# Identify IQR boundaries for a feature
Q1 = df['MonthlyCharges'].quantile(0.25)
Q3 = df['MonthlyCharges'].quantile(0.75)
IQR = Q3 - Q1

lower_bound = Q1 - 1.5 * IQR
upper_bound = Q3 + 1.5 * IQR

outliers = df[
    (df['MonthlyCharges'] < lower_bound) | (df['MonthlyCharges'] > upper_bound)
]

```

#### Step 2: Scale and Regularize

Feature scaling keeps $z = w^Tx + w_0$ stable, while $L_2$ regularization stops individual weights from blowing up to satisfy extreme misclassified points:

```python
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42, stratify=y
)

# Standardize and fit with L2 regularization
pipeline = Pipeline(
    [
        ('scaler', StandardScaler()),
        (
            'log_reg',
            LogisticRegression(
                penalty='l2', C=1.0, solver='lbfgs', random_state=42
            ),
        ),
    ]
)

pipeline.fit(X_train, y_train)

```

#### Step 3: Handle Toxic Outliers

* **Winsorizing (Capping):** Cap extreme continuous values at the 1st and 99th percentiles so genuine points keep their rank without creating extreme leverage.
* **Drop Verified Errors:** If an extreme point on the wrong side is verified as an entry error or corruption, drop it before model fitting.
