
<details>
<summary><b>Q. Why is Supervised Learning not suitable for a customer segmentation problem using K-Means?</b></summary>

**A.** Because the dataset does not contain labeled target values.  

**B.** Because the dataset has too many features.

**C.** Because K-Means requires labeled training data.

**D.** Because supervised learning cannot handle numerical data. 

<details>
<summary><b>Answer</b></summary>

**A** Because the dataset does not contain labeled target values.
</details>

</details>

---  

<details>
<summary><b>Q. Why does the centroid move to the mean during the update step instead of the median?</b></summary>

**A.** Because the mean minimizes the total squared distance (WCSS).

**B.** Because the median is computationally expensive.

**C.** Because the mean is always one of the data points.

**D.** Because K-Means requires an odd number of points.

<details>
<summary><b>Answer</b></summary>

**Correct answer: A**

A. Because the mean minimizes the total squared distance (WCSS).

### Why?

K-Means uses the following objective:

`WCSS = Sum of squared distances between data points and their assigned centroid.`

During the update step, K-Means recalculates the centroid to minimize this WCSS.

Mathematically:

- Mean minimizes the sum of squared deviations.
- Median minimizes the sum of absolute deviations.

### Simple example

Suppose a cluster contains these points:

`2, 4, 6, 8, 10`

Mean:

`(2 + 4 + 6 + 8 + 10) / 5 = 6`

Median:

`6`

Here both happen to be equal. But consider:

`2, 4, 6, 8, 30`

Mean = 10

Median = 6

For standard K-Means, we use the mean because its objective is to minimize squared Euclidean distances.

Remember this distinction:

| Algorithm | Center calculation | Objective                 |
| --------- | ------------------ | ------------------------- |
| K-Means   | Mean               | Sum of squared distances  |
| K-Medians | Median             | Sum of absolute distances |

Interview takeaway: K-Means uses mean, not median, because the mean is the optimal center for minimizing the sum of squared Euclidean distances.
</details>

</details>

---  

<details>
<summary><b>Q. What happens to WCSS as K increases (while keeping the dataset fixed)?</b></summary>

**A.** Always increases.

**B.** Always decreases (or stays the same).

**C** Increases then decreases.

**D.** Unpredictable.

<details>
<summary><b>Answer</b></summary>
  
**Correct answer: B**

B. Always decreases (or stays the same).

### Why?

WCSS measures the sum of squared distances between data points and their assigned cluster centroids.

When we increase K, we increase the number of clusters.

This gives K-Means more centroids, allowing data points to be assigned to potentially closer centroids.

Therefore, WCSS can decrease or remain unchanged, but it cannot increase when we consider the optimal clustering solution.

### Example

| K (Clusters) | WCSS |
| ------------ | ---- |
| 1            | 100  |
| 2            | 60   |
| 3            | 30   |
| 4            | 20   |
| 5            | 20   |
| 6            | 10   |

Notice:

- K = 1 → 2: WCSS decreases.
- K = 2 → 3: WCSS decreases.
- K = 4 → 5: WCSS remains the same.
- K = 5 → 6: WCSS decreases.

![WCSS](https://github.com/siddharth201/MyNotes/blob/main/AI_ML/Modules/Module-5-UnsupervisedLearning/Misc/Images/Screenshot%202026-11-01%20at%205.36.37%E2%80%AFPM.png)

### Why does this happen mathematically?

Suppose we have K = 2 clusters.

Now increase K to 3.

We can split an existing cluster into two smaller clusters. This gives the algorithm an opportunity to reduce the squared distances from points to their respective centroids.

It cannot make the optimal WCSS worse because the previous clustering is still a possible solution (the additional cluster can effectively remain unused).

Important distinction: This guarantee applies to the optimal WCSS for each K. In practical K-Means runs, random initialization and convergence to local minima can sometimes produce a higher observed WCSS for a larger K.

### Interview takeaway

As K increases, WCSS is monotonically non-increasing.

This is exactly why we cannot simply choose the largest K: WCSS keeps decreasing, potentially reaching zero when every data point has its own cluster. We use the Elbow Method to identify diminishing returns.
</details>
</details>  

---  

<details>
<summary><b>Q3. WCSS decreasing</b> If the WCSS keeps decreasing significantly after adding more clusters beyond the elbow point, which of the following is most likely happening?</summary>  

1. The model is learning better.  

2. Overfitting is occurring.  

3. The dataset is getting larger.  

4. TSS is reducing.



</details>

