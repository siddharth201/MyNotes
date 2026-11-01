
<details>
<summary>What is Evaluation Metrics</summary>

Friend, Evaluation Metrics are measures or criteria that help us judge how well a Machine Learning model or algorithm is performing.

In simple words:

Evaluation metrics help us answer:

"Model ne kitna achha kaam kiya?"

## 1. Real-world example

Imagine you are teaching two students for an examination.

Both students take a test:

- Student A scores 90/100.
- Student B scores 60/100.

Marks are the evaluation metric here. They help us compare their performance.

Similarly, in Machine Learning, we need evaluation metrics to measure model performance.

## 2. Evaluation Metrics in Machine Learning

Different ML problems require different evaluation metrics.

| ML Problem     | Common evaluation metrics                          |
| -------------- | -------------------------------------------------- |
| Classification | Accuracy, Precision, Recall, F1-score              |
| Regression     | MAE, MSE, RMSE, R² Score                           |
| Clustering     | Silhouette Score, Dunn Index, Davies-Bouldin Index |

Notice that evaluation metrics depend on the type of ML problem.

## 3. In our current topic: Clustering

Suppose K-Means creates three customer clusters.

But how do we know whether the clustering is good?

We don't have predefined labels (because it's unsupervised learning).

So we use Internal Evaluation Metrics:

- Silhouette Score: How well does each point fit within its cluster compared with other clusters?
- Dunn Index: How compact and separated are the clusters?
- Davies-Bouldin Index: How similar is each cluster to its most similar neighbouring cluster?

These metrics help us evaluate clustering quality without requiring predefined ground-truth labels.

## 4. Types of Clustering Evaluation

| Type                | Meaning                                                                | Example                  |
| ------------------- | ---------------------------------------------------------------------- | ------------------------ |
| Internal Evaluation | Evaluates clustering using the data and cluster assignments themselves | Silhouette, Dunn         |
| External Evaluation | Compares predicted clusters against known ground-truth labels          | Adjusted Rand Index, NMI |

For example, if we already know the correct customer categories, we can compare K-Means clusters against those known categories using external metrics.

## 5. Important distinction

Let's connect this to what we just studied:

- K-Means: Creates clusters.
- Elbow Method: Helps choose K.
- Silhouette Score: Evaluates clustering quality.
- Dunn Index: Evaluates clustering quality.

### Remember this definition for interviews

"Evaluation metrics are quantitative measures used to assess how well a machine learning model or algorithm performs with respect to a particular objective."

Ultimate goal: Building a model is not enough. We also need a reliable way to determine whether its results are useful and trustworthy.

</details>



<details>
<summary>What is Evaluation Metrics</summary>


</details>


<details>
<summary>What is Evaluation Metrics</summary>


</details>
