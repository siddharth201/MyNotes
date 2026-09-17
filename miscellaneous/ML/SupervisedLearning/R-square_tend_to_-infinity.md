
The correct answer is 3. SSresidual >> SStotal.
------------------------------
## 🧩 Why this happens (The Math)
Let’s look back at the core formula for the $R^2$ Score:
$$R^2 = 1 - \frac{SS_{residual}}{SS_{total}}$$ 
For the value to drop all the way down toward negative infinity ($-\infty$), the fraction $\frac{SS_{residual}}{SS_{total}}$ must become an incredibly large positive number.
This happens when your model's mistakes ($SS_{residual}$) are drastically larger than the baseline mistakes ($SS_{total}$).
------------------------------
## 🔍 Evaluating All Options

* 1. $SS_{residual} = SS_{total}$: The fraction becomes $\frac{1}{1}$. Therefore, $R^2 = 1 - 1 = \mathbf{0}$. (The model is as good as guessing the average).
* 2. $SS_{residual} \ll SS_{total}$: Your model's mistakes are almost zero compared to the baseline. The fraction approaches $0$, so $R^2 \to \mathbf{1}$. (An excellent model).
* 3. $SS_{residual} \gg SS_{total}$: Your model's mistakes are massive compared to the baseline. The fraction becomes huge. For example, if your error is $1,000,000$ and the baseline error is only $10$:
$$R^2 = 1 - \frac{1,000,000}{10} = 1 - 100,000 = \mathbf{-99,999}$$ 
As your model gets worse and worse, this value stretches out toward $-\infty$.
* 4. $SS_{residual} = 0$: The fraction becomes $0$. Therefore, $R^2 = 1 - 0 = \mathbf{1}$. (A perfect model with zero mistakes).



