The correct answers are Minimum is -infinity and Maximum is 1.

## The Mathematical Proof

Let's look closely at the formula provided:
$$R^2 = 1 - \frac{SSR}{TSS}$$ 
## 1. Finding the Maxima (Maximum = 1)
The maximum value occurs when your model makes zero mistakes.

* If the model is perfect, every prediction matches the actual value ($\hat{y}_i = y_i$).
* This means the Sum of Squared Residuals ($SSR$) becomes 0.
* Plugging this in: $R^2 = 1 - \frac{0}{TSS} = \mathbf{1}$.
* Since $SSR$ is a sum of squared numbers, it can never be negative, meaning $\frac{SSR}{TSS}$ cannot be negative. Thus, $R^2$ can never exceed 1.

## 2. Finding the Minima (Minimum = -infinity)
The minimum value occurs when the model performs infinitely worse than just guessing the average.

* As we calculated earlier, if a model predicts values that are wildly far away from the true data points, the $SSR$ grows exponentially larger than the $TSS$ ($SSR \gg TSS$).
* When the fraction $\frac{SSR}{TSS}$ becomes an unimaginably massive positive number, subtracting it from 1 drives the overall score down toward $-\infty$.

## 🔍 Summary of the Options

* Minimum is -infinity — CORRECT (A model can be infinitely bad).
* Minimum is -1 — INCORRECT (It is a common misconception that $R^2$ ranges from -1 to 1 like a correlation coefficient, but it can drop far below -1).
* Maximum is 1 — CORRECT (100% accuracy is the absolute ceiling).
* Maximum is infinity — INCORRECT (You cannot explain more than 100% of the natural variance in a dataset).

Now that you have mastered the mathematical limits of $R^2$, would you like to:

* Explore Adjusted $R^2$, which prevents the score from falsely increasing when adding useless features?
* Move on to other foundational regression metrics like Mean Absolute Error (MAE) or Mean Squared Error (MSE)?



