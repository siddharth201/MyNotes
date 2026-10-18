
## Q. Why do we need Decision Trees if we already have K-NN?

Both solve classification problems, but they make predictions differently.

- K-NN: Predicts based on the labels of nearby data points. It can be computationally expensive during prediction because it needs to find neighbours.
- Decision Tree: Predicts by following learned decision rules, such as `Age < 29`. These rules are often easier to interpret and explain.

Key takeaway: Decision Trees provide rule-based, interpretable predictions, while K-NN relies on neighbouring examples. Neither is always better; the choice depends on the data and problem.

## Q. Are Decision Trees used only for classification?

No. Decision Trees support both classification and regression.

- Classification Tree: Predicts a category, such as whether an employee will Stay or Leave.
- Regression Tree: Predicts a numerical value, such as a house price or an employee's expected salary.

The key difference is the type of output: a class label versus a numerical value.

## Q. An example where KNN is better than Decision Tree?

Friend, imagine we want to classify customers based on their shopping behaviour.

### Example: K-NN can be better than a Decision Tree

Suppose customers are represented using two features:

- X-axis: Monthly spending
- Y-axis: Number of website visits

Customers who buy a particular product form a curved, ring-shaped region surrounded by customers who don't buy it.

[Performers: The Kernel Trick, Random Fourier Features, and Attention](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/ML/SupervisedLearning/Images/KNN-vs-DecisionTree.png)

Illustration of a nonlinear classification pattern.

- K-NN: Can classify the new customer based on nearby customers, potentially capturing the curved pattern naturally.
- Decision Tree: Can also learn this pattern, but may need many rectangular splits to approximate the curved boundary. A deep tree can become complex and overfit.

Why might K-NN win? If nearby customers tend to have similar labels and the decision boundary is nonlinear, K-NN can perform well without learning a large set of tree rules.

Important: K-NN is not automatically better here. Its performance depends on feature scaling, the choice of \\(K\\), noise, and data density. A well-tuned Decision Tree or tree ensemble may perform equally well or better.
