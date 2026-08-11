# Part 8 — Why the Absolute Value?

In the previous parts, we derived the point-to-plane distance:

```math id="p8-formula"
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

You may reasonably ask:

> **Why is the absolute value necessary?**

After all, when we calculate

```math id="p8-signed"
\frac{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}{
\|\overrightarrow{w}\|
}
```

we can sometimes get a negative number.

Let's understand exactly what that negative sign means.

---

# 8.1 First: Distance Cannot Be Negative

Suppose I tell you:

> "The distance between point A and point B is −5 meters."

That statement doesn't make geometric sense.

Distance represents a **magnitude**.

Therefore:

```math id="p8-nonnegative"
\boxed{
d\geq0
}
```

If two points are 5 meters apart, the distance is:

```math id="p8-five"
\boxed{
5
}
```

not:

```math id="p8-minus-five"
-5
```

The same principle applies to point-to-plane distance.

---

# 8.2 But Our Projection Can Be Negative

Here's the interesting part.

The **projection** of one vector onto another vector can be positive or negative.

Recall:

```math id="p8-projection"
\frac{
\overrightarrow{w}^{T}\overrightarrow{AB}
}{
\|\overrightarrow{w}\|
}
```

The sign depends on the relative direction of $\overrightarrow{AB}$ and $\overrightarrow{w}$.

If they point generally in the same direction:

```text id="p8-positive"
w       ↑
        |
        |
A ●─────● B
```

the projection is positive.

If they point in opposite directions:

```text id="p8-negative"
A ●
  |
  |
  ● B
  ↓
  w
```

the projection is negative.

So a negative projection is perfectly meaningful.

---

# 8.3 What Does the Sign Actually Tell Us?

The sign tells us **which side of the plane the point lies on relative to the chosen normal vector**.

This is an important distinction:

```text id="p8-distinction"
Signed projection
       ↓
magnitude + direction information

Ordinary distance
       ↓
magnitude only
```

So:

> **The negative sign is not saying that the distance is negative. It is giving directional information.**

---

# 8.4 Signed Distance

Before taking the absolute value, we have:

```math id="p8-signed-distance"
\boxed{
d_{\text{signed}}
=
\frac{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}{
\|\overrightarrow{w}\|
}
}
```

This is called a **signed distance**.

Its interpretation is:

```text id="p8-signed-meaning"
positive
   ↓
one side of the plane

zero
   ↓
on the plane

negative
   ↓
opposite side
```

The exact meaning of "positive side" depends on the orientation we chose for $\overrightarrow{w}$.

---

# 8.5 Why Does the Choice of $\overrightarrow{w}$ Matter?

Suppose:

```math id="p8-w"
\overrightarrow{w}
```

is a normal vector.

Then:

```math id="p8-negative-w"
-\overrightarrow{w}
```

is also a normal vector.

Both are perpendicular to the same plane.

For example:

```math id="p8-normal-directions"
          ↑ w

────────── Plane ──────────

          ↓ -w
```

They describe the same geometric orientation of the plane, but their directions are opposite.

---

# 8.6 What Happens to Signed Distance?

Suppose using $\overrightarrow{w}$ we obtain:

```math id="p8-positive-signed"
d_{\text{signed}}=5
```

If we replace $\overrightarrow{w}$ with $-\overrightarrow{w}$, the signed distance becomes:

```math id="p8-negative-signed"
d_{\text{signed}}=-5
```

So the **sign depends on which direction we choose for the normal vector**.

But the actual geometric distance must remain:

```math id="p8-actual"
\boxed{
d=5
}
```

This is another reason we need the absolute value.

---

# 8.7 The Formula Makes This Clear

Signed distance:

```math id="p8-signed-formula"
\boxed{
d_{\text{signed}}
=
\frac{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}{
\|\overrightarrow{w}\|
}
}
```

Ordinary distance:

```math id="p8-ordinary-formula"
\boxed{
d=
\left|
d_{\text{signed}}
\right|
}
```

Therefore:

```math id="p8-final"
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

---

# 8.8 A Simple Numerical Example

Consider:

```math id="p8-example-plane"
\boxed{
x+y+z-3=0
}
```

and the point:

```math id="p8-example-point"
\boxed{
\overrightarrow{x}
=
\begin{bmatrix}
0\\
0\\
0
\end{bmatrix}
}
```

The normal vector is:

```math id="p8-example-w"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
1\\
1\\
1
\end{bmatrix}
}
```

Evaluate the plane expression:

```math id="p8-example-expression"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
=
0+0+0-3
```

Therefore:

```math id="p8-example-expression2"
\boxed{
=-3
}
```

The signed distance is:

```math id="p8-example-signed"
d_{\text{signed}}
=
\frac{-3}{\sqrt{3}}
```

So:

```math id="p8-example-signed2"
\boxed{
d_{\text{signed}}=-\sqrt{3}
}
```

But the actual distance is:

```math id="p8-example-distance"
\boxed{
d=\sqrt{3}
}
```

The negative sign told us about the **side of the plane**, not the magnitude of the distance.

---

# 8.9 Number-Line Analogy

Absolute value is easier to understand if we temporarily forget about planes.

Suppose we have the number:

```text id="p8-numberline"
<────────────●────────────●────────────>
             -5           0
```

The number $-5$ is located five units from zero.

Therefore:

```math id="p8-abs-five"
\boxed{
|-5|=5
}
```

Similarly:

```math id="p8-abs-other"
\boxed{
|5|=5
}
```

Both points are different in **direction**, but have the same **distance from zero**.

The same idea applies to a plane:

```text id="p8-plane-analogy"
one side          plane          other side

   ●                │                ●
   │                │                │
   │                │                │
 -d│                │               d
```

The signed distance tells us the side.

The absolute value gives the actual distance.

genui{"algebra_expressions_equations":{"type_id":"ABSOLUTE_VALUE_DISTANCE"}}

---

# 8.10 Three Cases You Should Know

Every point falls into one of three cases.

### Case 1 — Point on the plane

```math id="p8-case1"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

Therefore:

```math id="p8-case1-distance"
\boxed{
d=0
}
```

---

### Case 2 — Point on one side

```math id="p8-case2"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
```

Therefore:

```math id="p8-case2-signed"
d_{\text{signed}}>0
```

But:

```math id="p8-case2-distance"
d>0
```

---

### Case 3 — Point on the opposite side

```math id="p8-case3"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0<0
```

Therefore:

```math id="p8-case3-signed"
d_{\text{signed}}<0
```

But:

```math id="p8-case3-distance"
d>0
```

The absolute value converts the signed quantity into the actual geometric distance.

---

# 8.11 Why We Should Not Remove the Sign Too Early

There is an important conceptual distinction here.

If we immediately write:

```math id="p8-abs-early"
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
```

we get the distance.

That's useful.

But we lose the information about **which side of the plane the point lies on**.

If instead we first calculate:

```math id="p8-signed-keep"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

we retain that information.

So:

```text id="p8-info"
Signed value
   ↓
magnitude + side information

Absolute value
   ↓
magnitude only
```

This distinction will become useful when we connect this geometry to Machine Learning.

---

# 8.12 Connection to Classification

Consider a linear boundary:

```math id="p8-class-boundary"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

Suppose our model uses the sign to distinguish two sides:

```text id="p8-classification"
score > 0
    ↓
Class A

score = 0
    ↓
Boundary

score < 0
    ↓
Class B
```

Here, the sign is useful.

But if we ask:

> **How far is this point from the boundary?**

we don't care which side it is on.

We want only the magnitude:

```math id="p8-ml-distance"
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

So:

> **Sign tells us the side; absolute value gives us the distance.**

---

# 🎯 Ultimate Goal in ML — Simple Terms

This is the ML takeaway we should carry forward:

Imagine the model creates a boundary:

```text id="p8-ml-boundary"
Class A        ●

                |
                |
────────────────┼────────────
            Boundary

                |
                |

        ●       Class B
```

For a point, the raw expression

```math id="p8-ml-score"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

can tell us **which side** of the boundary the point is on.

After dividing by $|\overrightarrow{w}|$ and taking absolute value, we get:

```math id="p8-ml-distance2"
\boxed{
\text{distance from boundary}
}
```

In simple words:

> **The sign tells us “which side?”; the absolute value tells us “how far?”**

That is the cleanest mental model for this entire part.

---

# 8.13 Important Subtlety — Distance vs Signed Distance

Do not treat these as interchangeable.

| Quantity              | Meaning                                  |
| --------------------- | ---------------------------------------- |
| $`d_{\text{signed}}`$ | Distance with side/direction information |
| $`d`$                 | Ordinary geometric distance              |
| Positive signed value | One side                                 |
| Zero                  | On the plane                             |
| Negative signed value | Opposite side                            |
| Absolute value        | Removes the side information             |

The ordinary distance is always:

```math id="p8-table-formula"
\boxed{
d\geq0
}
```

---

# 🧠 Part 8 Mental Model

Think of walking along the normal direction.

```text
                + direction of w
                       ↑
                       |
                       |
─────────────── Plane ───────────────
                       |
                       |
                       ↓
                - direction of w
```

The signed distance answers:

> **How far, and in which normal direction?**

The ordinary distance answers:

> **How far, regardless of direction?**

Therefore:

```text id="p8-memory"
Signed distance
      ↓
keep the sign

Ordinary distance
      ↓
take absolute value
```

---

# 🔑 Part 8 Takeaways

### 1. Distance cannot be negative

```math id="p8-take1"
\boxed{
d\geq0
}
```

### 2. Projection can be negative

Because projection contains directional information.

### 3. Signed distance preserves side information

```math id="p8-take3"
\boxed{
d_{\text{signed}}
=
\frac{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}{
\|\overrightarrow{w}\|
}
}
```

### 4. Absolute value gives ordinary distance

```math id="p8-take4"
\boxed{
d=
\left|
d_{\text{signed}}
\right|
}
```

### 5. The key ML mental model

> **Sign → which side of the boundary?**

> **Absolute value → how far from the boundary?**

---

## One-Line Revision

> **We use absolute value because projection gives a signed quantity that tells us which side of the plane the point lies on, while geometric distance must represent only the non-negative magnitude.**

### Next: **Part 9 — Geometric Interpretation**

Now that we understand **what the formula calculates** and **why the absolute value is necessary**, we can step back and understand the entire formula geometrically: what the numerator, denominator, normal vector, projection, and final distance each mean in the picture.

