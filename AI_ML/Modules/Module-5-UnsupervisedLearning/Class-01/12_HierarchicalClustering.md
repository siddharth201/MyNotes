
[Chat-GPT Link](https://chatgpt.com/s/t_6af45e546dc48191b5697b667267c36e)

# Hierarchical Clustering

## 1. What is Hierarchical Clustering?

Hierarchical Clustering is an Unsupervised Learning algorithm that groups similar data points into clusters and creates a hierarchy (tree-like structure) of those clusters.

Simple intuition:

Imagine a school with 100 students.

- Students with similar interests form small groups.
- Similar groups can be combined into larger groups.
- Eventually, all students can become part of one large group.

This creates a hierarchy of clusters.

![Hierarchical clustering explained](https://images.openai.com/static-rsc-4/XrVX5Wvf_U6zjKegr17k-tC5kejNWt8xJ71Rs04ssgHKZrxnojiEr2xWo4AE35tV97_D5FqhaZbltG6q3YVDJIMxs_KH2I-ZLvUli8INHHsLiVehPPzO_3tzGOC6jrGpwLSk5dnx6V_N12U3OT3j1rHanGRxDNIpBZ-BYDcIRq8?purpose=inline)

Key idea: Instead of directly creating a fixed number of clusters, Hierarchical Clustering builds a tree of relationships between data points. We can later decide where to cut this tree to get our desired clusters.

## 2. Types of Hierarchical Clustering

There are two main approaches:

![Hierarchical Clustering: Agglomerative and Divisive Explained | Built In](https://images.openai.com/static-rsc-4/SU_q3Kl6o1rwHvNHdVsGuWUfjRNdOUqY-lZKdVPQ_gLEViO9e8jI6KizU2Op-EfJmmX4sNQmkhNX1TXyYJBEuXIDsXNDzblQMbFK7c3-YFYsqTum_v6Q9C_43LnY2llyGgi-SJPT4JPV8uSdKJj8f6wwHqIEW5v_h3bP9Abq6kU?purpose=inline)


**1\. Agglomerative Clustering (Bottom-Up)**

- Initially, every data point is a separate cluster.
- The closest clusters are repeatedly merged.
- Eventually, all points become one cluster.

  More commonly used

![🌳 Hierarchical Clustering in Machine Learning | by Sharwari | Medium](https://images.openai.com/static-rsc-4/Nm2E2e-YUmf4L2gpG_81l4J2w_HKMoWlEVnOgieHreRX96jgdUkzprrTx_xqWJty3A0ZoXC6Y3N_aIjBTFS7C6ZLqqw7YrwUQU9lMfgWv3eW_xMktoJINPm3y8EZeuf0osv_SGhbBM99etZxZoP1BDxncmJzuSS2EFLz69zbN4s?purpose=inline)

**2\. Divisive Clustering (Top-Down)**

- Initially, all data points belong to one cluster.
- The cluster is repeatedly divided into smaller clusters.
- This continues until the desired level of separation is reached.

Easy way to remember:

- Agglomerative = Merge (Bottom-Up).
- Divisive = Split (Top-Down).

We will mainly focus on Agglomerative Clustering because it is more commonly used.

## 3. How does Agglomerative Clustering work?

Suppose we have five data points: A, B, C, D and E.

![Hierarchical Clustering: Complete Guide with Dendrograms, Linkage Criteria & Implementation - Interactive | Michael Brenndoerfer | Michael Brenndoerfer](https://images.openai.com/static-rsc-4/CRZQNKwr5ABWvK3CYaEJ_JZZ1qh-GXzb7RjAFyCuLUK2dpjhs8KJZLt7mSZ3eWSVlRMKFaYDMxI5hkKIDfFXCf9HIGVAWR2yc3Rm4FUoiL_2c_p7GNvQe48seSpEYo6oFf7sdFd_DGfppDWjnzTiXpxVDemJkGFTdBGvP5Yh-gU?purpose=inline)


Step 1: Start with individual clusters.

Initially, every data point is its own cluster.

$\\{A\\},\\{B\\},\\{C\\},\\{D\\},\\{E\\}$

We have five clusters.

Step 2: Calculate distances.

Calculate the distances between data points using a distance metric such as Euclidean distance.

Step 3: Merge the two closest clusters.

Suppose A and B are closest:

\\[ \\{A\\},\\{B\\}\rightarrow\\{A,B\\} \\]

Now we have four clusters:

\\[ \\{A,B\\},\\{C\\},\\{D\\},\\{E\\} \\]

Step 4: Recalculate distances between clusters.

Now we need to calculate the distance between clusters, not just individual points.

But how do we calculate the distance between two clusters containing multiple points?

This is where Linkage comes into the picture.

Step 5: Repeat the process.

Continue merging the closest clusters until all points become one cluster, or until the desired number of clusters is reached.

![The Beginner’s Guide to Clustering in Machine Learning | by Utsav Desai | Medium](https://images.openai.com/static-rsc-4/YIVFX04JFGrCRlEgijAMmDTy5jL6DAoX4Z29FxXKR4C8Zbz7prkijlhsSN7M5sZbwGb-92VEI9H_JFjWYSQSLgQUDyDFFvCxYF16Y-eeArwMKX0cPrIa5wdg0UQTTJRdTvnZ1D-xg3bZTbOBVwpPI6qASYbZNC7HQqbGcgonC1k?purpose=inline)

Important: Agglomerative Clustering is greedy and irreversible. Once two clusters are merged, the algorithm does not undo that decision later.

## 4. What is Linkage?

Linkage defines how we calculate the distance between two clusters.

Suppose we have two clusters, A and B, each containing multiple data points.

We need a rule to calculate the distance between them.

There are four commonly used linkage methods.

### 1. Single Linkage — Minimum Distance

Distance between two clusters is the minimum distance between any pair of points from the two clusters.

\\[ D(A,B)=\min\_{a\in A,b\in B}d(a,b) \\]

Intuition: Find the closest pair of points between the two clusters.

![An Introduction to Hierarchical Clustering in Python | DataCamp](https://images.openai.com/static-rsc-4/yLXZqUusLxmCAYGFqLwLzMbBNjzGzEpLAi9pzUc_g1SHBcLhb5CpmwnSUKBmKbGGpYbZWQqBoHQdNvk9aER3kxR-6H3yUl1q0vjAv3HEI3KPRuFgaSl0l9QYV8iLG7IjnanEVoNR_ApNtnBZ2PW0dI8j7VQgFdp0LCk052bRNUU?purpose=inline)

- Can form elongated clusters.
- Prone to the Chaining Effect.

What is the Chaining Effect?

Imagine two groups connected by a few intermediate points. Single Linkage may merge them into one cluster because it only considers the closest pair of points.

### 2. Complete Linkage — Maximum Distance

Distance between two clusters is the maximum distance between any pair of points from the two clusters.

\\[ D(A,B)=\max\_{a\in A,b\in B}d(a,b) \\]

Intuition: Find the farthest pair of points between the two clusters.

![An Introduction to Hierarchical Clustering in Python | DataCamp](https://images.openai.com/static-rsc-4/tBgQRHO8khDZ8EGelwzKWq53AHkqkRKF3bfXL3tyU0vHxaPB6jxUZ_ZqW8m0vM1ZYhz12VdYlKXd1yDErVmBkEUGSzIes9x4rpcY3dFWqsmK1JVNRG0iMYIeDOFKflMrfAf-uC8lqcjswu5rdBlWiPVt57N3mnUiyMncVHEbEHQ?purpose=inline)

- Tends to produce compact clusters.
- Can be sensitive to outliers because one distant point can increase the maximum distance.

### 3. Average Linkage — Average Distance

Distance between two clusters is the average distance between all cross-cluster pairs of points.

\\[ D(A,B)= \frac{1}{|A||B|} \sum\_{a\in A}\sum\_{b\in B}d(a,b) \\]

Intuition: Calculate all pairwise distances between the two clusters and take their average.

![Definitive Guide to Hierarchical Clustering with Python and Scikit-Learn](https://images.openai.com/static-rsc-4/HVA-MwyrF7tPvmCTyQewialB_E8PeVJ1UMreVMKMcZMEzwE-YhGmSHbmr3T1yldkHpeCa5awm_d9KdoET5gX6csYRY0d4yXG73t9gnkdMKKcba5c6_BbhJ4j7yPwi9s4GQMtAO4MhJkSJIYCUbay5Q-1qsy7yFp6aNuQyKZFh3s?purpose=inline)

- Considers all cross-cluster pairwise distances.
- Provides an alternative to minimum and maximum distance approaches.
- It is not inherently robust to outliers or noise.

### 4. Ward's Linkage — Minimum Variance

Ward's method merges the two clusters that produce the smallest increase in total within-cluster sum of squared errors.

Simple intuition:

Aisa merge choose karna jisse clusters ke andar overall variation minimum increase ho.

Its mathematical objective is:

\\[ \boxed{ \Delta ESS\_{A,B}= \frac{|A||B|}{|A|+|B|} \\|\mu_A-\mu_B\\|^2 } \\]

Where:

- \\(|A|\\), \\(|B|\\) = Number of data points in each cluster.
- \\(\mu_A\\), \\(\mu_B\\) = Centroids of the two clusters.
- \\(\Delta ESS\\) = Increase in within-cluster squared error after merging.

![Definitive Guide to Hierarchical Clustering with Python and Scikit-Learn](https://images.openai.com/static-rsc-4/M3HnArZALdLlIK4fMlY6xUJISu7OuSmw6MSAEDyVfyxAePS_cLl4_ZDp30EaovAL0tBr0mp94y80LgdD4yYoX6ViWKsjvEu5e9-yCPvACAJqYDZ7z3U9EsFnwrcX-MBzKFA1RX67eHPxtr1RwOofAMkm82vDAB4ETt_-ojhOgMg?purpose=inline)


Characteristics:

- Tends to produce compact clusters.
- Often favors relatively balanced cluster sizes.
- Uses Euclidean geometry in its standard formulation.
- Cannot be combined with arbitrary metrics such as Manhattan or Cosine distance in standard implementations.

### Quick comparison of Linkage methods

| Linkage  | How distance is calculated                  |
| -------- | ------------------------------------------- |
| Single   | Minimum pairwise distance                   |
| Complete | Maximum pairwise distance                   |
| Average  | Average pairwise distance                   |
| Ward     | Minimum increase in within-cluster variance |

Interview tip: Don't confuse Ward Linkage with simply calculating the distance between two centroids. It considers cluster sizes as well as centroid separation.

## 5. What is a Dendrogram?

A Dendrogram is a tree-like diagram that visualizes how clusters are merged during Hierarchical Clustering.

It helps us understand:

- Which clusters were merged.
- The order in which they were merged.
- The distance at which they were merged.
- How many clusters we can obtain at different levels.

![Hierarchical Clustering: Build Trees That Reveal Hidden Data Structure - perfecXion.ai](https://images.openai.com/static-rsc-4/bJ6M6_OUFntW1iMxdH1UoVn5e6n7lLMAnb_4oP_CMwlNok43foqdj0HWHBra1sVLSqOK5cHGyb2fCvEVR0hHIJ2ArDNDrUs7vn_JIdPzndDDI8Kw1HyL4dIKv1VMLU6qer3ZSHYj4fUCkhBpBo4v6B8NRP5qXZcmEdnflgfA-og?purpose=inline)

### How to read a Dendrogram?

- Leaves: Individual data points.
- Branches: Show how clusters are connected.
- Merge height: Represents the linkage distance or criterion value at which clusters were merged.

### How do we choose the number of clusters?

We draw a horizontal line across the dendrogram.

The number of vertical branches intersected by that line gives the number of clusters.

For example:

- One cut may produce 3 clusters.
- A different cut may produce 4 clusters.

How do we choose a suitable cut?

Look for a relatively large vertical gap between successive merge heights.

Why?

A large jump in merge height suggests that the next merge would combine clusters that are relatively dissimilar.

Cutting within that gap can be a reasonable choice.

Remember: This is a heuristic, not a guarantee of the optimal number of clusters.

Important distinction:

We can build the full hierarchy without deciding \\(K\\) beforehand. However, to obtain final cluster labels, we need either:

- A desired number of clusters (`n_clusters`), or
- A distance threshold (`distance_threshold`).

## 6. Time and Space Complexity

Let:

- \\(N\\) = Number of data points.
- \\(d\\) = Number of features.

Hierarchical Clustering can become computationally expensive because it needs to consider relationships between many data points.

### Space Complexity

A pairwise distance matrix stores distances between every pair of data points.

Its size grows approximately as:

\\[ N\times N \\]

Therefore:

\\[ \boxed{O(N^2)\text{ space}} \\]

### Time Complexity

Time complexity depends on the implementation and linkage method.

For example, optimized implementations in SciPy have the following complexities:

| Linkage method | Time complexity |
| -------------- | --------------- |
| Single         | \\(O(N^2)\\)    |
| Complete       | \\(O(N^2)\\)    |
| Average        | \\(O(N^2)\\)    |
| Ward           | \\(O(N^2)\\)    |

Simpler implementations can require \\(O(N^3)\\) time.

Interview takeaway: Hierarchical Clustering can become expensive in both time and memory for large datasets. There is no universal dataset-size cutoff; practical feasibility depends on the implementation, hardware and dataset.

## 7. Hierarchical Clustering vs K-Means

| Feature            | K-Means                                          | Hierarchical Clustering                      |
| ------------------ | ------------------------------------------------ | -------------------------------------------- |
| Approach           | Partition-based                                  | Hierarchy-based                              |
| Cluster structure  | Flat clusters                                    | Nested hierarchy                             |
| Number of clusters | Usually specified beforehand                     | Can be chosen after inspecting the hierarchy |
| Initialization     | Requires initial centroids                       | No centroid initialization step              |
| Output             | Cluster labels and centroids                     | Dendrogram / hierarchy                       |
| Scalability        | Generally better for large datasets              | Can be expensive for large datasets          |
| Distance metrics   | Standard K-Means uses squared Euclidean distance | Depends on linkage and metric                |

## 8. Advantages and Disadvantages

Advantages

1. We can explore different numbers of clusters without rebuilding the full hierarchy.
2. Dendrogram provides a visual representation of cluster relationships.
3. Different linkage methods provide different ways of defining cluster similarity.
4. Useful for discovering nested structures in data.

Disadvantages

1. Can require \\(O(N^2)\\) memory.
2. Can be computationally expensive for large datasets.
3. Agglomerative merging decisions cannot be reversed.
4. Results depend on the distance metric and linkage method.
5. Sensitive to feature scaling, so numerical features often need normalization or standardization.

## 9. Python Implementation

### A. Using Scikit-learn

```
from sklearn.cluster import AgglomerativeClusteringmodel = AgglomerativeClustering(    n_clusters=3,    metric="euclidean",    linkage="ward")labels = model.fit_predict(X)print("Cluster Labels:")print(labels)
```

Understanding the parameters:

- `n_clusters=3`: We want three final clusters.
- `metric="euclidean"`: Use Euclidean distance.
- `linkage="ward"`: Use Ward's variance-minimization method.
- `fit_predict(X)`: Fit the model and return cluster labels.

We can also use a distance threshold instead of specifying the number of clusters:

```
model = AgglomerativeClustering(    n_clusters=None,    distance_threshold=10,    linkage="ward")labels = model.fit_predict(X)
```

Here, merging stops when the distance threshold is reached. The value `10` is just an example; the appropriate threshold depends on the dataset and linkage method.

### B. Visualizing a Dendrogram using SciPy

```
import matplotlib.pyplot as pltfrom scipy.cluster.hierarchy import dendrogram, linkage# Build hierarchical clusteringZ = linkage(X, method="ward")# Plot dendrogramplt.figure(figsize=(10, 5))dendrogram(Z)plt.title("Hierarchical Clustering Dendrogram")plt.xlabel("Data Points")plt.ylabel("Merge Distance")plt.show()
```

Note: Ward Linkage uses Euclidean distance in this example.

## 10. Interview-Friendly Definition

Hierarchical Clustering is an unsupervised learning technique that creates a hierarchy of clusters. It has two approaches: Agglomerative (bottom-up), which repeatedly merges the closest clusters based on a linkage criterion, and Divisive (top-down), which repeatedly splits clusters. A dendrogram visualizes the hierarchy and helps us select the final number of clusters by choosing a suitable cut level.

## 11. Quick Revision

Remember these six concepts:

1. Hierarchical Clustering → Creates a hierarchy of clusters.
2. Agglomerative → Bottom-Up (Merge).
3. Divisive → Top-Down (Split).
4. Linkage → Defines distance between clusters.
5. Dendrogram → Visualizes the merging hierarchy.
6. Horizontal Cut → Helps determine the number of clusters.

Four important Linkage methods:

- Single → Minimum distance.
- Complete → Maximum distance.
- Average → Average distance.
- Ward → Minimum increase in within-cluster variance.

Complexity reminder:

- Space: Commonly \\(O(N^2)\\).
- Time: Depends on implementation and linkage method.

## 12. Check Your Understanding

Q1. What happens initially in Agglomerative Clustering?

All points belong to one cluster

Every point is a separate cluster

K centroids are selected randomly

Q2. Which linkage uses the maximum pairwise distance?

Single

Complete

Average

Ward

Q3. Which linkage minimizes the increase in within-cluster variance?

Single

Complete

Average

Ward

Q4. What does a horizontal cut in a dendrogram help determine?

Number of features

Number of clusters

Number of iterations

0 of 4 answeredReset quiz

Ultimate intuition: K-Means directly divides data into a fixed number of clusters. Hierarchical Clustering builds a tree of relationships between data points. We can inspect that tree and decide at which level we want to divide the data into clusters.


