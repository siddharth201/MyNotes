## Q Why can't we use Mean Squared Error for Log Loss / Binary Cross-Entropy  

## Scaler's Response
## =================

To evaluate the explanation, let's independently verify both the arithmetic and the conceptual reasoning presented by the tutor:

---

### 1. Verification of the Tutor's Arithmetic

The tutor considers actual label $y = 1$ under two prediction scenarios:

#### Scenario 1: Model is close ($\hat{y} = 0.9$)

* **MSE Calculation:**

$$\text{MSE} = (1 - 0.9)^2 = (0.1)^2 = 0.01$$



*Tutor's value:* $0.01$. (Mathematically correct).


* **Binary Cross-Entropy (Log Loss) Calculation:**

$$\text{BCE} = -\ln(0.9) \approx 0.10536$$



*Tutor's value via code:* `-np.log(0.9) = 0.10536...`. (Mathematically correct).



---

#### Scenario 2: Model is confident and wrong ($\hat{y} = 0.01$)

* **MSE Calculation:**

$$\text{MSE} = (1 - 0.01)^2 = (0.99)^2 = 0.9801$$



*Tutor's value:* $0.98$. (Mathematically correct).


* **Binary Cross-Entropy (Log Loss) Calculation:**

$$\text{BCE} = -\ln(0.01) \approx 4.60517$$



*Tutor's value via code:* `-np.log(0.01) = 4.60517...`. (Mathematically correct).



---

### 2. Verification of the Conceptual Logic

The core point the tutor makes is:

1. **MSE is bounded on probabilities:** Because both $y \in \{0, 1\}$ and $\hat{y} \in [0, 1]$, the maximum error MSE can assign to any prediction is $(1 - 0)^2 = 1.0$. Even when the model is catastrophically wrong and 99% confident in the wrong class ($\hat{y} = 0.01$), the penalty caps out at just $0.98$.


2. **Log Loss penalizes confident wrongness exponentially:** As $\hat{y} \to 0$ when $y = 1$:

$$\lim_{\hat{y} \to 0} -\ln(\hat{y}) = +\infty$$



Log loss scales from $\approx 0.105$ to $4.605$ (over a 43x increase in loss), heavily penalizing confident mistakes so gradient descent aggressively corrects the weights.



---

### Minor Notational Correction

On the whiteboard around 00:00–00:02, the handwritten log-loss equation shows:


$$\text{Log Loss} = y_i \times (-\log(\hat{y}_i)) + (1 - y_i) \times \log(1 - \hat{y}_i)$$


Notice the missing negative sign in front of the second term. The standard formulation has a negative sign on both:


$$\mathcal{L} = - \left[ y_i \log(\hat{y}_i) + (1 - y_i) \log(1 - \hat{y}_i) \right] = y_i (-\log \hat{y}_i) + (1 - y_i) (-\log(1 - \hat{y}_i))$$


When simplifying for $y_i = 0$, it should reduce to $-\log(1 - \hat{y}_i)$ rather than positive $\log(1 - \hat{y}_i)$ (since $\log$ of a value $< 1$ is negative, the extra minus sign ensures loss is positive).

---

The tutor's core argument and arithmetic demonstration are **correct**: MSE fails to punish confidently incorrect predictions adequately because its loss is capped at $1.0$, whereas Binary Cross-Entropy scales towards infinity, properly penalizing overconfident classification errors.  




## AI's Response
## =================
