# Why is Single Linkage Prone to the Chaining Effect?

Let's understand this with a simple numerical example.

## 1. First, understand Single Linkage

In Hierarchical Clustering, Single Linkage calculates the distance between two clusters using the minimum distance between any pair of points belonging to those clusters.

In simple words:

If even one point from Cluster A is close to one point from Cluster B, Single Linkage considers the clusters close to each other.

## 2. Numerical Example

Suppose we have eight data points arranged on a straight line:

| Point | Position |
| ----- | -------- |
| A     | 1        |
| B     | 2        |
| C     | 3        |
| D     | 4        |
| E     | 5        |
| F     | 6        |
| G     | 7        |
| H     | 8        |

The arrangement looks like this:

Let's calculate some distances:

- A to B = |1 - 2| = 1
- B to C = |2 - 3| = 1
- C to D = |3 - 4| = 1
- D to E = |4 - 5| = 1
- E to F = |5 - 6| = 1
- F to G = |6 - 7| = 1
- G to H = |7 - 8| = 1

However, the distance between A and H is:

A to H = |1 - 8| = 7 units.

So, the endpoints are far apart, even though consecutive points are very close.

## 3. How does the Chaining Effect happen?

Let's assume we merge clusters at a distance threshold of 1 unit.

Step 1: Merge A and B

Distance between A and B = 1.

They merge into a cluster:

Cluster 1 =&#x20;

Step 2: Add C

Now we calculate the distance between point C and the existing cluster .

- Distance between A and C = 2
- Distance between B and C = 1

Single Linkage selects the minimum distance.

Minimum distance = min(2, 1) = 1.

Therefore, C joins the cluster.

Cluster 1 =&#x20;

Step 3: Add D

Calculate the distance between D and the existing cluster .

- A to D = 3
- B to D = 2
- C to D = 1

Minimum distance = min(3, 2, 1) = 1.

Therefore, D also joins.

Cluster 1 =&#x20;

Step 4: Continue the process

The same thing happens with the remaining points:

- E joins through D.
- F joins through E.
- G joins through F.
- H joins through G.

Eventually, all eight points become one cluster:

Final cluster

A

B

C

D

E

F

G

H

All eight points are now connected, even though A and H are 7 units apart.

## 4. Why is this called the Chaining Effect?

Look at what happened:

- Every consecutive pair of points was only 1 unit apart.
- Single Linkage kept merging points through these nearby connections.
- Eventually, the entire sequence became one cluster.
- But the first and last points were 7 units apart.

The important observation: Single Linkage doesn't require every point to be close to every other point. It only needs a nearby connection to the existing cluster.

This creates a chain of connected points, which is called the Chaining Effect.

## 5. Single Linkage vs Complete Linkage

| Single Linkage                       | Complete Linkage                    |
| ------------------------------------ | ----------------------------------- |
| Uses minimum pairwise distance.      | Uses maximum pairwise distance.     |
| Can create long, elongated clusters. | Generally favours compact clusters. |
| Prone to chaining.                   | Less prone to chaining.             |

Complete Linkage is less prone to chaining because it considers the farthest pair of points between two clusters rather than just the closest pair.

## 6. Real-world Analogy

Imagine eight people standing in a line.

- A knows B.
- B knows C.
- C knows D.
- This continues until H.

Everyone is connected through a chain of relationships.

But does that mean A and H are close to each other?

No! They may be far apart, but they are connected through intermediate people.

That is exactly how Single Linkage can connect distant points through nearby intermediate points.

## 7. Interview-ready Answer

Why is Single Linkage prone to the Chaining Effect?

Single Linkage uses the minimum distance between any pair of points belonging to two clusters. Therefore, clusters can merge through a sequence of nearby points, even when their endpoints are far apart. This can create long and elongated clusters instead of compact groups.

## 8. Quick Revision

- Single Linkage → Minimum distance.
- Chaining Effect → Connecting distant points through intermediate nearby points.
- Main drawback → Can create elongated clusters.
- Alternative → Complete Linkage is generally less prone to chaining.

Remember: Single Linkage needs just ONE close connection to merge two clusters.
