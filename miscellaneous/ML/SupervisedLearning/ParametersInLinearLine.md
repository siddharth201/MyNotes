
To estimate a simple linear regression model with just one independent variable, you need 2 parameters.

## The Parameters Explained

The equation for a simple linear regression line is:
$$y = mx + c$$ 
To fully define this line, the model must learn and calculate exactly two values:

   1. The Slope ($m$): Also called the coefficient or weight (model.coef_ in sklearn). It dictates the steepness and direction of the line.
   2. The Y-intercept ($c$): Also called the bias (model.intercept_ in sklearn). It dictates where the line crosses the vertical axis.

## General Rule for Linear Regression

If you scale up to multiple linear regression, the rule for finding the total number of parameters is:
$$\text{Total Parameters} = \text{Number of Independent Variables} + 1 \text{ (for the intercept)}$$ 
Since this problem specified exactly 1 independent variable, the math is simply $1 + 1 = \mathbf{2}$.
To continue building on this, would you like to explore:

* How the number of parameters changes when you add more independent variables (Multiple Linear Regression)?
* What happens to Adjusted $R^2$ as the number of parameters in your model increases?


