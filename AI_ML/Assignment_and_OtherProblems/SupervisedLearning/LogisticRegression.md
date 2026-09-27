
### Q.1 The farther a point is from the line or hyperplane, the lower the chances that it belongs to a specific class.

<details>
<summary>$\color{black}{\huge{\textbf{Options:}}}$</summary>  

```text
1. True

2. False

```   
<details>

<summary>$\color{black}{\huge{\textbf{Answer}}}$</summary>
1. True  
  
</details>  

</details>  
  
---  

### Q.2 In logistic regression, the output of the sigmoid function is interpreted as:

<details>
<summary>$\color{black}{\huge{\textbf{Options:}}}$</summary>  

```text
1. Class probabilities

2. Raw scores

3. Error rates

4. Regression coefficients

```   
<details>

<summary>$\color{black}{\huge{\textbf{Answer}}}$</summary>
1. Class probabilities  

[**Explanation**](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/ML/SupervisedLearning/SigmoidFunction.md) 
  
</details>  

</details>  
  
---  

### Q.3 Suppose the actual label is y = 1 and the predicted probability is ŷ = 0.8. What will the log-loss be?

<details>
<summary>$\color{black}{\huge{\textbf{Options:}}}$</summary>  

```text
1. Log-loss will be a very high value.

2. Log-loss will be a very low value.

3. Log-loss will be O.
```   
<details>

<summary>$\color{black}{\huge{\textbf{Answer}}}$</summary>
2. Log-loss will be a very low value.

[**Explanation**](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/ML/SupervisedLearning/Logloss.md) 
  
</details>  

</details>  
  
---  

### Q.4 Consider the following diagrams as examples of the convex function(left) and non-convex function(right):

![Image](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/ML/SupervisedLearning/Images/Logloss.png)  

With respect to these, which of the following statement(s) is/are true?

Note: The diagrams are just given as examples, answer the question after understanding the convex and non-convex functions.  

Choose the correct answer from below, please note that this question may have multiple correct answers

<details>
<summary>$\color{black}{\huge{\textbf{Options:}}}$</summary>  

```text
1. Using 'log loss' as the loss function in logistic regression results in a convex loss function.

2. When 'MSE' is used as the loss function in logistic regression, the loss function is non-convex in nature.

3. Using 'log loss' as the loss function in logistic regression results in a non-convex loss function.  

4. When 'MSE' is used as the loss function in logistic regression, the loss function is convex in nature.
```   
<details>

<summary>$\color{black}{\huge{\textbf{Answer}}}$</summary>  

```text
1. Using 'log loss' as the loss function in logistic regression results in a convex loss function.

2. When 'MSE' is used as the loss function in logistic regression, the loss function is non-convex in nature.
```

**Explanation**  

[**Convex vs NonConvex**](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/ML/SupervisedLearning/Convex-nonConvex.md)   
[Answer Explanation](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/ML/SupervisedLearning/LR-Q4.md)
  
</details>  

</details>  
  
---
  
### Q.5 Error function for logistic regression is -$y.log(\hat{y}) - (1 - y).log(1 - \hat{y})$, where y represents the true label and $\hat{y}$ represents the probability output by logistic regression model.
Given that Numpy array y_true represents the true labels for each observation, array z represents the $(w_0 + w_1.x_1 + w_2.x_2)$ predicted by the logistic regression model before applying the sigmoid, complete the function **logloss()** to calculate the value of the logloss
**Note:** The value of logloss should be rounded up to 2 decimals.

**Input Format:**

```text
Two arrays of representing z - value (multiplication of weights and x) and target variable (y_true)

```

**Output Format:**

```text
Return the loss value (float value) of the model rounded off to two decimal places.

```

**Sample Input:**

```text
z = [3.11, 0.08, 0.76, 5.98, 3.05, 0.12, 8.99, 1.69, 1.75, 1.54]
y_true = [1, 0, 1, 0, 0, 0, 1, 1, 0, 1]

```

**Sample Output:**

```text
1.33

```

**Output Explanation:**

```text
1.33 is the loss calculated by calculating log loss for each observation and then averaged across.

```

<details>
<summary>$\color{black}{\huge{\textbf{Programme:}}}$</summary>  

```text
import numpy as np
def logloss(z, y_true):
    '''z, y_true are lists
       output ->  numpy array is expected to be returned
    '''
    
    z = np.asarray(z)
    y_true = np.asarray(y_true)

    probability = 1 / (1 + np.exp(-z)) # apply sigmoid to z array
    

    loss_array = - (y_true * np.log(probability) + (1 - y_true) * np.log(1-probability))
    
    # take mean of loss array to get log loss
    loss = np.mean(loss_array)
    

    return np.round(loss, 2)
```   
</details>  
  
--- 




