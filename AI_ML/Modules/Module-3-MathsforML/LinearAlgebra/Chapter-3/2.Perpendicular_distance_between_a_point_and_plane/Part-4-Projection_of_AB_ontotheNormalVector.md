
# **Part 4 — Projection of $\overrightarrow{AB}$ onto the Normal Vector**

In Part 2, we established the complete geometric setup:

* $A$ is a point on the plane.
* $B$ is the point whose distance from the plane we want.
* $\overrightarrow{AB}$ connects the plane to the external point.
* $\overrightarrow{w}$ is the normal vector to the plane.
* The required distance is the **component of $\overrightarrow{AB}$ in the direction of $\overrightarrow{w}$**.

Now we use the projection concept we studied earlier.

---

## 3.1 The Key Idea

We have the vector

$`\overrightarrow{AB}=\overrightarrow{x_2}-\overrightarrow{x_1}`$

and we want to know:

> **How much of $\overrightarrow{AB}$ lies in the direction of $\overrightarrow{w}$?**

Geometrically:

```text
                         B ●
                          /|
                         / |
                        /  |  ← perpendicular component
                       /   |
                      /    |
                     ●-----+
                     A
──────────────────────────────
            Plane

                     ↑
                     |
                     |  w
                     |
```

The diagonal vector is $\overrightarrow{AB}$.

The vertical component is the part of $\overrightarrow{AB}$ pointing in the normal direction.

That component is exactly what we need for the perpendicular distance.

---

# 3.2 Recall: Scalar Projection

From our previous chapter on projection, the scalar projection of a vector onto another vector is:

**Scalar projection of $\overrightarrow{AB}$ onto $\overrightarrow{w}$**

```math
\frac{
\overrightarrow{AB}^{T}\overrightarrow{w}
}{
\|\overrightarrow{w}\|
}
```

This gives us a **single number**.

That number tells us how much of $\overrightarrow{AB}$ lies along the direction of $\overrightarrow{w}$.

### Why divide by $|\overrightarrow{w}|$?

Because $\overrightarrow{w}$ may not be a unit vector.

If we first convert it into a unit vector,

$`\widehat{w}=\frac{\overrightarrow{w}}{\|\overrightarrow{w}\|}`$,

then the scalar projection is simply:

$$
\operatorname{comp}_{\overrightarrow{w}}(\overrightarrow{AB})
=============================================================

\overrightarrow{AB}^{T}\widehat{w}
$$

Therefore:

$$
\boxed{
\operatorname{comp}_{\overrightarrow{w}}(\overrightarrow{AB})
=============================================================

\frac{
\overrightarrow{AB}^{T}\overrightarrow{w}
}{
|\overrightarrow{w}|
}
}
$$

---

# 3.3 Substitute $\overrightarrow{AB}$

From Part 2:

$`\overrightarrow{AB}=\overrightarrow{x_2}-\overrightarrow{x_1}`$

Therefore:

$$
\operatorname{comp}_{\overrightarrow{w}}(\overrightarrow{AB})
=============================================================

\frac{
(\overrightarrow{x_2}-\overrightarrow{x_1})^{T}
\overrightarrow{w}
}{
|\overrightarrow{w}|
}
$$

Using the distributive property of the dot product:

# $$

\frac{
\overrightarrow{x_2}^{T}\overrightarrow{w}
------------------------------------------

\overrightarrow{x_1}^{T}\overrightarrow{w}
}{
|\overrightarrow{w}|
}
$$

Since the dot product is commutative:

$`\overrightarrow{x}^{T}\overrightarrow{w}=\overrightarrow{w}^{T}\overrightarrow{x}`$

we can write:

# $$

\frac{
\overrightarrow{w}^{T}\overrightarrow{x_2}
------------------------------------------

\overrightarrow{w}^{T}\overrightarrow{x_1}
}{
|\overrightarrow{w}|
}
$$

This expression is already very close to our final answer.

But there is one beautiful piece of information we haven't used yet.

---

# 3.4 Remember: $\overrightarrow{x_1}$ Lies on the Plane

Point $A$ was deliberately chosen on the plane.

The plane equation is:

$`\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0`$

Therefore, because $`\overrightarrow{x_1}`$ represents a point on the plane:

$$
\overrightarrow{w}^{T}\overrightarrow{x_1}+w_0=0
$$

Rearranging:

$$
\overrightarrow{w}^{T}\overrightarrow{x_1}
==========================================

-w_0
$$

This is the key substitution.

---

# 3.5 Substitute into the Projection

We had:

$$
\operatorname{comp}_{\overrightarrow{w}}(\overrightarrow{AB})
=============================================================

\frac{
\overrightarrow{w}^{T}\overrightarrow{x_2}
------------------------------------------

\overrightarrow{w}^{T}\overrightarrow{x_1}
}{
|\overrightarrow{w}|
}
$$

Since:

$$
\overrightarrow{w}^{T}\overrightarrow{x_1}
==========================================

-w_0
$$

we get:

# $$

\frac{
\overrightarrow{w}^{T}\overrightarrow{x_2}
-(-w_0)
}{
|\overrightarrow{w}|
}
$$

Therefore:

$$
\boxed{
\operatorname{comp}_{\overrightarrow{w}}(\overrightarrow{AB})
=============================================================

\frac{
\overrightarrow{w}^{T}\overrightarrow{x_2}+w_0
}{
|\overrightarrow{w}|
}
}
$$

This is a major result.

---

# 3.6 What Just Happened?

Something very important happened algebraically.

Initially, our expression contained **two points**:

$`\overrightarrow{x_1}`$ and $`\overrightarrow{x_2}`$.

But after using the fact that $`\overrightarrow{x_1}`$ lies on the plane, $`\overrightarrow{x_1}`$ disappeared.

We are left only with:

* the normal vector $\overrightarrow{w}$
* the external point $\overrightarrow{x_2}$
* the plane constant $w_0$

So we don't actually need to know which point $A$ we initially selected.

That is why the final point-to-plane distance formula can be calculated directly from the point and the plane equation.

---

# 3.7 Why Can the Projection Be Negative?

This is an important geometric detail.

The scalar projection is **signed**.

Suppose $\overrightarrow{AB}$ points in the same general direction as $\overrightarrow{w}$:

```text
        w ↑

        B ●
          |
          |
          ● A
────────────── Plane
```

Then:

$$
\overrightarrow{AB}^{T}\overrightarrow{w}>0
$$

so the projection is positive.

But suppose the point lies on the opposite side:

```text
────────────── Plane
          ● A
          |
          |
          ● B
          ↓
          w
```

Then the projection can be negative.

Therefore:

> **Projection tells us both magnitude and direction relative to $\overrightarrow{w}$.**

But ordinary geometric distance cannot be negative.

---

# 3.8 Distance Must Be Non-Negative

Distance is always:

$$
d\geq0
$$

Therefore we take the absolute value of the signed projection.

So:

$$
d
=

\left|
\operatorname{comp}_{\overrightarrow{w}}(\overrightarrow{AB})
\right|
$$

Substituting our result:

$$
\boxed{
d
=

\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x_2}+w_0
\right|
}{
|\overrightarrow{w}|
}
}
$$

This is the **perpendicular distance from point $B$ to the plane**.

---

# 3.9 The Final Formula

For a plane:

$`\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0`$

and a point represented by:

$`\overrightarrow{x_2}`$,

the perpendicular distance is:

$$
\boxed{
d
=

\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x_2}+w_0
\right|
}{
|\overrightarrow{w}|
}
}
$$

This is the formula we ultimately wanted.

But more importantly, **we did not memorize it**.

We built it from:

```text
Point + Plane
      ↓
Choose a point on plane
      ↓
Construct AB
      ↓
Project AB onto w
      ↓
Use plane equation
      ↓
x₁ disappears
      ↓
Take absolute value
      ↓
Perpendicular distance
```

---

# 3.10 Why the Denominator $|\overrightarrow{w}|$ Exists

This is worth understanding deeply because it is one of the most common places where students memorize instead of understanding.

Suppose:

$`\overrightarrow{w}`$

is very large:

```text
w = [100, 100]
```

versus:

```text
w = [1, 1]
```

These vectors point in exactly the same direction.

They represent the **same normal direction**, but their magnitudes are different.

The distance obviously cannot change just because we multiplied the normal vector by $100$.

Therefore we must normalize by its magnitude:

$$
\frac{\overrightarrow{w}}{|\overrightarrow{w}|}
$$

That is exactly why:

$$
|\overrightarrow{w}|
$$

appears in the denominator.

---

# 3.11 A Beautiful Invariance Check

Suppose we multiply the entire plane equation by some non-zero constant $c$.

Original plane:

$$
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
$$

Multiply everything by $c$:

$$
(c\overrightarrow{w})^{T}\overrightarrow{x}+cw_0=0
$$

This describes the **same plane**.

Now calculate the distance using the new representation:

$$
d'
==

\frac{
\left|
(c\overrightarrow{w})^{T}\overrightarrow{x_2}+cw_0
\right|
}{
|c\overrightarrow{w}|
}
$$

The numerator becomes:

$$
|c|
\left|
\overrightarrow{w}^{T}\overrightarrow{x_2}+w_0
\right|
$$

and the denominator becomes:

$$
|c||\overrightarrow{w}|
$$

Therefore:

$$
d'
==

\frac{
|c|
\left|
\overrightarrow{w}^{T}\overrightarrow{x_2}+w_0
\right|
}{
|c||\overrightarrow{w}|
}
$$

The $|c|$ cancels:

$$
\boxed{
d'=d
}
$$

### Deep insight

> **The geometric distance depends on the plane itself, not on the particular numerical scaling used to represent the plane.**

That is an important linear-algebra property.

---

# 3.12 Connection to Our Earlier Projection Chapter

Notice how directly our previous topic is being reused.

Earlier we learned:

> To find the component of one vector along another vector, use projection.

Now:

```text
Vector to project:
        AB

Direction:
        w

Projection:
        component of AB along w

Meaning:
        perpendicular distance
```

So the point-to-plane distance formula is not an isolated formula.

It is fundamentally a **projection problem**.

---

# 🎯 Ultimate Goal in ML — In Simple Terms

We can now translate the mathematics back into ML language.

Suppose:

$`\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0`$

is a **decision boundary**.

For a data point $`\overrightarrow{x_2}`$, we calculate:

$$
d
=

\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x_2}+w_0
\right|
}{
|\overrightarrow{w}|
}
$$

In simple terms:

> **This number tells us how physically far the data point is from the model's boundary.**

So geometry gives us a way to turn:

> **“This point is close/far from the boundary.”**

into an actual numerical quantity.

---

# 🧠 Part 3 — What You Should Remember

### Core geometric idea

$`\overrightarrow{AB}`$ contains many directional components.

We only want the component perpendicular to the plane.

### Correct direction

$`\overrightarrow{w}`$ is perpendicular to the plane.

Therefore we project $`\overrightarrow{AB}`$ onto $`\overrightarrow{w}`$.

### Key substitution

Because $`\overrightarrow{x_1}`$ lies on the plane:

$$
\overrightarrow{w}^{T}\overrightarrow{x_1}+w_0=0
$$

which gives:

$$
\overrightarrow{w}^{T}\overrightarrow{x_1}=-w_0
$$

### Final result

$$
\boxed{
d
=

\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x_2}+w_0
\right|
}{
|\overrightarrow{w}|
}
}
$$

---

## 🔑 One-Line Mental Model

> **Point-to-plane distance = project the point-to-plane vector onto the plane's normal direction.**

And the next natural step is to take this formula and **work through numerical examples**, so that every term has a concrete geometric meaning rather than remaining symbolic.



