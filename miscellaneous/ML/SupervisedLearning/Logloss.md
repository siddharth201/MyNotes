The correct answer is B: Log-loss will be a very low value.
## Why this is correct:
Log-loss measures how close a predicted probability ($\hat{y}$) is to the actual label ($y$). The mathematical formula for a single instance when the true label is $y = 1$ simplifies to:
$$\text{Log-Loss} = -\ln(\hat{y})$$ 

* Plugging in the values: $-\ln(0.8) \approx \mathbf{0.223}$
* Because the model predicted a high probability ($0.8$) that aligns closely with the actual outcome ($1$), it is rewarded with a very small penalty (low loss).

## Why other options are incorrect:

* A is incorrect: A very high log-loss only occurs if the model is confident and completely wrong (for example, if $y = 1$ but $\hat{y} = 0.01$).
* C is incorrect: Log-loss only becomes exactly 0 if the model is $100\%$ certain and perfectly accurate ($\hat{y} = 1.0$).




