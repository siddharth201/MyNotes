

# Part 2 — From Two Points to the Equation of a Line

In Part 1, we established an important idea:

> **Two points on a line determine the direction of that line.**

If the two points are A and B, then the vector from A to B is:

```math
\boxed{
\overrightarrow{AB}
}
```

This vector lies **along the line**, so it gives us the direction of the line.

Now we want to take the next step:

> **Can we use a point and a direction vector to describe every point on the line?**

The answer is yes.

---

## 2.1 Start with a Point on the Line

Suppose a line passes through a point A.

Let the position vector of A be:

```math
\boxed{
\overrightarrow{OA}
}
```

where O is the origin.

Now suppose the line has a direction vector:

```math
\boxed{
\overrightarrow{d}
}
```

The vector **d** tells us which direction the line travels.

---

## 2.2 Moving Along the Line

Imagine starting at A.

If we move one unit in the direction of `d`, we reach another point on the line.

If we move two units:

```math
2\overrightarrow{d}
```

we reach another point.

If we move half a unit:

```math
\frac{1}{2}\overrightarrow{d}
```

we also remain on the line.

We can even move in the opposite direction by using a negative multiple:

```math
-\overrightarrow{d}
```

So a single direction vector can generate **every point on the line**.

---

# 2.3 The Parametric Equation of a Line

Let A be a fixed point on the line.

Let `d` be a direction vector.

Then any point X on the line can be represented as:

```math
\boxed{
\overrightarrow{OX}
=
\overrightarrow{OA}
+
t\overrightarrow{d}
}
```

where **t** is a real number.

This is the **vector/parametric equation of a line**.

---

## 2.4 What Does t Mean?

The parameter **t** tells us how far we have travelled along the direction vector.

### When t = 0

```math
\overrightarrow{OX}
=
\overrightarrow{OA}
```

So X is exactly A.

---

### When t = 1

```math
\overrightarrow{OX}
=
\overrightarrow{OA}
+
\overrightarrow{d}
```

We move one copy of the direction vector.

---

### When t = 2

```math
\overrightarrow{OX}
=
\overrightarrow{OA}
+
2\overrightarrow{d}
```

We move twice as far in the same direction.

---

### When t = -1

```math
\overrightarrow{OX}
=
\overrightarrow{OA}
-
\overrightarrow{d}
```

We move in the opposite direction.

---

### The important insight

As **t** takes every real value, X traces the **entire line**.

```math
\boxed{
t\in\mathbb{R}
}
```

So:

> **A point + a direction vector + one real parameter is enough to describe an entire line.**

---

# 2.5 Connecting This to Two Points

Now suppose we already know two points A and B on the line.

We know from Part 1 that:

```math
\boxed{
\overrightarrow{AB}
=
\overrightarrow{OB}
-
\overrightarrow{OA}
}
```

Therefore, we can use:

```math
\boxed{
\overrightarrow{AB}
}
```

as the direction vector.

So the line can be written as:

```math
\boxed{
\overrightarrow{OX}
=
\overrightarrow{OA}
+
t\overrightarrow{AB}
}
```

This is extremely important.

It says:

> Start at A and repeatedly move in the direction from A to B.

Every resulting point remains on the same line.

---

# 2.6 Numerical Example

Consider:

```text
A = (1, 2)

B = (4, 6)
```

The position vectors are:

```math
\overrightarrow{OA}
=
\begin{bmatrix}
1\\
2
\end{bmatrix}
```

and:

```math
\overrightarrow{OB}
=
\begin{bmatrix}
4\\
6
\end{bmatrix}
```

Therefore the direction vector is:

```math
\overrightarrow{AB}
=
\overrightarrow{OB}
-
\overrightarrow{OA}
```

Hence:

```math
\overrightarrow{AB}
=
\begin{bmatrix}
4\\
6
\end{bmatrix}
-
\begin{bmatrix}
1\\
2
\end{bmatrix}
```

So:

```math
\boxed{
\overrightarrow{AB}
=
\begin{bmatrix}
3\\
4
\end{bmatrix}
}
```

Therefore the line can be represented as:

```math
\boxed{
\overrightarrow{OX}
=
\begin{bmatrix}
1\\
2
\end{bmatrix}
+
t
\begin{bmatrix}
3\\
4
\end{bmatrix}
}
```

---

# 2.7 What Points Does This Generate?

Let's try different values of **t**.

### t = 0

```math
\overrightarrow{OX}
=
\begin{bmatrix}
1\\
2
\end{bmatrix}
```

So:

```text
X = (1, 2)
```

This is point A.

---

### t = 1

```math
\overrightarrow{OX}
=
\begin{bmatrix}
1\\
2
\end{bmatrix}
+
\begin{bmatrix}
3\\
4
\end{bmatrix}
```

Therefore:

```math
\overrightarrow{OX}
=
\begin{bmatrix}
4\\
6
\end{bmatrix}
```

So:

```text
X = (4, 6)
```

This is point B.

---

### t = 2

```math
\overrightarrow{OX}
=
\begin{bmatrix}
1\\
2
\end{bmatrix}
+
2
\begin{bmatrix}
3\\
4
\end{bmatrix}
```

Therefore:

```math
\overrightarrow{OX}
=
\begin{bmatrix}
7\\
10
\end{bmatrix}
```

So:

```text
X = (7, 10)
```

This is another point on the same line.

---

### t = -1

```math
\overrightarrow{OX}
=
\begin{bmatrix}
1\\
2
\end{bmatrix}
-
\begin{bmatrix}
3\\
4
\end{bmatrix}
```

Therefore:

```math
\overrightarrow{OX}
=
\begin{bmatrix}
-2\\
-2
\end{bmatrix}
```

So:

```text
X = (-2, -2)
```

This lies on the same line, but on the opposite side of A.

---

# 2.8 The Coordinate Form

Suppose:

```math
\overrightarrow{OA}
=
\begin{bmatrix}
x_1\\
y_1
\end{bmatrix}
```

and the direction vector is:

```math
\overrightarrow{d}
=
\begin{bmatrix}
d_x\\
d_y
\end{bmatrix}
```

Then:

```math
\overrightarrow{OX}
=
\begin{bmatrix}
x_1\\
y_1
\end{bmatrix}
+
t
\begin{bmatrix}
d_x\\
d_y
\end{bmatrix}
```

Therefore:

```math
\boxed{
x=x_1+td_x
}
```

and:

```math
\boxed{
y=y_1+td_y
}
```

These are the **parametric equations of the line**.

---

# 2.9 From Parametric Form to the Familiar Line Equation

Now we connect this with coordinate geometry.

We have:

```math
x=x_1+td_x
```

and:

```math
y=y_1+td_y
```

Assuming $d_x$ is non-zero, from the first equation:

```math
t=\frac{x-x_1}{d_x}
```

Substitute this into the second equation:

```math
y-y_1
=
d_y\frac{x-x_1}{d_x}
```

Therefore:

```math
\boxed{
y-y_1
=
\frac{d_y}{d_x}(x-x_1)
}
```

Notice something important.

The quantity:

```math
\boxed{
\frac{d_y}{d_x}
}
```

is the **slope of the line**.

Therefore:

```math
\boxed{
m=\frac{d_y}{d_x}
}
```

and we recover the familiar point-slope form:

```math
\boxed{
y-y_1=m(x-x_1)
}
```

So the vector description and coordinate-geometry description are saying exactly the same thing.

---

# 2.10 From Point-Slope Form to Standard Form

Starting with:

```math
y-y_1=m(x-x_1)
```

expand:

```math
y-y_1=mx-mx_1
```

Rearrange:

```math
mx-y+(y_1-mx_1)=0
```

Therefore the line has the standard form:

```math
\boxed{
ax+by+c=0
}
```

where the coefficients depend on the particular line.

This is the form we are going to connect to Machine Learning.

---

# 2.11 A Very Important Observation

Look at the standard equation:

```math
ax+by+c=0
```

The coefficients of x and y are:

```math
a,\quad b
```

We can collect them into a vector:

```math
\boxed{
\begin{bmatrix}
a\\
b
\end{bmatrix}
}
```

This vector will turn out to be **perpendicular to the line**.

That is the central idea we are ultimately trying to prove.

In Machine Learning, we give this vector a special name:

```math
\boxed{
\mathbf{w}
}
```

and the equation becomes:

```math
\boxed{
\mathbf{w}^{T}\mathbf{x}+w_0=0
}
```

We are **not proving yet** that w is perpendicular.

We have only arrived at the notation.

The proof comes later.

---

# 2.12 The Conceptual Transition

We have now travelled through three levels of description:

### Level 1 — Geometry

Two points determine a direction.

```math
\overrightarrow{AB}
```

↓

### Level 2 — Vector Algebra

A point plus a direction generates the entire line.

```math
\overrightarrow{OX}
=
\overrightarrow{OA}
+
t\overrightarrow{d}
```

↓

### Level 3 — Coordinate Geometry

The same line can be written as:

```math
ax+by+c=0
```

↓

### Level 4 — Linear Algebra / ML

We collect the coefficients into a vector and write:

```math
\boxed{
\mathbf{w}^{T}\mathbf{x}+w_0=0
}
```

This is the bridge from **coordinate geometry → linear algebra → Machine Learning**.

---

# 🔑 Part 2 — Key Takeaways

### 1. A line needs a point and a direction

```math
\boxed{
\text{Point}+\text{Direction}\Rightarrow\text{Line}
}
```

### 2. Two points provide a direction

```math
\boxed{
\overrightarrow{AB}
=
\overrightarrow{OB}
-
\overrightarrow{OA}
}
```

### 3. Parametric form

```math
\boxed{
\overrightarrow{OX}
=
\overrightarrow{OA}
+
t\overrightarrow{d}
}
```

### 4. Coordinate form

```math
\boxed{
x=x_1+td_x,\qquad
y=y_1+td_y
}
```

### 5. Standard form

```math
\boxed{
ax+by+c=0
}
```

### 6. ML form

```math
\boxed{
\mathbf{w}^{T}\mathbf{x}+w_0=0
}
```

And now comes the most interesting question:

> **Why does the coefficient vector w turn out to be perpendicular to the line?**

That is exactly what we will prove next.

---

## Part 3 — Understanding the Equation

In the next part, we will slow down and examine:

```math
\boxed{
\mathbf{w}^{T}\mathbf{x}+w_0=0
}
```

term by term:

**What is x?**

**What is w?**

**What is w₀?**

**Why does w control the orientation of the line?**

**Why does w₀ shift the line without changing its orientation?**

And only after that foundation will we move into the formal perpendicularity proof.

