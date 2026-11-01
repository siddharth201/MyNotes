
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

