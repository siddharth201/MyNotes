# Part 7 — Numerical Examples

We have already derived the point-to-plane distance formula. Now we will **use it on concrete examples**.

The goal of this part is not to introduce new theory. It is to make the derivation operational and develop the habit of solving these problems systematically.

---

## 7.1 Formula We Are Using

For the plane

```math id="p7-plane"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

and a point represented by

```math id="p7-point"
\overrightarrow{x}
```

the perpendicular distance is:

```math id="p7-distance"
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

We will repeatedly break this into two parts:

### Numerator

```math id="p7-numerator"
\boxed{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
}
```

### Denominator

```math id="p7-denominator"
\boxed{
\|\overrightarrow{w}\|
}
```

Then:

```math id="p7-final"
\boxed{
d=\frac{\text{numerator}}{\text{denominator}}
}
```

---

# 7.2 Example 1 — Simple 2D Case

Consider the line:

```math id="p7-e1-line"
\boxed{
3x+4y-10=0
}
```

and the point:

```math id="p7-e1-point"
\boxed{
P=(2,1)
}
```

Although our topic is called **point-to-plane distance**, a line in 2D is the exact same mathematical structure. It is useful to begin here.

---

## Step 1 — Identify the Normal Vector

From:

```math id="p7-e1-line-again"
3x+4y-10=0
```

we identify:

```math id="p7-e1-w"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
3\\
4
\end{bmatrix}
}
```

and:

```math id="p7-e1-w0"
\boxed{
w_0=-10
}
```

---

## Step 2 — Represent the Point

```math id="p7-e1-x"
\boxed{
\overrightarrow{x}
=
\begin{bmatrix}
2\\
1
\end{bmatrix}
}
```

---

## Step 3 — Calculate $\overrightarrow{w}^{T}\overrightarrow{x}$

```math id="p7-e1-dot"
\overrightarrow{w}^{T}\overrightarrow{x}
=
\begin{bmatrix}
3&4
\end{bmatrix}
\begin{bmatrix}
2\\
1
\end{bmatrix}
```

Therefore:

```math id="p7-e1-dot2"
=
3(2)+4(1)
```

```math id="p7-e1-dot3"
=6+4
```

```math id="p7-e1-dot4"
\boxed{
=10
}
```

---

## Step 4 — Add $w_0$

```math id="p7-e1-score"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
=
10-10
```

Therefore:

```math id="p7-e1-score2"
\boxed{
=0
}
```

So the point lies **on the line**.

---

## Step 5 — Calculate the Distance

```math id="p7-e1-distance"
d
=
\frac{|0|}
{
\sqrt{3^2+4^2}
}
```

```math id="p7-e1-distance2"
=
\frac{0}{5}
```

Therefore:

```math id="p7-e1-final"
\boxed{
d=0
}
```

### Why?

Because:

```math id="p7-e1-verification"
3(2)+4(1)-10=0
```

The point satisfies the equation of the line exactly.

---

# 7.3 Example 2 — Point Outside the Line

Keep the same line:

```math id="p7-e2-line"
\boxed{
3x+4y-10=0
}
```

but now take:

```math id="p7-e2-point"
\boxed{
P=(0,0)
}
```

---

## Step 1 — Normal Vector

Same as before:

```math id="p7-e2-w"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
3\\
4
\end{bmatrix}
}
```

---

## Step 2 — Point Vector

```math id="p7-e2-x"
\boxed{
\overrightarrow{x}
=
\begin{bmatrix}
0\\
0
\end{bmatrix}
}
```

---

## Step 3 — Evaluate the Linear Expression

```math id="p7-e2-expression"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
=
3(0)+4(0)-10
```

```math id="p7-e2-expression2"
\boxed{
=-10
}
```

---

## Step 4 — Take Absolute Value

```math id="p7-e2-absolute"
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
=
|-10|
```

```math id="p7-e2-absolute2"
\boxed{
=10
}
```

---

## Step 5 — Calculate the Normal Magnitude

```math id="p7-e2-norm"
\|\overrightarrow{w}\|
=
\sqrt{3^2+4^2}
```

```math id="p7-e2-norm2"
=\sqrt{25}
```

```math id="p7-e2-norm3"
\boxed{
=5
}
```

---

## Step 6 — Distance

```math id="p7-e2-distance"
d
=
\frac{10}{5}
```

Therefore:

```math id="p7-e2-final"
\boxed{
d=2
}
```

So the origin is **2 units away from the line**.

---

# 7.4 Example 3 — A 3D Point-to-Plane Problem

Now let's move to the actual 3D case.

Consider the plane:

```math id="p7-e3-plane"
\boxed{
2x+3y+6z-12=0
}
```

and the point:

```math id="p7-e3-point"
\boxed{
P=(1,1,1)
}
```

---

## Step 1 — Identify $\overrightarrow{w}$

```math id="p7-e3-w"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
2\\
3\\
6
\end{bmatrix}
}
```

and:

```math id="p7-e3-w0"
\boxed{
w_0=-12
}
```

---

## Step 2 — Represent the Point

```math id="p7-e3-x"
\boxed{
\overrightarrow{x}
=
\begin{bmatrix}
1\\
1\\
1
\end{bmatrix}
}
```

---

## Step 3 — Calculate the Dot Product

```math id="p7-e3-dot"
\overrightarrow{w}^{T}\overrightarrow{x}
=
2(1)+3(1)+6(1)
```

```math id="p7-e3-dot2"
=2+3+6
```

```math id="p7-e3-dot3"
\boxed{
=11
}
```

---

## Step 4 — Add $w_0$

```math id="p7-e3-expression"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
=
11-12
```

```math id="p7-e3-expression2"
\boxed{
=-1
}
```

---

## Step 5 — Absolute Value

```math id="p7-e3-abs"
\boxed{
|-1|=1
}
```

---

## Step 6 — Normal Magnitude

```math id="p7-e3-norm"
\|\overrightarrow{w}\|
=
\sqrt{2^2+3^2+6^2}
```

```math id="p7-e3-norm2"
=
\sqrt{4+9+36}
```

```math id="p7-e3-norm3"
=
\sqrt{49}
```

```math id="p7-e3-norm4"
\boxed{
=7
}
```

---

## Step 7 — Distance

```math id="p7-e3-distance"
d
=
\frac{1}{7}
```

Therefore:

```math id="p7-e3-final"
\boxed{
d=\frac{1}{7}
}
```

So the point is exactly:

```math id="p7-e3-final-decimal"
\boxed{
\frac{1}{7}
\text{ units}
}
```

away from the plane.

---

# 7.5 Example 4 — A Point Exactly on a 3D Plane

Consider:

```math id="p7-e4-plane"
\boxed{
x+2y+2z-6=0
}
```

Take:

```math id="p7-e4-point"
\boxed{
P=(2,1,1)
}
```

Let's first check whether the point is on the plane.

```math id="p7-e4-check"
2+2(1)+2(1)-6
```

```math id="p7-e4-check2"
=2+2+2-6
```

```math id="p7-e4-check3"
\boxed{
=0
}
```

Therefore:

```text id="p7-e4-result"
Point lies on plane.
```

Consequently:

```math id="p7-e4-distance"
\boxed{
d=0
}
```

### Important pattern

Whenever:

```math id="p7-zero-condition"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

the point is on the plane and therefore:

```math id="p7-zero-distance"
\boxed{
d=0
}
```

---

# 7.6 Example 5 — Understanding the Sign

Consider:

```math id="p7-e5-plane"
\boxed{
x+y+z-3=0
}
```

Take:

```math id="p7-e5-point"
\boxed{
P=(0,0,0)
}
```

The normal vector is:

```math id="p7-e5-w"
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

and:

```math id="p7-e5-w0"
\boxed{
w_0=-3
}
```

Evaluate:

```math id="p7-e5-expression"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
=
0+0+0-3
```

```math id="p7-e5-expression2"
\boxed{
=-3
}
```

So the **signed distance** is:

```math id="p7-e5-signed"
d_{\text{signed}}
=
\frac{-3}{\sqrt{3}}
```

which is:

```math id="p7-e5-signed2"
\boxed{
d_{\text{signed}}
=
-\sqrt{3}
}
```

But the ordinary distance is:

```math id="p7-e5-distance"
\boxed{
d=\sqrt{3}
}
```

We will dedicate the next part specifically to understanding **why this absolute value is necessary**.

---

# 7.7 A Very Useful Shortcut

Once you understand the derivation, you don't need to explicitly find $`\overrightarrow{x_1}`$ and $`\overrightarrow{AB}`$ for every numerical problem.

You can directly use:

```math id="p7-shortcut"
\boxed{
d
=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
}
```

For example:

```math id="p7-shortcut-example"
2x+3y+6z-12=0
```

and:

```math id="p7-shortcut-point"
(1,1,1)
```

Immediately identify:

```math id="p7-shortcut-w"
\overrightarrow{w}
=
\begin{bmatrix}
2\\
3\\
6
\end{bmatrix}
```

Then:

```math id="p7-shortcut-calc"
d
=
\frac{
|2(1)+3(1)+6(1)-12|
}{
\sqrt{2^2+3^2+6^2}
}
```

```math id="p7-shortcut-calc2"
=
\frac{|-1|}{7}
```

Therefore:

```math id="p7-shortcut-final"
\boxed{
d=\frac{1}{7}
}
```

The shortcut is useful **because we already understand the derivation behind it**.

---

# 7.8 Numerical Problem-Solving Template

For exams, interviews, or coding problems, use this template.

### Given plane

```math id="p7-template-plane"
ax_1+ax_2+\cdots+ax_d+c=0
```

### Given point

```math id="p7-template-point"
(x_1,x_2,\ldots,x_d)
```

### Step 1

Extract the normal vector:

```math id="p7-template-w"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
a_1\\
a_2\\
\vdots\\
a_d
\end{bmatrix}
}
```

### Step 2

Evaluate the plane expression at the point:

```math id="p7-template-expression"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

### Step 3

Take absolute value.

### Step 4

Calculate:

```math id="p7-template-norm"
\|\overrightarrow{w}\|
```

### Step 5

Divide.

```math id="p7-template-final"
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

# 7.9 What These Examples Teach Us

Across all the examples, the same structure keeps appearing:

```text id="p7-pattern"
Plane
   ↓
Extract w and w₀
   ↓
Evaluate wᵀx + w₀
   ↓
Take | |
   ↓
Calculate ||w||
   ↓
Divide
   ↓
Distance
```

There is no separate formula for:

* 2D,
* 3D,
* or higher dimensions.

The same expression works:

```math id="p7-general"
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

Only the number of components changes.

---

# 🎯 Ultimate Goal in ML — Simple View

For a linear ML boundary:

```math id="p7-ml-boundary"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

we can calculate the distance of any data point from that boundary.

In simple terms:

> **The model has drawn a separating boundary. This formula tells us how far a particular data point is from that boundary.**

For example:

```text id="p7-ml-simple"
Far from boundary
       ●

       ↓

────────────────────
 Decision Boundary
────────────────────

       ↑

Close to boundary
       ●
```

So this mathematical concept gives us a numerical way to talk about **how close a point is to a linear boundary**.

We will explore the ML interpretation properly in **Part 10**, after first understanding the geometry and the role of the absolute value.

---

# 🧠 Part 7 — Mental Model

Don't memorize the numerical procedure as a collection of steps.

Think:

```text id="p7-mental"
"Put the point into the plane equation."
              ↓
        wᵀx + w₀
              ↓
     "How much normal-direction
      displacement does this represent?"
              ↓
          divide by ||w||
              ↓
          take | | 
              ↓
        actual distance
```

---

# 🔑 Part 7 Takeaways

### 1. A point on the plane has distance zero

```math id="p7-takeaway1"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
\Rightarrow d=0
}
```

### 2. The numerator is the plane equation evaluated at the point

```math id="p7-takeaway2"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

### 3. The denominator is the magnitude of the normal vector

```math id="p7-takeaway3"
\boxed{
\|\overrightarrow{w}\|
}
```

### 4. The final distance is always non-negative

```math id="p7-takeaway4"
\boxed{
d\geq0
}
```

### 5. The same formula works in any dimension

```text id="p7-takeaway5"
2D → line
3D → plane
d-D → hyperplane
```

---

## Next

We have now **used the formula numerically**.

The one remaining question that appeared naturally in our examples is:

> **Why did some calculations produce a negative value before we took the absolute value?**

That is exactly what we will answer next:

# **Part 8 — Why the Absolute Value?**

