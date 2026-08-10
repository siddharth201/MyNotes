# Part 7 — Numerical Examples

In the previous parts, we established the theorem:

> For a line represented by $`\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0`$, the vector $`\overrightarrow{w}`$ is perpendicular to the line.

Now we will verify this numerically.

The goal is not merely to calculate answers. We want to see the complete chain:

**Line equation → choose points → direction vector → dot product → perpendicularity**

---

# 7.1 Example 1 — A Simple Line

Consider the line:

```math id="p7-e1-line"
\boxed{
x_1+x_2+2=0
}
```

We can compare this with the general form:

```math id="p7-e1-general"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

Therefore:

```math id="p7-e1-w"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
1\\
1
\end{bmatrix}
}
```

and:

```math id="p7-e1-bias"
\boxed{
w_0=2
}
```

So the normal vector is:

```math id="p7-e1-normal"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
1\\
1
\end{bmatrix}
}
```

---

# 7.2 Find Two Points on the Line

We need two points satisfying:

```math id="p7-e1-condition"
x_1+x_2+2=0
```

### Choose the first point

Let:

```math id="p7-e1-a"
x_1=0
```

Then:

```math id="p7-e1-a2"
0+x_2+2=0
```

Therefore:

```math id="p7-e1-a3"
x_2=-2
```

So one point is:

```math id="p7-e1-A"
\boxed{
A=(0,-2)
}
```

---

### Choose the second point

Let:

```math id="p7-e1-b"
x_1=2
```

Then:

```math id="p7-e1-b2"
2+x_2+2=0
```

Therefore:

```math id="p7-e1-b3"
x_2=-4
```

So the second point is:

```math id="p7-e1-B"
\boxed{
B=(2,-4)
}
```

---

# 7.3 Verify That Both Points Actually Lie on the Line

For A:

```math id="p7-e1-check-a"
0+(-2)+2=0
```

Correct.

For B:

```math id="p7-e1-check-b"
2+(-4)+2=0
```

Correct.

Therefore both A and B lie on the line.

---

# 7.4 Find the Direction Vector

The direction from A to B is:

```math id="p7-e1-dir"
\overrightarrow{AB}
=
\begin{bmatrix}
2\\
-4
\end{bmatrix}
-
\begin{bmatrix}
0\\
-2
\end{bmatrix}
```

Therefore:

```math id="p7-e1-dir2"
\boxed{
\overrightarrow{AB}
=
\begin{bmatrix}
2\\
-2
\end{bmatrix}
}
```

This vector points **along the line**.

---

# 7.5 Calculate the Dot Product

Our normal vector is:

```math id="p7-e1-w2"
\overrightarrow{w}
=
\begin{bmatrix}
1\\
1
\end{bmatrix}
```

Our direction vector is:

```math id="p7-e1-d2"
\overrightarrow{d}
=
\begin{bmatrix}
2\\
-2
\end{bmatrix}
```

Calculate their dot product:

```math id="p7-e1-dot"
\overrightarrow{w}^{T}\overrightarrow{d}
=
\begin{bmatrix}
1 & 1
\end{bmatrix}
\begin{bmatrix}
2\\
-2
\end{bmatrix}
```

Therefore:

```math id="p7-e1-dot2"
=1(2)+1(-2)
```

So:

```math id="p7-e1-zero"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

Therefore:

```math id="p7-e1-perp"
\boxed{
\overrightarrow{w}\perp\overrightarrow{d}
}
```

Since $`\overrightarrow{d}`$ is along the line:

```math id="p7-e1-final"
\boxed{
\overrightarrow{w}\perp\text{line}
}
```

The theorem works numerically.

---

# 7.6 Example 2 — A Different Orientation

Let's make the example less symmetric.

Consider:

```math id="p7-e2-line"
\boxed{
2x_1+3x_2-6=0
}
```

Therefore:

```math id="p7-e2-w"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
2\\
3
\end{bmatrix}
}
```

and:

```math id="p7-e2-bias"
\boxed{
w_0=-6
}
```

---

# 7.7 Find Two Points

### First point

Choose:

```math id="p7-e2-a"
x_1=0
```

Then:

```math id="p7-e2-a2"
2(0)+3x_2-6=0
```

So:

```math id="p7-e2-a3"
3x_2=6
```

Therefore:

```math id="p7-e2-a4"
x_2=2
```

Hence:

```math id="p7-e2-A"
\boxed{
A=(0,2)
}
```

---

### Second point

Choose:

```math id="p7-e2-b"
x_1=3
```

Then:

```math id="p7-e2-b2"
2(3)+3x_2-6=0
```

So:

```math id="p7-e2-b3"
6+3x_2-6=0
```

Therefore:

```math id="p7-e2-b4"
x_2=0
```

Hence:

```math id="p7-e2-B"
\boxed{
B=(3,0)
}
```

---

# 7.8 Find the Direction Vector

The vector from A to B is:

```math id="p7-e2-dir"
\overrightarrow{AB}
=
\begin{bmatrix}
3\\
0
\end{bmatrix}
-
\begin{bmatrix}
0\\
2
\end{bmatrix}
```

Therefore:

```math id="p7-e2-dir2"
\boxed{
\overrightarrow{AB}
=
\begin{bmatrix}
3\\
-2
\end{bmatrix}
}
```

---

# 7.9 Verify Perpendicularity

We have:

```math id="p7-e2-w"
\overrightarrow{w}
=
\begin{bmatrix}
2\\
3
\end{bmatrix}
```

and:

```math id="p7-e2-d"
\overrightarrow{d}
=
\begin{bmatrix}
3\\
-2
\end{bmatrix}
```

Calculate:

```math id="p7-e2-dot"
\overrightarrow{w}^{T}\overrightarrow{d}
=
\begin{bmatrix}
2 & 3
\end{bmatrix}
\begin{bmatrix}
3\\
-2
\end{bmatrix}
```

Therefore:

```math id="p7-e2-dot2"
=2(3)+3(-2)
```

```math id="p7-e2-dot3"
=6-6
```

Hence:

```math id="p7-e2-result"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

Therefore:

```math id="p7-e2-final"
\boxed{
\overrightarrow{w}\perp\text{line}
}
```

Again, the theorem holds.

---

# 7.10 What Did We Notice?

Compare the two examples.

### Example 1

```math id="p7-compare1"
\overrightarrow{w}
=
\begin{bmatrix}
1\\
1
\end{bmatrix}
```

Direction:

```math id="p7-compare1d"
\overrightarrow{d}
=
\begin{bmatrix}
2\\
-2
\end{bmatrix}
```

Dot product:

```math id="p7-compare1dot"
0
```

---

### Example 2

```math id="p7-compare2"
\overrightarrow{w}
=
\begin{bmatrix}
2\\
3
\end{bmatrix}
```

Direction:

```math id="p7-compare2d"
\overrightarrow{d}
=
\begin{bmatrix}
3\\
-2
\end{bmatrix}
```

Dot product:

```math id="p7-compare2dot"
0
```

The actual numbers changed, the orientation changed, and the points changed.

But the fundamental relationship remained:

```math id="p7-invariant"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

That is the important invariant.

---

# 7.11 Example 3 — Changing the Bias

Now let's demonstrate something we discussed in Part 6.

Consider:

```math id="p7-shift1"
x_1+x_2+2=0
```

and:

```math id="p7-shift2"
x_1+x_2-5=0
```

Their normal vectors are:

```math id="p7-shift-w"
\overrightarrow{w}
=
\begin{bmatrix}
1\\
1
\end{bmatrix}
```

for both equations.

Only the bias changes:

```math id="p7-shift-bias"
w_0=2
```

versus:

```math id="p7-shift-bias2"
w_0=-5
```

Therefore:

> The lines have the same normal direction and hence the same orientation.

They are simply shifted relative to each other.

This gives us a numerical confirmation of the geometric interpretation from Part 6.

---

# 7.12 Example 4 — Changing w Changes the Orientation

Now compare:

```math id="p7-orientation1"
x_1+x_2+2=0
```

with:

```math id="p7-orientation2"
2x_1+x_2+2=0
```

For the first line:

```math id="p7-orientation-w1"
\overrightarrow{w}_1
=
\begin{bmatrix}
1\\
1
\end{bmatrix}
```

For the second:

```math id="p7-orientation-w2"
\overrightarrow{w}_2
=
\begin{bmatrix}
2\\
1
\end{bmatrix}
```

The normal directions are different.

Therefore the orientations of the lines are different.

So numerically we can see:

```text id="p7-orientation-summary"
Change w
   ↓
Change normal direction
   ↓
Change line orientation
```

Whereas:

```text id="p7-bias-summary"
Change w₀
   ↓
Same normal direction
   ↓
Line shifts
```

---

# 7.13 A Useful Shortcut for Finding a Direction Vector

There is another pattern worth noticing.

Suppose the line is:

```math id="p7-shortcut-line"
\boxed{
ax_1+bx_2+c=0
}
```

Then the normal vector is:

```math id="p7-shortcut-normal"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
a\\
b
\end{bmatrix}
}
```

A convenient direction vector is:

```math id="p7-shortcut-direction"
\boxed{
\overrightarrow{d}
=
\begin{bmatrix}
b\\
-a
\end{bmatrix}
}
```

Why?

Because:

```math id="p7-shortcut-dot"
\overrightarrow{w}^{T}\overrightarrow{d}
=
\begin{bmatrix}
a & b
\end{bmatrix}
\begin{bmatrix}
b\\
-a
\end{bmatrix}
```

Therefore:

```math id="p7-shortcut-dot2"
=ab-ab
```

So:

```math id="p7-shortcut-zero"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

Hence the two vectors are perpendicular.

This is a useful computational shortcut, but remember:

> **The shortcut is not the proof.**

Our earlier two-point proof explains **why** the normal vector has this relationship with the line.

---

# 7.14 Connection With Slope

For the line:

```math id="p7-slope-line"
2x_1+3x_2-6=0
```

we can write:

```math id="p7-slope-rearrange"
3x_2=-2x_1+6
```

Therefore:

```math id="p7-slope-value"
\boxed{
x_2=-\frac{2}{3}x_1+2
}
```

So the line has slope:

```math id="p7-slope"
\boxed{
m=-\frac{2}{3}
}
```

Our normal vector was:

```math id="p7-slope-w"
\overrightarrow{w}
=
\begin{bmatrix}
2\\
3
\end{bmatrix}
```

A direction vector was:

```math id="p7-slope-d"
\overrightarrow{d}
=
\begin{bmatrix}
3\\
-2
\end{bmatrix}
```

The slope represented by this direction vector is:

```math id="p7-slope-direction"
\boxed{
\frac{-2}{3}
}
```

Exactly the same as the slope obtained from the equation.

So we have now verified the same line from **three perspectives**:

1. Equation
2. Direction vector
3. Normal vector

---

# 7.15 What the Numerical Examples Have Proved

Across all the examples, the same structure keeps appearing:

```text id="p7-big-picture"
Line equation
     ↓
Extract w
     ↓
Find two points
     ↓
Find direction vector d
     ↓
Calculate wᵀd
     ↓
0
     ↓
w ⟂ d
     ↓
w ⟂ line
```

This is not a coincidence.

It is the numerical manifestation of the theorem we proved in Part 5.

---

# 🧠 Part 7 — Mental Model

When given a line:

```math id="p7-memory-line"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

you should immediately think:

### Step 1

Extract the normal vector:

```math id="p7-memory-w"
\overrightarrow{w}
```

### Step 2

Choose two points on the line.

### Step 3

Find their direction:

```math id="p7-memory-d"
\overrightarrow{d}
=
\overrightarrow{x_2}-\overrightarrow{x_1}
```

### Step 4

Verify:

```math id="p7-memory-dot"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

### Step 5

Conclude:

```math id="p7-memory-final"
\boxed{
\overrightarrow{w}\perp\text{line}
}
```

---

# 🔑 Part 7 Summary

The numerical examples reinforce four major conclusions.

### 1. The coefficient vector gives the normal direction

```math id="p7-sum1"
\boxed{
ax_1+bx_2+c=0
\quad\Rightarrow\quad
\overrightarrow{w}
=
\begin{bmatrix}
a\\
b
\end{bmatrix}
}
```

### 2. Two points give the line direction

```math id="p7-sum2"
\boxed{
\overrightarrow{d}
=
\overrightarrow{x_2}-\overrightarrow{x_1}
}
```

### 3. Their dot product is zero

```math id="p7-sum3"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

### 4. Therefore

```math id="p7-sum4"
\boxed{
\overrightarrow{w}\perp\text{line}
}
```

And we have also verified that:

```text id="p7-final-memory"
Changing w   → changes orientation

Changing w₀  → shifts position
```

---

## Next — Part 8 — Connection to Coordinate Geometry

Now we will consolidate the connection between the familiar equation:

```math id="p7-next1"
ax_1+bx_2+c=0
```

and the vector form:

```math id="p7-next2"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

Then we'll connect the **normal vector, direction vector, slope, and perpendicularity** into one unified geometric picture before moving to the Machine Learning perspective.

