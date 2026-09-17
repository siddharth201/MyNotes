The correct answer is 2. It is a mean model (or performs exactly like one).

##  The Math Behind the Answer

Let's plug $SS_{Residual} = SS_{Total}$ into our trusted $R^2$ formula:     

$$R^2 = 1 - \frac{SS_{Residual}}{SS_{Total}}$$  
 
Since both terms are equal, the fraction simplifies to 1:  

$$R^2 = 1 - 1 = \mathbf{0}$$ 
An $R^2$ score of 0 means the machine learning model has zero predictive power over the baseline. It is capturing absolutely none of the variance in the data. [2, 3, 4] 
Because its total squared mistakes match the total squared mistakes of the "Lazy Model" exactly, the model is fundamentally just functioning as a mean model—outputting the flat baseline average value for every prediction. [3] 
To continue mastering $R^2$ and model evaluation, would you like to explore:

* 
* What causes a model to perform worse than the mean model (Option 1, yielding a negative $R^2$)?
* What mathematical condition represents the best model (Option 3)?
* 




