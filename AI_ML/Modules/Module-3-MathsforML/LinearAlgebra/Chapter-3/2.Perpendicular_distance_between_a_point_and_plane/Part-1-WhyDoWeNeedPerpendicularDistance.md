# Part 1 — Why Do We Need Perpendicular Distance?

Before deriving the point-to-plane distance formula, we need to answer a more fundamental question:

> **What exactly should “distance from a point to a plane” mean?**

This may sound obvious, but there is an important geometric idea hidden inside it.

---

## 1.1 The Problem

Consider a plane represented by

```math id="p1-plane"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

We have a point $`B`$ that is **not necessarily on the plane**.

Let its position vector be

```math id="p1-point"
\overrightarrow{x_2}
```

We want to calculate the distance between point $`B`$ and the plane.

The first question is:

> **Which distance should we measure?**

---

## 1.2 There Are Infinitely Many Paths

Imagine connecting point $`B`$ to different points on the plane.

You could draw:

* one line from $`B`$ to point $`A_1`$,
* another line from $`B`$ to point $`A_2`$,
* another to $`A_3`$,
* and so on.

Each path has a different length.

So there are infinitely many possible distances between the point and different points on the plane.

But when mathematics says:

> **distance between a point and a plane**

it means something very specific.

### The shortest possible distance.

And that shortest path is always **perpendicular to the plane**.

---

# 1.3 Why Is the Shortest Path Perpendicular?

This is the same geometric principle we encounter with a point and a line.

Suppose you have a point outside a line.

You can connect the point to the line in many ways:

```text
Point
  ●
 /|\
/ | \
/  |  \
────────────
  Line
```

The perpendicular segment is the shortest one.

The same principle extends to a plane:

```text
Point
   ●
   |
   |  ← shortest path
   |
──────────────
    Plane
```

Therefore:

```text
Shortest distance
        ↓
Perpendicular distance
        ↓
Direction of the normal vector
```

This is why our previous chapter about the **normal vector** is directly relevant.

---

# 1.4 The Connection With Our Previous Topic

In the previous chapter, we proved that:

```math id="p1-normal"
\boxed{
\overrightarrow{w}\perp\text{plane}
}
```

That result is now extremely useful.

Since $`\overrightarrow{w}`$ is perpendicular to the plane, it gives us exactly the direction in which we should travel to reach the plane using the shortest path.

So:

```text
Normal vector w
       ↓
Perpendicular to plane
       ↓
Shortest direction
       ↓
Point-to-plane distance
```

This is the key connection between the two chapters.

---

# 1.5 Why Can't We Simply Use the Distance Between Two Points?

Suppose:

* $`B`$ is our external point.
* $`A`$ is some point on the plane.

Then we can certainly calculate:

```math id="p1-ab"
\|\overrightarrow{AB}\|
```

But there is a problem.

The value depends on **which point $`A`$ we choose on the plane**.

For example:

```text
              B
             ●
           / | \
          /  |  \
         /   |   \
        ●    ●    ●
       A₁   A₂   A₃
────────────────────
          Plane
```

The lengths

```math id="p1-three-distances"
\|\overrightarrow{A_1B}\|,
\qquad
\|\overrightarrow{A_2B}\|,
\qquad
\|\overrightarrow{A_3B}\|
```

are generally different.

Therefore:

> **The distance to an arbitrary point on the plane is not the point-to-plane distance.**

We need the particular point on the plane that produces the **shortest path**.

That point is where the perpendicular from $`B`$ meets the plane.

---

# 1.6 Why Does the Normal Vector Solve This Problem?

Now the previous chapter becomes powerful.

We know:

```math id="p1-normal-vector"
\overrightarrow{w}\perp\text{plane}
```

Therefore, if we start from $`B`$ and move in the direction of $`\overrightarrow{w}`$, we are moving **perpendicularly toward the plane**.

So instead of searching through infinitely many possible paths, we can focus on one special direction:

```text
                 B
                 ●
                 |
                 |  ← direction of w
                 |
                 ● A
────────────────────────
          Plane
```

This turns a geometric distance problem into a **vector projection problem**.

And that is exactly what we learned in our previous topic.

---

# 1.7 The Projection Connection

Recall what we learned about projection.

If we have a vector:

```math id="p1-vector-ab"
\overrightarrow{AB}
```

and want to know how much of that vector lies in the direction of $`\overrightarrow{w}`$, we project it onto $`\overrightarrow{w}`$.

The scalar projection is:

```math id="p1-scalar-projection"
\operatorname{comp}_{\overrightarrow{w}}
(\overrightarrow{AB})
=
\frac{
\overrightarrow{AB}^{T}\overrightarrow{w}
}{
\|\overrightarrow{w}\|
}
```

That scalar tells us:

> **How much of the movement from $`A`$ to $`B` occurs in the normal direction.**

And because the normal direction is perpendicular to the plane, that component is exactly what we need for the perpendicular distance.

---

# 1.8 The Critical Insight

Suppose:

```text
A → point on plane
B → external point

AB → vector connecting them

w → normal to plane
```

Then:

```text
              B
              ●
             /|
            / |
           /  |  ← component along w
          /   |
         ●────┘
         A

───────────────
     Plane
```

The vector $`\overrightarrow{AB}`$ contains two conceptual components:

```text
AB
├── component parallel to plane
│
└── component perpendicular to plane
       ↓
   along w
       ↓
   desired distance
```

Therefore:

> **The perpendicular distance is the magnitude of the projection of $\overrightarrow{AB}$ onto the normal vector $\overrightarrow{w}$.**

This is the central idea of the entire derivation.

---

# 1.9 Why This Is Better Than Memorizing a Formula

At this point, we have not memorized:

```math id="p1-final-formula"
\boxed{
d=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x_2}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
}
```

And that's intentional.

Instead, we understand:

```text
Point-to-plane distance
        ↓
Shortest distance
        ↓
Perpendicular distance
        ↓
Normal direction
        ↓
Projection onto normal
        ↓
Algebra
        ↓
Distance formula
```

The formula will therefore emerge naturally in the next parts.

---

# 1.10 Connection to Machine Learning

This idea becomes particularly important in Machine Learning.

Consider a linear decision boundary:

```math id="p1-ml-boundary"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

A data point can be:

```text
      Class A

        ●
        |
        |  distance
        |
────────┼────────  Decision Boundary
        |
        |
        ●

      Class B
```

The perpendicular distance tells us:

> **How far the data point is from the decision boundary.**

This is much more meaningful than simply knowing that the point is somewhere in the feature space.

Later in Machine Learning, this geometric idea becomes important when we study how confidently a linear model separates different classes.

For now, we only need the geometric foundation.

---

# 1.11 What We Have Established

We can now summarize the reasoning:

```text
A point lies outside a plane
          ↓
There are infinitely many paths
from the point to the plane
          ↓
We need the shortest one
          ↓
Shortest path is perpendicular
to the plane
          ↓
Normal vector w is perpendicular
to the plane
          ↓
Therefore the shortest path
is along w
          ↓
So calculate the projection
onto w
```

This is exactly why **projection, unit vectors, and normal vectors** were important prerequisites for this topic.

---

# 1.12 The Question We Need to Answer Next

We now know **what** we need to calculate:

> The component of $\overrightarrow{AB}$ along the normal direction $\overrightarrow{w}$.

But there is still one important question:

### How do we mathematically extract that perpendicular component?

That takes us directly to the next part:

# **Part 2 — Geometric Setup: Point, Plane and Normal Vector**

There we will carefully define $`\overrightarrow{x_1}`$, $`\overrightarrow{x_2}`$, $`\overrightarrow{AB}`$, and $`\overrightarrow{w}`$ before beginning the derivation.

