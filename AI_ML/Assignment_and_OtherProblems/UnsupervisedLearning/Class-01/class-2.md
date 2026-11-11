
<details>
<summary><b>Q. ClusterMart's original K-Means model produced messy segments for a group of customers whose behavior formed two interleaving crescent shapes rather than round blobs. Which K-Means assumption does this most directly violate?</b></summary>

**A.** Clusters must all have the same WCSS.

**B.** Clusters are assumed to be roughly spherical (convex).

**C.** K must always be less than 4.

**D.** Distance must be measured using Manhattan distance.

<details>
<summary><b>Answer</b></summary>

**Correct Answer: Option B**

**Clusters are assumed to be roughly spherical (convex).**

### Explanation

K-Means works best when clusters are:

- Roughly spherical or convex in shape.
- Relatively compact.
- Separated based on distance from their centroids.

However, K-Means struggles when the actual clusters have complex, non-convex shapes, such as interleaving crescents or moons.

### Why?

K-Means assigns each data point to the nearest centroid using distance (typically Euclidean distance).

This creates decision boundaries between clusters that are linear (perpendicular bisectors between centroids).

Consequently, K-Means naturally produces compact, convex regions rather than complex, curved cluster boundaries.

When two clusters have interleaving crescent shapes, assigning points based on their nearest centroid cannot correctly capture their actual structure.

### Visualization

Consider two interleaving crescent-shaped clusters:

![Interleaving Moons](https://scikit-learn.org/stable/_images/sphx_glr_plot_cluster_comparison_001.png)

K-Means may incorrectly divide these crescent-shaped structures because it tries to group points around their respective centroids.

Algorithms such as DBSCAN and Spectral Clustering can handle non-convex cluster structures more effectively.

### Why are the other options incorrect?

- **A. Same WCSS:** K-Means does not require every cluster to have the same WCSS. WCSS measures the within-cluster sum of squared distances.
- **B. Spherical (convex):** Correct. K-Means struggles with non-convex structures such as interleaving crescents.
- **C. K less than 4:** There is no such restriction. K can be any valid positive integer up to the number of data points.
- **D. Manhattan distance:** Standard K-Means typically uses squared Euclidean distance, not Manhattan distance. However, this is not the assumption violated by the crescent-shaped data.

### Interview takeaway

Remember:

- K-Means → Works best with compact, roughly spherical (convex) clusters.
- DBSCAN → Can identify arbitrarily shaped clusters and handle noise.
- Spectral Clustering → Can identify complex, non-convex cluster structures.

**Ultimate intuition:** K-Means groups data around centroids. If the natural shape of the data cannot be represented well by centroid-based convex regions, K-Means may produce poor clustering results.

</details>
</details>

