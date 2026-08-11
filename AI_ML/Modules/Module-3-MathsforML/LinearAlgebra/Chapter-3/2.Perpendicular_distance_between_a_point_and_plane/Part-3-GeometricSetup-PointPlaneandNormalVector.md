# Part 2 — Geometric Setup: Point, Plane and Normal Vector

In Part 1, we established the **ultimate problem**:

> We want to find the **shortest distance from a point to a plane**.

We also established why the shortest path must be perpendicular to the plane.

Now we need to set up the mathematical objects carefully before deriving anything.

---

# 2.1 The Plane

Let the plane be represented by

```math id="p2-plane"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

This is the same linear boundary equation we studied in the previous chapter.

Here:

* $`\overrightarrow{x}`$ represents **any point on the plane**.
* $`\overrightarrow{w}`$ is the **normal vector** to the plane.
* $`w_0`$ is the constant/bias term.

Most importantly, we already proved:

```math id="p2-normal"
\boxed{
\overrightarrow{w}\perp\text{plane}
}
```

So $`\overrightarrow{w}`$ gives us the direction of the shortest path toward the plane.

---

# 2.2 Introduce the Point Outside the Plane

Now consider a point $`B`$ that is not necessarily on the plane.

Let its position vector be:

```math id="p2-x2"
\boxed{
\overrightarrow{x_2}
}
```

So:

```text id="p2-point-picture"
                    B
                    ●
                    |
                    |
                    |
────────────────────────────
            Plane
```

Our goal is to calculate the perpendicular distance from $`B`$ to the plane.

---

# 2.3 Choose a Point on the Plane

To calculate a distance involving vectors, we need a reference point on the plane.

So choose **any point $`A`$ on the plane**.

Let its position vector be:

```math id="p2-x1"
\boxed{
\overrightarrow{x_1}
}
```

Because $`A`$ lies on the plane, it must satisfy the plane equation:

```math id="p2-x1-plane"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x_1}+w_0=0
}
```

This equation will become extremely important later.

---

# 2.4 Why Can We Choose Any Point $`A`$ on the Plane?

This is an important subtlety.

At this stage, $`A`$ is simply **any known point on the plane**.

We are not yet claiming that $`A`$ is the closest point to $`B`$.

For example:

```text id="p2-many-a"
                    B
                    ●
                  / | \
                /   |   \
              ●     ●     ●
             A₁     A₂     A₃
────────────────────────────────
                Plane
```

All of these points satisfy:

```math id="p2-all-a"
\overrightarrow{w}^{T}\overrightarrow{x_i}+w_0=0
```

But only one particular point will eventually correspond to the perpendicular foot from $`B`$.

For the derivation, we can start with an arbitrary point $`A`$ on the plane because the final result will no longer depend on which point we initially chose.

---

# 2.5 Construct the Vector $\overrightarrow{AB}$

Now we have:

```text id="p2-ab"
A → point on plane

B → external point
```

The vector from $`A`$ to $`B`$ is:

```math id="p2-ab-vector"
\boxed{
\overrightarrow{AB}
=
\overrightarrow{x_2}
-
\overrightarrow{x_1}
}
```

This is simply the vector subtraction rule we already learned.

Geometrically:

```text id="p2-ab-geometry"
                    B
                    ●
                   ↗
                 ↗
               ↗
             ●
             A
────────────────────────
          Plane
```

So $`\overrightarrow{AB}`$ tells us how to travel from the plane point $`A`$ to the external point $`B`$.

---

# 2.6 But $\overrightarrow{AB}$ Is Not Necessarily Perpendicular

This is an important point.

Because $`A`$ was chosen arbitrarily, the vector

```math id="p2-ab-not-perp"
\overrightarrow{AB}
```

does **not necessarily point in the normal direction**.

Therefore:

```text id="p2-ab-components"
AB
│
├── component parallel to plane
│
└── component perpendicular to plane
                         ↓
                       along w
```

What we actually want is only the **perpendicular component**.

And we already know how to extract a component of one vector along another vector:

> **Projection.**

---

# 2.7 Why $\overrightarrow{w}$ Is the Correct Reference Direction

We have already established:

```math id="p2-w-perp"
\boxed{
\overrightarrow{w}\perp\text{plane}
}
```

Therefore the perpendicular component of $`\overrightarrow{AB}`$ must lie along $`\overrightarrow{w}`$.

Conceptually:

```text id="p2-normal-path"
                    B
                    ●
                   /|
                  / |
                 /  |  ← perpendicular component
                /   |
               ●    |
               A    ↓
────────────────────────
          Plane

             w →
```

So the distance problem has now become:

> **Find the component of $\overrightarrow{AB}$ in the direction of $\overrightarrow{w}$.**

That is a projection problem.

---

# 2.8 The Three Important Vectors

At this point, keep these three vectors completely separate in your mind:

### 1. $\overrightarrow{x_1}$

```math id="p2-x1"
\boxed{
\overrightarrow{x_1}
=
\text{a point on the plane}
}
```

It satisfies:

```math id="p2-x1-equation"
\overrightarrow{w}^{T}\overrightarrow{x_1}+w_0=0
```

---

### 2. $\overrightarrow{x_2}$

```math id="p2-x2"
\boxed{
\overrightarrow{x_2}
=
\text{the external point}
}
```

This is the point whose distance from the plane we want to calculate.

---

### 3. $\overrightarrow{w}$

```math id="p2-w"
\boxed{
\overrightarrow{w}
=
\text{normal vector of the plane}
}
```

It gives the perpendicular direction.

---

# 2.9 The Complete Geometric Setup

We can now put everything together:

```text id="p2-complete"
                         B
                         ●
                        /|
                       / |
                      /  |  ← perpendicular direction
                     /   |
                    /    |
                   ●     |
                   A     |
────────────────────────────────
                 Plane

                  ↑
                  │
              normal direction

                  w
```

Mathematically:

```math id="p2-complete-math"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

with:

```math id="p2-x1-math"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x_1}+w_0=0
}
```

and:

```math id="p2-ab-math"
\boxed{
\overrightarrow{AB}
=
\overrightarrow{x_2}-\overrightarrow{x_1}
}
```

---

# 2.10 What Are We Going to Do With $\overrightarrow{AB}$?

Our target is the perpendicular distance.

We know that:

```text id="p2-target-chain"
AB
 ↓
take its component along w
 ↓
perpendicular component
 ↓
distance
```

So we will project:

```math id="p2-projection-target"
\overrightarrow{AB}
```

onto:

```math id="p2-projection-direction"
\overrightarrow{w}
```

The scalar projection is:

```math id="p2-scalar-proj"
\frac{
\overrightarrow{w}^{T}\overrightarrow{AB}
}{
\|\overrightarrow{w}\|
}
```

The absolute value will eventually give us the ordinary geometric distance.

**But we will derive this carefully in the next part rather than jumping directly to the final formula.**

---

# 2.11 A Very Important Distinction

There are three different things here:

### The plane

```math id="p2-dist-plane"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

### The normal direction

```math id="p2-dist-normal"
\overrightarrow{w}
```

### The vector from a point on the plane to the external point

```math id="p2-dist-ab"
\overrightarrow{x_2}-\overrightarrow{x_1}
```

Don't confuse them.

The vector:

```math id="p2-confusion1"
\overrightarrow{x_2}-\overrightarrow{x_1}
```

is **not necessarily perpendicular** to the plane.

The vector:

```math id="p2-confusion2"
\overrightarrow{w}
```

**is** perpendicular to the plane.

We will use the projection of the first vector onto the second.

---

# 2.12 Why This Setup Is So Powerful

Notice what we have done.

We started with a geometric question:

> "How far is point $`B`$ from the plane?"

We converted it into a vector problem:

```text id="p2-conversion"
Point + Plane
      ↓
Choose A on plane
      ↓
Construct AB
      ↓
Find component of AB
along w
      ↓
That component = perpendicular distance
```

And because the plane is described by:

```math id="p2-equation-again"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

we will eventually be able to eliminate the unknown point $`\overrightarrow{x_1}`$ entirely.

That algebraic cancellation is the beautiful part of the derivation.

---

# 🧠 Part 2 Mental Model

Keep this picture in your mind:

```text
              B
              ●
              |
              |  ← shortest distance
              |
              ● A
──────────────────────
        Plane

        ↑
        │ w
        │
     Normal
```

And remember:

```text
x₁ → point on plane
x₂ → point whose distance we want
AB → x₂ − x₁
w  → normal to plane
```

Therefore:

> **We will take $\overrightarrow{AB}$ and extract only the part pointing in the normal direction $\overrightarrow{w}$.**

That part is the perpendicular distance.

---

# 🔗 Connection to Previous Chapters

This single setup uses almost everything we have learned so far:

```text
Unit Vector
     ↓
Projection
     ↓
Dot Product
     ↓
Normal Vector
     ↓
w ⟂ Plane
     ↓
Point-to-Plane Distance
```

So this chapter is deliberately building on our earlier work rather than introducing a disconnected formula.

---

## Next

Now that all objects are clearly defined, we can perform the actual mathematical step:

# **Part 3 — Projection of $\overrightarrow{AB}$ onto the Normal Vector**

There we will derive the signed perpendicular component step-by-step and then connect it to the plane equation.

