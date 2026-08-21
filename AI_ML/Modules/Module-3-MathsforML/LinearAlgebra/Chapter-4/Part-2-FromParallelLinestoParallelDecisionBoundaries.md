# Part 2 — From Parallel Lines to Parallel Decision Boundaries

In Part 1, we established the **problem**:

> We don't just want any boundary that separates two classes. We want to understand how to compare boundaries and eventually prefer one that gives better separation.

Now we need one geometric idea that will become very important:

> **Parallel boundaries have the same direction, but are shifted relative to each other.**

Let's build this slowly.

---

## 1. First: What Are Parallel Lines?

You probably already know this from coordinate geometry.

Consider two lines:

```math id="p2eq1"
y=m_1x+c_1
```

and

```math id="p2eq2"
y=m_2x+c_2
```

For the two lines to be parallel:

```math id="p2eq3"
\boxed{m_1=m_2}
```

The slopes are the same.

The intercepts can be different.

For example:

```math id="p2eq4"
y=2x+1
```

and

```math id="p2eq5"
y=2x+5
```

Both have slope $2$.

Therefore, they are parallel.

genui{"learning_viz":{"type_id":"PARALLEL_LINE"}}

### Simple mental picture

```text
Line 1:  /
        /
       /

Line 2:       /
              /
             /
```

They have the **same direction**, but one is shifted away from the other.

---

# 2. What Does "Same Direction" Mean?

This is important because we have already learned about vectors.

A line has a **direction**.

For example:

```text
       ↗
      /
     /
    /
```

Another line:

```text
              ↗
             /
            /
           /
```

They point in the same direction.

Therefore, they are parallel.

So:

> **Parallel lines = same direction + different position.**

---

# 3. Now Connect This to Our ML Plane

Our decision boundary is represented as:

```math id="p2eq6"
\overrightarrow{w}^{T}\overrightarrow{x}+b=0
```

Remember our notation distinction:

* $\overrightarrow{x}$ here is a **generic point used to describe the boundary**.
* $\overrightarrow{w}$ is the **normal vector** to the boundary.
* $b$ controls the position of the boundary.

The important part for us is $\overrightarrow{w}$.

---

# 4. What Determines the Direction of the Boundary?

This is a very important geometric fact from our previous chapters:

> $\overrightarrow{w}$ is perpendicular to the line/plane.

So $\overrightarrow{w}$ tells us the **orientation of the boundary**.

Imagine:

```text
                    ↑  w
                    │
                    │
                    │
        ─────────────────────
             boundary
```

If we keep $\overrightarrow{w}$ the same, the boundary keeps the same orientation.

If we change $b$, we move the boundary.

---

# 5. Two Parallel Decision Boundaries

Suppose we have:

```math id="p2eq7"
\overrightarrow{w}^{T}\overrightarrow{x}+b_1=0
```

and

```math id="p2eq8"
\overrightarrow{w}^{T}\overrightarrow{x}+b_2=0
```

Notice something very important:

### Same $\overrightarrow{w}$

Both equations use the same normal vector.

Only the bias/intercept is different:

```text
Boundary 1 → b₁
Boundary 2 → b₂
```

Therefore:

> **The two boundaries have the same orientation.**

Hence they are parallel.

---

# 6. Visualize It

Imagine two boundaries:

```text
                  ↗ w
                 /
                /
──────────────────────────
        Boundary 1


                  ↗ w
                 /
                /
──────────────────────────
        Boundary 2
```

The two boundaries are parallel.

Why?

Because they have the **same normal vector**.

The normal vector points in the same direction for both.

---

# 7. What Does $b$ Actually Do?

This is where the equation becomes intuitive.

Consider:

```math id="p2eq9"
\overrightarrow{w}^{T}\overrightarrow{x}+b=0
```

Think of:

```text
w → controls orientation
b → controls position
```

So:

```text
Change w
   ↓
Change orientation

Change b
   ↓
Shift boundary
```

This is a very useful mental model.

### For example

```math id="p2eq10"
2x+3y+2=0
```

and

```math id="p2eq11"
2x+3y+8=0
```

have the same coefficients for $x$ and $y$.

Therefore they have the same normal vector:

```math id="p2eq12"
\overrightarrow{w}
=
\begin{bmatrix}
2\\
3
\end{bmatrix}
```

So they have the same orientation.

They are parallel.

---

# 8. Why Is This Important for Chapter 4?

Now we are getting closer to the actual ML problem.

Suppose our data is:

```text
        🟢 🟢 🟢
          🟢

────────────────────  Boundary A

          🔴
        🔴 🔴 🔴
```

We can imagine another parallel boundary:

```text
        🟢 🟢 🟢
          🟢

────────────────────  Boundary A

          ↕

────────────────────  Boundary B

          🔴
        🔴 🔴 🔴
```

These boundaries have the **same orientation**.

We can now measure the distance between them.

And that distance is going to become extremely important.

---

# 9. Why Two Parallel Boundaries?

This is the key question.

You might ask:

> "Why are we suddenly talking about TWO boundaries when our classifier only needs ONE decision boundary?"

Excellent question.

The reason is that we want to measure **how much space separates the classes**.

Think about a road:

```text
🟢 🟢 🟢
────────────  ← one side boundary


     SPACE


────────────  ← other side boundary
🔴 🔴 🔴
```

The space between these two parallel boundaries represents the **separation region**.

Later, we will use this idea to reason about the **margin**.

---

# 10. Connection to Our Previous Distance Topic

This is why the previous chapter was so important.

We already learned:

> How to calculate perpendicular distance.

Now Chapter 4 asks:

> **What is the distance between two parallel boundaries?**

And because the boundaries are parallel, the shortest distance between them is measured **along the normal direction**.

```text
Boundary 1
────────────────────────
          ↕
          ↕  shortest
          ↕  distance
          ↕
────────────────────────
Boundary 2
```

Notice the direction of the distance:

```text
          ↕
          ↕
          ↕
```

It is perpendicular to both boundaries.

And what is perpendicular to the boundary?

```text
→  Normal vector w
```

So again:

```text
Normal vector
     ↓
Perpendicular direction
     ↓
Shortest distance
```

This is the same geometry we learned earlier.

---

# 11. A Very Important ML Connection

Eventually, our data will look something like:

```text
          🟢  🟢  🟢
            🟢
            
───────────────  ← parallel boundary

───────────────  ← another parallel boundary

            🔴
          🔴  🔴
        🔴  🔴  🔴
```

The idea is:

> Find boundaries that create a good separation between the two classes.

We are **not yet saying exactly how to choose these boundaries**.

That comes later.

For now, we are only building the geometry required to measure that separation.

---

# 12. One Subtle but Important Point

Parallel lines do **not** necessarily have the same equation.

For example:

```math id="p2eq13"
2x+3y+2=0
```

and

```math id="p2eq14"
2x+3y+8=0
```

are different lines.

But they have the same normal vector:

```math id="p2eq15"
\overrightarrow{w}
=
\begin{bmatrix}
2\\
3
\end{bmatrix}
```

Therefore:

```text
Same w
 ↓
Same orientation
 ↓
Parallel boundaries
```

while:

```text
Different b
 ↓
Different position
```

---

# 13. Our Mental Model

Keep this picture:

```text
                 w
                 ↑
                 │
                 │
────────────────────────────────
          Boundary 1
                 │
                 │
                 │  distance
                 │
────────────────────────────────
          Boundary 2
                 │
                 │
                 ↑
                 w
```

The two boundaries:

* have the **same orientation**
* have the **same normal direction**
* are separated by some perpendicular distance
* differ mainly in their position

---

# 14. 🎯 Ultimate Goal in ML — Simple Terms

We are slowly building toward this:

> **Imagine two invisible parallel walls around the region separating two classes. We want to know how wide the safe gap between those walls is.**

That gap will eventually help us answer:

> **Which decision boundary gives us better separation?**

And that leads us toward the concept of **margin**.

---

# 🧠 Part 2 — What You Should Remember

Don't memorize the formulas yet. Remember the relationships:

```text
Line / Plane
     ↓
has a normal vector w
     ↓
w determines orientation
     ↓
same w
     ↓
same orientation
     ↓
parallel boundaries
```

And:

```text
b changes
     ↓
boundary shifts
     ↓
orientation stays the same
     ↓
parallel boundary
```

Finally:

```text
Two parallel boundaries
          ↓
measure perpendicular distance
          ↓
understand separation
          ↓
eventually understand margin
          ↓
better decision boundary
```

### 🔑 One-line takeaway

> **Two decision boundaries with the same normal vector $\overrightarrow{w}$ have the same orientation; changing $b$ shifts the boundary without changing its orientation.**

In the **next Part**, we'll use exactly this setup to derive **the distance between two parallel decision boundaries**.

