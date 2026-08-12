# Part 2 — The Origin as a Special Point

Before deriving anything, let's make the **origin** completely intuitive.

We already know the general point-to-plane problem. Now we are simply asking:

> **What changes when the point we are measuring from is the origin?**

The answer is mathematically simple, but understanding *why* it becomes simple is more important than the formula.

---

# 2.1 First: What Exactly Is the Origin?

The origin is our **reference point**.

In 2D:

```math
\boxed{
O=(0,0)
}
```

or as a vector:

```math
\boxed{
\overrightarrow{O}
=
\begin{bmatrix}
0\\
0
\end{bmatrix}
}
```

In 3D:

```math
\boxed{
O=(0,0,0)
}
```

or:

```math
\boxed{
\overrightarrow{O}
=
\begin{bmatrix}
0\\
0\\
0
\end{bmatrix}
}
```

In $n$ dimensions:

```math
\boxed{
\overrightarrow{O}
=
\begin{bmatrix}
0\\
0\\
\vdots\\
0
\end{bmatrix}
}
```

So the origin is simply:

> **The point where all coordinates are zero.**

---

# 2.2 Why Is the Origin Special?

Imagine a map.

You could ask:

> How far is Delhi from Varanasi?

To answer that, you need the coordinates of both places.

But suppose you choose one special reference location as:

```text
"Starting Point = 0"
```

Now every location can be described relative to that reference.

The origin plays a similar role in coordinate geometry.

It is the **reference point from which coordinates are measured**.

So:

```text
             ↑ y
             |
             |
             |
─────────────O────────────→ x
             |
             |
```

Everything is measured relative to $O$.

---

# 2.3 Why Does the Origin Have Zero Coordinates?

Suppose a point is:

```math
P=(3,2)
```

That means:

```text
3 units → along x
2 units ↑ along y
```

But the origin requires no movement:

```text
0 units → along x
0 units ↑ along y
```

Therefore:

```math
O=(0,0)
```

That's why the origin is mathematically the simplest point possible.

---

# 2.4 Origin as a Vector

This is an important distinction.

We can represent the origin as a point:

```math
O=(0,0)
```

or as a position vector:

```math
\overrightarrow{O}
=
\begin{bmatrix}
0\\
0
\end{bmatrix}
```

For our ML mathematics, we'll mostly work with the vector representation:

```math
\boxed{
\overrightarrow{x}=\overrightarrow{0}
}
```

when the point is the origin.

---

# 2.5 Put the Origin Into Our Plane Equation

Our plane is:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

For a general point:

```math
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2\\
\vdots\\
x_n
\end{bmatrix}
```

we calculate:

```math
\overrightarrow{w}^{T}\overrightarrow{x}
```

But for the origin:

```math
\boxed{
\overrightarrow{x}=\overrightarrow{0}
}
```

Therefore:

```math
\overrightarrow{w}^{T}\overrightarrow{0}
```

---

# 2.6 Why Does $\overrightarrow{w}^{T}\overrightarrow{0}=0$?

Let's not just accept this as a rule.

Suppose:

```math
\overrightarrow{w}
=
\begin{bmatrix}
w_1\\
w_2\\
w_3
\end{bmatrix}
```

and:

```math
\overrightarrow{0}
=
\begin{bmatrix}
0\\
0\\
0
\end{bmatrix}
```

The dot product is:

```math
\overrightarrow{w}^{T}\overrightarrow{0}
=
w_1(0)+w_2(0)+w_3(0)
```

Therefore:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{0}=0
}
```

Nothing mysterious happened.

We simply multiplied every component by zero.

---

# 2.7 The Layman Interpretation

This is actually a beautiful way to think about it.

The dot product:

```math
\overrightarrow{w}^{T}\overrightarrow{x}
```

asks, roughly:

> **"How much does the point's vector contribute along the direction $\overrightarrow{w}$?"**

At the origin:

```math
\overrightarrow{x}=\overrightarrow{0}
```

There is **no displacement from the origin**.

So there is nothing to contribute.

Hence:

```math
\overrightarrow{w}^{T}\overrightarrow{0}=0
```

Think:

> **Origin = no movement from the reference point = zero vector.**

---

# 2.8 Now Substitute Into the Plane Equation

Our plane equation is:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

At the origin:

```math
\overrightarrow{x}=\overrightarrow{0}
```

Therefore:

```math
\overrightarrow{w}^{T}\overrightarrow{0}+w_0
```

Since:

```math
\overrightarrow{w}^{T}\overrightarrow{0}=0
```

we get:

```math
\boxed{
w_0
}
```

So the value of the plane equation **at the origin** is simply $w_0$.

This is an extremely useful observation.

---

# 2.9 What Does $w_0$ Tell Us About the Origin?

Now we can ask:

> Is the origin on the plane?

The plane equation says a point is on the plane when:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

For the origin, this becomes:

```math
w_0=0
```

Therefore:

```text
If w₀ = 0
      ↓
Origin lies on the plane
```

And if:

```text
If w₀ ≠ 0
      ↓
Origin does NOT lie on the plane
```

This is a very useful shortcut.

---

# 2.10 Visualising the Two Cases

### Case 1 — Plane passes through origin

```text
                 ↑
                 |
                 |
─────────────────O────────────────→
              Plane
```

Here:

```math
\boxed{
w_0=0
}
```

because the origin satisfies the plane equation.

---

### Case 2 — Plane does not pass through origin

```text
                 ↑
                 |
                 ●
────────────────────────
        Plane

        O
```

The origin is somewhere away from the plane.

Therefore:

```math
\boxed{
w_0\neq0
}
```

Now there is a non-zero distance between the origin and the plane.

---

# 2.11 This Gives Us an Important Shortcut

For the general point-to-plane distance:

```math
d=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
```

put:

```math
\overrightarrow{x}=\overrightarrow{0}
```

Then:

```math
d=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{0}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
```

and because:

```math
\overrightarrow{w}^{T}\overrightarrow{0}=0
```

we obtain:

```math
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

We have now derived the special formula.

But don't treat this as a formula to memorize.

The better memory is:

> **General distance formula + origin means $\overrightarrow{x}=0$.**

That's all.

---

# 2.12 A Very Important Visual Connection

Notice something interesting.

The plane is:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

The vector $\overrightarrow{w}$ determines the **orientation** of the plane.

The $w_0$ term determines where the plane sits relative to the origin.

Conceptually:

```text
             w
             ↑
             │
             │
─────────────┼────────────
             │
             │
          Plane
```

If you change $\overrightarrow{w}$, you can change the plane's orientation.

If you change $w_0$, you shift the plane.

This will become **very important in Machine Learning**.

---

# 2.13 A Simple Analogy: A Wall

Imagine a wall in your room.

The wall has an orientation.

```text
        │
        │
        │
        │
        │
```

That orientation is related to the normal direction $\overrightarrow{w}$.

Now imagine moving the wall:

```text
Before:

        │
        │
        │


After:

                  │
                  │
                  │
```

The orientation stayed the same.

The wall simply moved.

In our equation:

```text
w
↓
orientation

w₀
↓
position
```

This analogy is not the complete mathematical story, but it is a very useful mental model.

---

# 2.14 ML Interpretation

Now let's translate this into ML language.

Our linear boundary is:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

Think of it as a **wall separating regions of feature space**.

The vector:

```math
\overrightarrow{w}
```

tells us the wall's normal direction.

The bias:

```math
w_0
```

helps determine where that wall is located.

Now the origin is simply our reference point:

```math
\overrightarrow{x}=\overrightarrow{0}
```

So:

```math
\overrightarrow{w}^{T}\overrightarrow{0}+w_0
=
w_0
```

Therefore $w_0$ tells us the **signed score of the origin relative to the boundary**.

And after normalization:

```math
\boxed{
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

gives its actual perpendicular distance from the boundary.

---

# 🎯 Ultimate Goal in ML — Simple Terms

Imagine our feature space is a huge room.

The ML model puts a **wall** somewhere inside that room:

```text
Class A     │     Class B
            │
            │
            │
            │
       Decision Boundary
```

The origin is our coordinate system's **reference location**.

Now we ask:

> **How far is this reference location from the model's wall?**

That is the concept we are learning.

And mathematically:

```math
\boxed{
d_{\text{origin}}
=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

---

# 2.15 One More Important Clarification

Don't interpret:

> "$w_0$ itself is the distance."

That would be incorrect.

For example, suppose:

```math
w_0=10
```

and:

```math
\|\overrightarrow{w}\|=5
```

Then:

```math
d=\frac{10}{5}=2
```

So $w_0$ is related to the origin's **signed score**, but the actual geometric distance is:

```math
\boxed{
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

The normalization by $|\overrightarrow{w}|$ is essential.

---

# 2.16 Connection to Our Previous Learning

Look at how many previous concepts are coming together:

```text
Origin
   ↓
Zero vector
   ↓
Dot product with zero
   ↓
wᵀ0 = 0
   ↓
Plane equation
   ↓
w₀ remains
   ↓
Distance
   ↓
Projection along normal
```

This is exactly what we want from our mathematics curriculum.

We aren't learning isolated formulas.

We're **reusing old concepts to derive new ones**.

---

# 🧠 Part 2 Mental Model

If you remember only one picture:

```text
                     w
                     ↑
                     │
                     │
                     │
─────────────────────┼────────────
                   Plane
                     
                     
                     ●
                   Origin
```

And think:

> **The origin is just another point. Its special property is that every coordinate is zero.**

Therefore:

```math
\overrightarrow{x}=\overrightarrow{0}
```

which means:

```math
\overrightarrow{w}^{T}\overrightarrow{x}
=
\overrightarrow{w}^{T}\overrightarrow{0}
=
0
```

and therefore the general distance formula simplifies to:

```math
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

---

## 🔑 Part 2 Takeaways

1. **Origin means all coordinates are zero.**

```math
\boxed{
\overrightarrow{x}=\overrightarrow{0}
}
```

2. **Dot product with the zero vector is zero.**

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{0}=0
}
```

3. **The plane equation evaluated at the origin becomes $w_0$.**

4. **The origin lies on the plane iff:**

```math
\boxed{
w_0=0
}
```

5. **If $w_0\neq0$, the origin is outside the plane.**

6. **The actual distance is:**

```math
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

7. **ML interpretation:** $\overrightarrow{w}$ controls the boundary's orientation, while $w_0$ helps determine its position relative to the origin.

---

### Next: **Part 3 — Deriving the Origin-to-Plane Distance**

We will take the **general point-to-plane distance formula we already proved**, substitute the origin step by step, and then use a concrete plane such as $3x+4y-12=0$ to see exactly what the formula is measuring geometrically.

