To find the equation of the line, we use the point-slope formula:
$$y - y_1 = m(x - x_1)$$ 

## 1. Identify the given values

* Slope ($m$): $-4$
* Point ($x_1, y_1$): $(-2, 5)$

## 2. Plug the values into the formula
$$y - 5 = -4(x - (-2))$$ 
Simplify the double negative inside the parentheses:
$$y - 5 = -4(x + 2)$$ 
## 3. Simplify to Slope-Intercept Form ($y = mx + b$)
Distribute the $-4$:
$$y - 5 = -4x - 8$$ 
Add $5$ to both sides to isolate $y$:
$$y = -4x - 8 + 5$$ 
$$\mathbf{y = -4x - 3}$$ 

## 💻 Connecting back to Machine Learning (scikit-learn)
If you were to train a linear regression model on data following this exact line, scikit-learn would find these parameters automatically:

* model.coef_ would return [-4]
* model.intercept_ would return -3

Would you like to find the standard form of this equation ($Ax + By = C$), or see how to plot it using Python (matplotlib)?


