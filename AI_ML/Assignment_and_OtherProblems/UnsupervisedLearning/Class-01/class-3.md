

<details>
<summary><b>Q. Which method in Hierarchical Clustering merges the clusters with minimum distance between any pair of points?</b></summary>

**A.** Average Linkage

**B.** Complete Linkage

**C.** Single Linkage

**D.** Centroid Linkage

<details>
<summary><b>Answer</b></summary>

**Correct Answer: Option C**

**Single Linkage**

### Explanation

Single Linkage is a linkage criterion used in Agglomerative Hierarchical Clustering.

It calculates the minimum distance between any pair of data points belonging to two different clusters.

The two clusters having the smallest minimum distance are merged together.

### Mathematical formula

$$d(C_i,C_j)=\min_{x\in C_i,\ y\in C_j}d(x,y)$$

Where:

- $C_i$ and $C_j$ = Two different clusters.
- $x$ = A data point belonging to Cluster $C_i$.
- $y$ = A data point belonging to Cluster $C_j$.
- $d(x,y)$ = Distance between two data points.

### Numerical example

Suppose we have two clusters:

**Cluster A:**

```python
A = [1, 2, 3]
```

**Cluster B:**

```python
B = [8, 10, 12]
```

Assume these are points on a one-dimensional axis and we use Euclidean distance.

Let's calculate all pairwise distances:

| Cluster A | Cluster B | Distance |
|---:|---:|---:|
| 1 | 8 | 7 |
| 1 | 10 | 9 |
| 1 | 12 | 11 |
| 2 | 8 | 6 |
| 2 | 10 | 8 |
| 2 | 12 | 10 |
| 3 | 8 | 5 |
| 3 | 10 | 7 |
| 3 | 12 | 9 |

The minimum distance is 5.

Therefore:

$$Single\ Linkage = \boxed{5}$$

Single Linkage considers only the closest pair of points between the two clusters.

### Understanding different linkage methods

| Linkage Method | Distance Calculation |
|---|---|
| Single Linkage | Minimum pairwise distance |
| Complete Linkage | Maximum pairwise distance |
| Average Linkage | Average of all pairwise distances |
| Centroid Linkage | Distance between cluster centroids |

### Why are the other options incorrect?

- **A. Average Linkage:** Calculates the average distance between all pairs of points belonging to two clusters.
- **B. Complete Linkage:** Calculates the maximum distance between any pair of points belonging to two clusters.
- **C. Single Linkage:** Correct. Calculates the minimum distance between any pair of points belonging to two clusters.
- **D. Centroid Linkage:** Calculates the distance between the centroids (means) of two clusters.

### Interview takeaway

Remember these four linkage methods:

- **Single:** Minimum distance (closest points).
- **Complete:** Maximum distance (farthest points).
- **Average:** Average distance (all pairs).
- **Centroid:** Distance between cluster means.

**Ultimate intuition:** Single Linkage merges two clusters if even one pair of points, one from each cluster, is sufficiently close.

**Important:** Single Linkage is prone to the chaining effect, where clusters can gradually merge through a sequence of nearby points, even when the overall clusters are far apart.

</details>
</details>
