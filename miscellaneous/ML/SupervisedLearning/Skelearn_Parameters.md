The correct answers are model.coef_ and model.intercept_.

In scikit-learn, after you fit a linear model (like LinearRegression), the geometric parameters of the line or hyperplane are stored in these two specific attributes.

## Breaking Down the Parameters  

A line or hyperplane is mathematically defined as:
$$y = m_1x_1 + m_2x_2 + \dots + b$$ 

* model.coef_ provides the coefficients (or weights/slopes, $m$). These tell you how much weight the model assigns to each input feature. If your dataset has 3 features, this will return an array of 3 numbers.
* model.intercept_ provides the intercept (or bias, $b$). This is the point where the line or hyperplane crosses the y-axis (the predicted value when all input features are zero).


## 🔍 Why the other options are incorrect:

* model.predict(): This is a method used to generate new predictions using the trained model, not to retrieve its internal parameters.
* model.score(): This is a method used to evaluate the model's performance on a dataset. For linear regression, it actually returns the $R^2$ Score we just discussed!

Would you like to see a brief Python code example that fits a model and prints out these exact attributes, or would you prefer to dive into Adjusted $R^2$ next?


