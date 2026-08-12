
# Part 1 — Why Do We Need Distance of Origin from a Plane?

We have just learned how to calculate the **perpendicular distance between any point and a plane**.

Now we are going to study a very specific but important case:

> **What is the perpendicular distance of the origin from a plane?**

This is not a completely new formula. It is a **special case of the point-to-plane distance formula** we already derived.

---

## 1.1 First Recall: What Problem Did We Solve?

For a plane:

```math id="p1-recall-plane"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

and an arbitrary point $\overrightarrow{x}$, we derived:

```math id="p1-recall-distance"
\boxed{
d=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
}
```

The meaning was:

> Find the shortest, perpendicular distance between the point and the plane.

We already understand **why** this formula works through projection onto the normal vector.

---

# 1.2 Now Make the Point the Origin

The origin is simply the point:

```math id="p1-origin"
\boxed{
\overrightarrow{x}=\overrightarrow{0}
}
```

In 2D:

```math id="p1-origin-2d"
\overrightarrow{0}
=
\begin{bmatrix}
0\\
0
\end{bmatrix}
```

In 3D:

```math id="p1-origin-3d"
\overrightarrow{0}
=
\begin{bmatrix}
0\\
0\\
0
\end{bmatrix}
```

So the question becomes:

> **How far is the origin from the plane?**

---

# 1.3 Why Study the Origin Separately?

At first, you might think:

> "Why do we need a separate topic? We already know point-to-plane distance."

That's a very good question.

The reason is that the origin makes the mathematics **much simpler**, and this simplicity exposes something important about the plane equation.

Consider:

```math id="p1-plane"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

For an arbitrary point, we have to calculate:

```math id="p1-general"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

But for the origin:

```math id="p1-origin-sub"
\overrightarrow{x}=\overrightarrow{0}
```

Therefore:

```math id="p1-origin-dot"
\overrightarrow{w}^{T}\overrightarrow{0}=0
```

So the entire dot-product term disappears.

What remains is simply related to:

```math id="p1-w0"
w_0
```

This gives us a much deeper understanding of the role of the **bias/constant term**.

---

# 1.4 Geometric Picture

Imagine a plane somewhere in space:

```text id="p1-geometry"
                    Plane
          ─────────────────────
                 ⟂
                 │
                 │ d
                 │
                 ●
               Origin
```

The shortest path from the origin to the plane must be perpendicular to the plane.

And because $\overrightarrow{w}$ is the normal vector:

```math id="p1-normal"
\boxed{
\overrightarrow{w}\perp\text{plane}
}
```

the distance from the origin is measured **along the direction of $\overrightarrow{w}$**.

So once again, our previous concepts come together:

```text id="p1-flow"
Origin
   ↓
Vector to the plane
   ↓
Project along normal direction
   ↓
Perpendicular distance
```

---

# 1.5 The Important Insight

The plane equation is:

```math id="p1-equation"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

Think of the two terms as:

```text id="p1-terms"
wᵀx
 ↓
depends on the point

w₀
 ↓
constant / bias
```

When the point is the origin:

```math id="p1-zero-term"
\overrightarrow{w}^{T}\overrightarrow{0}=0
```

Therefore, the origin's relationship with the plane depends entirely on $w_0$, after accounting for the scale of $\overrightarrow{w}$.

This is the key reason this special case is worth studying.

---

# 1.6 Connection to What We Already Know

We should **not** memorize a new formula yet.

Instead, start from the formula we already know:

```math id="p1-known"
\boxed{
d=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
}
```

Then simply ask:

> What happens when $\overrightarrow{x}=\overrightarrow{0}$?

That will naturally lead us to the simplified origin-to-plane formula in the next parts.

This is an important learning habit:

> **Whenever possible, derive a special case from a general formula instead of memorizing another formula.**

---

# 🎯 Ultimate Goal in ML — In Simple Terms

This is the permanent ML connection we will keep throughout this topic.

A linear ML model creates a boundary:

```math id="p1-ml-boundary"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

Now imagine asking:

> **How far is the origin of our feature space from this boundary?**

That tells us where the decision boundary is positioned relative to the reference point of the coordinate system.

In simple terms:

```text id="p1-ml-simple"
Plane / Decision Boundary
          ↑
          │
          │ distance
          │
        Origin
```

And because the origin is the simplest possible point, studying this case helps us understand **how the bias term $w_0$ controls the position of a linear boundary**.

We will connect this more deeply to ML after deriving the formula.

---

# 🧠 Part 1 Mental Model

Don't think:

> "Origin distance is another formula."

Think:

> **"It is the exact same point-to-plane problem, but the point happens to be the origin."**

Therefore:

```text id="p1-memory"
General point
     ↓
x

Special point
     ↓
x = 0
     ↓
wᵀx = 0
     ↓
Much simpler expression
```

---

## What We Have Established

We now know:

1. The plane is

```math id="p1-summary-plane"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

2. The origin is

```math id="p1-summary-origin"
\boxed{
\overrightarrow{x}=\overrightarrow{0}
}
```

3. Therefore,

```math id="p1-summary-dot"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{0}=0
}
```

4. So the origin-to-plane distance will be a **simplified form of the general point-to-plane distance formula**, not a new geometric idea.

Your handnotes follow exactly this route: page 1 starts from the general point-to-plane distance and substitutes the origin, leading toward the simplified expression. 

### Next: Part 2 — The Origin as a Special Point

We will formally substitute $\overrightarrow{x}=\overrightarrow{0}$ into the general formula and derive the origin-to-plane distance step by step.
