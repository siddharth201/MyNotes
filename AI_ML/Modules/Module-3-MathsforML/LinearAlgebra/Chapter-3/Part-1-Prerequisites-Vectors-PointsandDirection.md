

# Part 1 — Prerequisites: Vectors, Points and Direction


## 1.1 Why Are We Studying These Prerequisites?

Our final goal is to prove:

```math
\boxed{\mathbf{w}\perp\text{the line}}
```
```math
\boxed{\boldsymbol{w} \perp \text{the line}}
```

```math
\boxed{\bm{w} \perp \text{the line}}
```

$$ \boxed{\boldsymbol{w} \perp \text{the line}} $$

But we cannot prove this immediately.

We first need to know:

1. How a point can be represented using a vector.
2. How to find the vector between two points.
3. How that vector tells us the direction of a line.
4. How perpendicularity is expressed using the dot product.

Once these ideas are connected, the proof becomes almost inevitable.

---

# 1.2 Triangle Law of Vector Addition

Suppose we move from point **A** to point **B**, and then from **B** to point **C**.

The total displacement is equivalent to moving directly from **A** to **C**.

The mathematical statement is:

```math
\boxed{
\overrightarrow{AB}
+
\overrightarrow{BC}
=
\overrightarrow{AC}
}
```

This is the **Triangle Law of Vector Addition**.

### Intuition

Think of a journey.

First movement:

**A → B**

Second movement:

**B → C**

Combined movement:

**A → C**

The intermediate point **B** does not change the final displacement.

This idea will later allow us to move naturally between points and vectors.

---

## 1.3 Why Is This Relevant to a Line?

Suppose A and B are two points on a straight line.

The vector from A to B lies **along that line**.

Therefore:

```math
\boxed{
\overrightarrow{AB}
}
```

is a direction vector of that line.

This gives us our first important connection:

> **Two points on a line can give us the direction of the line.**

---

# 1.4 Position Vector

Consider a point A somewhere in the coordinate plane.

Draw a vector from the origin **O** to A.

That vector is called the **position vector** of A.

For example, if:

```text
A = (2, 3)
```

then its position vector is:

```math
\boxed{
\mathbf{a}
=
\begin{bmatrix}
2\\
3
\end{bmatrix}
}
```

The position vector tells us where the point is relative to the origin.

---

## Point vs Position Vector

This distinction is worth making explicit.

### Point

A point represents a **location**.

### Vector

A vector represents a **magnitude and direction**.

A position vector connects these two ideas by representing the location of a point relative to the origin.

This distinction becomes important when we start subtracting points.

---

# 1.5 Vector Between Two Points

Suppose:

```text
A = (2, 3)

B = (5, 7)
```

Their position vectors are:

```math
\mathbf{a}
=
\begin{bmatrix}
2\\
3
\end{bmatrix}
```

and:

```math
\mathbf{b}
=
\begin{bmatrix}
5\\
7
\end{bmatrix}
```

The vector from A to B is obtained by:

```math
\boxed{
\overrightarrow{AB}
=
\mathbf{b}-\mathbf{a}
}
```

Therefore:

```math
\overrightarrow{AB}
=
\begin{bmatrix}
5\\
7
\end{bmatrix}
-
\begin{bmatrix}
2\\
3
\end{bmatrix}
```

which gives:

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

So moving from A to B means:

* move 3 units horizontally
* move 4 units vertically

---

# 1.6 Why Is It End Point Minus Start Point?

This is not just a formula to memorize.

Imagine going from A back to the origin and then from the origin to B.

From A to O:

```math
\overrightarrow{AO}=-\mathbf{a}
```

From O to B:

```math
\overrightarrow{OB}=\mathbf{b}
```

Therefore, by the triangle law:

```math
\overrightarrow{AB}
=
\overrightarrow{AO}
+
\overrightarrow{OB}
```

So:

```math
\overrightarrow{AB}
=
-\mathbf{a}+\mathbf{b}
```

Hence:

```math
\boxed{
\overrightarrow{AB}
=
\mathbf{b}-\mathbf{a}
}
```

Therefore:

> **Direction from A to B = position of B − position of A.**

This is the geometric reason behind the familiar **end point − start point** rule.

---

# 1.7 Direction Vector of a Line

Now consider a line containing two points A and B.

The vector from A to B lies along the line.

Therefore it provides the line's direction.

We call it a **direction vector**.

If the position vectors of the two points are **x₁** and **x₂**, then:

```math
\boxed{
\mathbf{d}
=
\mathbf{x}_2-\mathbf{x}_1
}
```

where **d** is a direction vector of the line.

---

# 1.8 Direction Vector vs Normal Vector

This distinction will become the heart of this chapter.

### Direction vector

Points **along** the line.

```text
Line direction → d
```

### Normal vector

Points **perpendicular** to the line.

```text
Normal direction → w
```

Therefore, if **w** is perpendicular to the line direction **d**, then:

```math
\boxed{
\mathbf{w}^{T}\mathbf{d}=0
}
```

because the dot product of perpendicular vectors is zero.

We have therefore arrived at the exact relationship that our final proof must establish.

---

# 1.9 The Chain We Are Building

Keep this chain in your mind:

```text
Two Points
    ↓
Position Vectors
    ↓
Subtract
    ↓
Direction Vector
    ↓
Line Direction
    ↓
Find a Perpendicular Vector
    ↓
Normal Vector
```

Our final objective is to show that the vector **w** appearing in:

```math
\boxed{
\mathbf{w}^{T}\mathbf{x}+w_0=0
}
```

is precisely that normal vector.

---

# 1.10 The Key Formula to Remember

For two points on a line:

```math
\boxed{
\mathbf{d}
=
\mathbf{x}_2-\mathbf{x}_1
}
```

And perpendicularity is expressed through:

```math
\boxed{
\mathbf{w}^{T}\mathbf{d}=0
}
```

Combining these:

```math
\boxed{
\mathbf{w}^{T}
(\mathbf{x}_2-\mathbf{x}_1)
=
0
}
```

**This equation will reappear in the main proof.**

---

# 🧠 Mental Model

Don't memorize a collection of unrelated formulas.

Think:

> **A line has a direction.**

Two points on the line allow us to find that direction.

```math
\mathbf{d}
=
\mathbf{x}_2-\mathbf{x}_1
```

A vector perpendicular to that direction is a **normal vector**.

And our upcoming task is to prove that **w** is exactly that normal vector.

---

# 🔑 Part 1 Summary

We have established:

### Triangle Law

```math
\boxed{
\overrightarrow{AB}
+
\overrightarrow{BC}
=
\overrightarrow{AC}
}
```

### Position Vector

A point can be represented relative to the origin by its position vector.

### Vector Between Two Points

```math
\boxed{
\overrightarrow{AB}
=
\mathbf{b}-\mathbf{a}
}
```

### Direction Vector of a Line

```math
\boxed{
\mathbf{d}
=
\mathbf{x}_2-\mathbf{x}_1
}
```

### Perpendicularity

```math
\boxed{
\mathbf{w}^{T}\mathbf{d}=0
}
```

And this gives us the foundation for the central theorem:

```math
\boxed{
\mathbf{w}\perp\text{line}
}
```

---

## 🔭 Next Part

### Part 2 — From Two Points to the Equation of a Line

Now that we know how to obtain the **direction of a line**, we'll take the next step:

**two points → direction vector → mathematical equation of the line**

Then we'll gradually arrive at the ML form:

```math
\boxed{
\mathbf{w}^{T}\mathbf{x}+w_0=0
}
```

Only after understanding that equation will we move to the main proof.

