# Part 3 — Distance Between Two Parallel Boundaries

In Part 2, we established an important idea:

> If two linear boundaries have the **same normal vector** but different $b$ values, they are parallel.

Now we want to answer the next natural question:

> **How far apart are these two parallel boundaries?**

This is the geometric quantity that will later help us understand **separation and margin** in ML.

---

# 1. Our Two Parallel Boundaries

Let's take:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+b_1=0
```

and

```math
\overrightarrow{w}^{T}\overrightarrow{x}+b_2=0
```

### Important notation reminder

Here $\overrightarrow{x}$ is a **generic point used to describe the boundary**.

It is **not yet a particular training data point**.

We are simply saying:

> All points $\overrightarrow{x}$ satisfying the first equation form Boundary 1.

And all points $\overrightarrow{x}$ satisfying the second equation form Boundary 2.

---

# 2. Visualize the Situation

```text
                         → w
                         │
                         │
        ─────────────────────────
              Boundary 1
        wᵀx + b₁ = 0
                         │
                         │
                         │  d
                         │
                         │
        ─────────────────────────
              Boundary 2
        wᵀx + b₂ = 0
                         │
                         │
                         → w
```

The shortest distance between two parallel boundaries is always measured **perpendicularly**.

And what direction is perpendicular to the boundary?

```text
Normal vector → w
```

Therefore:

> **The distance between the two parallel boundaries is measured along the normal-vector direction.**

---

# 3. Let's Choose One Point on Boundary 1

Take any point $\overrightarrow{x}_1$ on Boundary 1.

Because it lies on Boundary 1:

```math
\overrightarrow{w}^{T}\overrightarrow{x}_1+b_1=0
```

Therefore:

```math
\overrightarrow{w}^{T}\overrightarrow{x}_1=-b_1
```

Let's call this:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}_1=-b_1
}
```

---

# 4. Now Ask: How Far Is This Point From Boundary 2?

Boundary 2 is:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+b_2=0
```

And our specific point is $\overrightarrow{x}_1$.

So the point-to-plane distance formula says:

```math
d=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}_1+b_2
\right|
}{
\|\overrightarrow{w}\|
}
```

Notice the distinction:

* $\overrightarrow{x}$ in the boundary equation is generic.
* $\overrightarrow{x}_1$ is now a **specific point on Boundary 1**.

This is exactly the notation distinction we agreed to maintain.

---

# 5. Substitute What We Already Know

From Boundary 1 we know:

```math
\overrightarrow{w}^{T}\overrightarrow{x}_1=-b_1
```

Therefore:

```math
d=
\frac{
\left|
-b_1+b_2
\right|
}{
\|\overrightarrow{w}\|
}
```

or:

```math
\boxed{
d=
\frac{
|b_2-b_1|
}{
\|\overrightarrow{w}\|
}
}
```

And **this is the distance between the two parallel boundaries.**

---

# 6. Why Did $\overrightarrow{x}_1$ Disappear?

This is actually a beautiful part of the derivation.

We started with:

```math
d=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}_1+b_2
\right|
}{
\|\overrightarrow{w}\|
}
```

But because $\overrightarrow{x}_1$ lies on Boundary 1:

```math
\overrightarrow{w}^{T}\overrightarrow{x}_1=-b_1
```

Therefore:

```math
d=
\frac{
|-b_1+b_2|
}{
\|\overrightarrow{w}\|
}
```

So the actual location of the point $\overrightarrow{x}_1$ doesn't matter.

That makes sense geometrically.

If two lines are parallel, **every perpendicular segment connecting them has the same length**.

---

# 7. Let's Understand This Without Mathematics

Imagine two railway tracks:

```text
══════════════════════════════
Track 1


══════════════════════════════
Track 2
```

You can measure the distance here:

```text
══════════════════════════════
             ↕
             ↕
             ↕
══════════════════════════════
```

Or here:

```text
══════════════════════════════
                    ↕
                    ↕
                    ↕
══════════════════════════════
```

The distance is the same.

You don't need to know **which particular point** you started from.

That's why $\overrightarrow{x}_1$ disappears from the final formula.

---

# 8. Why Does the Difference $|b_2-b_1|$ Appear?

This part is worth understanding intuitively.

The two boundaries are:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+b_1=0
```

and

```math
\overrightarrow{w}^{T}\overrightarrow{x}+b_2=0
```

The only thing that changes is $b$.

So $b$ controls **where the boundary sits**.

The difference:

```math
|b_2-b_1|
```

therefore represents the amount by which the two boundaries differ in their position **along the normal direction**, before accounting for the scale of $\overrightarrow{w}$.

Then we divide by:

```math
\|\overrightarrow{w}\|
```

to convert that quantity into an actual geometric distance.

Hence:

```math
\boxed{
\text{Distance}
=
\frac{\text{difference in }b}
{\text{magnitude of normal vector}}
}
```

---

# 9. Numerical Example

Let's take two parallel lines:

```math
2x+3y+2=0
```

and

```math
2x+3y+8=0
```

Here:

```math
\overrightarrow{w}
=
\begin{bmatrix}
2\\
3
\end{bmatrix}
```

and:

```math
b_1=2
```

```math
b_2=8
```

The magnitude of the normal vector is:

```math
\|\overrightarrow{w}\|
=
\sqrt{2^2+3^2}
=
\sqrt{13}
```

Therefore:

```math
d=
\frac{|8-2|}{\sqrt{13}}
```

```math
\boxed{
d=\frac{6}{\sqrt{13}}
}
```

Approximately:

```math
d\approx1.66
```

So the two parallel lines are approximately **1.66 units apart**.

---

# 10. Static Notebook Visual

This is a good diagram to keep in your `.md` file:

```text
                    → w
                    │
                    │
        ───────────────────────
        wᵀx + b₁ = 0
                    │
                    │
                    │  d
                    │
                    ↓
        ───────────────────────
        wᵀx + b₂ = 0
                    │
                    │
                    → w
```

And write next to it:

```text
Same w
  ↓
Same orientation
  ↓
Parallel boundaries

Different b
  ↓
Different position

Distance is measured along w
  ↓
d = |b₂ - b₁| / ||w||
```

---

# 11. Another Visual — Connecting It to ML

Now let's bring our two classes back.

```text
             +1 CLASS
        ●   ●   ●   ●
          ●   ●

────────────────────────
       Boundary 1
────────────────────────

          ←  GAP  →

────────────────────────
       Boundary 2
────────────────────────

          ○   ○
        ○   ○   ○
             -1 CLASS
```

The distance between these two boundaries represents a **separation region**.

The bigger this distance becomes, the more room exists between the two sides.

This is the geometric idea that will eventually lead us to **margin**.

---

# 12. But Don't Jump to Margin Yet

At this point, don't think:

> "Two parallel boundaries = margin."

That's slightly premature.

For now, our goal is simply:

```text
Two parallel boundaries
        ↓
Find perpendicular distance
        ↓
d = |b₂ - b₁| / ||w||
```

Later we will connect these boundaries to the **training points of the two classes**, and then the meaning of this distance becomes much more interesting.

---

# 13. Connection to Our Previous Chapter

This formula is **not a completely new formula**.

We are reusing the point-to-plane distance formula we already derived.

Previously:

```math
d=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}_P+b
\right|
}{
\|\overrightarrow{w}\|
}
```

where $\overrightarrow{x}_P$ was the **specific point whose distance we wanted**.

Now:

```text
Boundary 1
     ↓
Choose a specific point x₁ on it
     ↓
Measure x₁ → Boundary 2
     ↓
Use point-to-plane distance
     ↓
x₁ disappears using Boundary 1 equation
     ↓
Distance between boundaries
```

So Chapter 4 is **building on the geometry we already learned**, not introducing an unrelated trick.

---

# 🎯 Ultimate Goal in ML

Why are we doing all this?

Because eventually we want to answer:

> **How much space can we create between the two classes while still correctly separating them?**

The journey is:

```text
Parallel boundaries
        ↓
Distance between boundaries
        ↓
Separation between classes
        ↓
Margin
        ↓
Choose a better decision boundary
        ↓
More robust classification
```

We are still building the geometry.

---

# 🧠 Part 3 — What You Should Remember

### 1. Two parallel boundaries

```math
\overrightarrow{w}^{T}\overrightarrow{x}+b_1=0
```

and

```math
\overrightarrow{w}^{T}\overrightarrow{x}+b_2=0
```

have the same normal vector.

---

### 2. Their distance is measured perpendicular to them

That direction is given by:

```math
\overrightarrow{w}
```

---

### 3. Choose a specific point $\overrightarrow{x}_1$ on Boundary 1

```math
\overrightarrow{w}^{T}\overrightarrow{x}_1=-b_1
```

Then measure its distance to Boundary 2.

---

### 4. Final formula

```math
\boxed{
d=
\frac{
|b_2-b_1|
}{
\|\overrightarrow{w}\|
}
}
```

---

### 🔑 One-line takeaway

> **For two parallel linear boundaries with the same normal vector, their perpendicular distance depends on how different their $b$ values are, normalized by the length of the normal vector.**

And now we have the geometric tool we needed.

**Next: Part 4 — Bringing Data Points into the Picture.**

