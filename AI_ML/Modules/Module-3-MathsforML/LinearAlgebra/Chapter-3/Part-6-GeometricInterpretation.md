
# Part 6 — Geometric Interpretation

In Part 5, we proved mathematically that for the line

```math id="p6-eq"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

the vector $`\overrightarrow{w}`$ is perpendicular to the line.

Now we step back from the algebra and understand **what this means geometrically**.

This is important because the proof tells us **that** it is true, while geometry helps us understand **why it makes sense**.

---

# 6.1 Direction Vector vs Normal Vector

A line has a direction.

If $`\overrightarrow{d}`$ is a direction vector, then it points **along the line**.

A normal vector points **perpendicular to the line**.

So we have two fundamentally different directions:

* $`\overrightarrow{d}`$ → along the line
* $`\overrightarrow{w}`$ → perpendicular to the line

The relationship is:

```math id="p6-perp"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

Therefore:

```math id="p6-perp2"
\boxed{
\overrightarrow{w}\perp\overrightarrow{d}
}
```

Since $`\overrightarrow{d}`$ lies along the line:

```math id="p6-perp3"
\boxed{
\overrightarrow{w}\perp\text{line}
}
```

This is the fundamental geometric meaning of $`\overrightarrow{w}`$.

---

# 6.2 Why Do We Call It a Normal Vector?

In mathematics, a vector perpendicular to a surface, line, or plane is called a **normal vector**.

So for our line:

```math id="p6-normal"
\boxed{
\overrightarrow{w}
=
\text{normal vector of the line}
}
```

The word **normal** simply means:

> **Perpendicular to the object.**

This terminology becomes extremely important in Machine Learning.

You will frequently hear:

> "The weight vector is normal to the decision boundary."

Now you know exactly what that means geometrically.

---

# 6.3 The Same Line Has Infinitely Many Direction Vectors

Suppose $`\overrightarrow{d}`$ is a direction vector of a line.

Then:

```math id="p6-direction-multiples"
\overrightarrow{d},
\quad
2\overrightarrow{d},
\quad
5\overrightarrow{d},
\quad
-\overrightarrow{d}
```

all represent the same direction of the line.

They differ in magnitude and possibly orientation, but they all lie along the same line.

Therefore, if $`\overrightarrow{w}`$ is perpendicular to one of them:

```math id="p6-one"
\overrightarrow{w}^{T}\overrightarrow{d}=0
```

then it is also perpendicular to every scalar multiple:

```math id="p6-multiple"
\overrightarrow{w}^{T}(k\overrightarrow{d})=0
```

for any scalar $`k`$.

This is why we say that $`\overrightarrow{w}`$ is perpendicular to the **line**, not merely to one particular direction vector.

---

# 6.4 The Normal Vector Is Not Unique in Magnitude

Suppose:

```math id="p6-w"
\overrightarrow{w}
=
\begin{bmatrix}
1\\
1
\end{bmatrix}
```

Then:

```math id="p6-w2"
2\overrightarrow{w}
=
\begin{bmatrix}
2\\
2
\end{bmatrix}
```

and:

```math id="p6-w3"
-3\overrightarrow{w}
=
\begin{bmatrix}
-3\\
-3
\end{bmatrix}
```

all point along the same perpendicular direction.

Therefore, all of them can represent the **same normal direction**.

This is an important idea:

> A line determines the **direction** of its normal vector, but not its magnitude.

---

# 6.5 Why Can We Multiply the Equation by a Constant?

This gives us a beautiful algebraic consequence.

Suppose the line is:

```math id="p6-line-original"
x+y+2=0
```

Multiply the entire equation by 3:

```math id="p6-line-multiplied"
3x+3y+6=0
```

Have we created a different line?

No.

The set of points satisfying the equation is exactly the same.

Therefore:

```math id="p6-w-original"
\overrightarrow{w}
=
\begin{bmatrix}
1\\
1
\end{bmatrix}
```

and:

```math id="p6-w-scaled"
\overrightarrow{w}'
=
\begin{bmatrix}
3\\
3
\end{bmatrix}
```

represent the same normal direction.

This explains why the magnitude of $`\overrightarrow{w}`$ is not what determines the orientation of the line.

---

# 6.6 What Happens When We Change w?

Now consider:

```math id="p6-w-change"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

Suppose we change $`\overrightarrow{w}`$.

Because $`\overrightarrow{w}`$ determines the normal direction, changing it changes the orientation of the line.

For example:

```math id="p6-w-a"
\overrightarrow{w}
=
\begin{bmatrix}
1\\
0
\end{bmatrix}
```

produces a line whose normal points horizontally.

If instead:

```math id="p6-w-b"
\overrightarrow{w}
=
\begin{bmatrix}
0\\
1
\end{bmatrix}
```

the normal points vertically.

The corresponding line orientations are therefore different.

So:

> **Changing $`\overrightarrow{w}`$ changes the orientation of the line.**

---

# 6.7 What Happens When We Change w₀?

Now keep $`\overrightarrow{w}`$ fixed and change only $`w_0`$.

Consider:

```math id="p6-shift1"
x+y+1=0
```

and:

```math id="p6-shift2"
x+y+5=0
```

Both have the same normal vector:

```math id="p6-same-w"
\overrightarrow{w}
=
\begin{bmatrix}
1\\
1
\end{bmatrix}
```

Therefore, they have the same orientation.

But they occur at different positions.

So:

> **Changing $`w_0`$ shifts the line without changing its orientation.**

This is one of the most important geometric interpretations of the bias term.

---

# 6.8 Why Does the Bias Not Affect Orientation?

We can now understand this directly from the proof.

For two points on the line:

```math id="p6-bias-proof"
\overrightarrow{w}^{T}\overrightarrow{x}_1+w_0=0
```

and:

```math id="p6-bias-proof2"
\overrightarrow{w}^{T}\overrightarrow{x}_2+w_0=0
```

Subtracting gives:

```math id="p6-bias-cancel"
\boxed{
\overrightarrow{w}^{T}
\left(
\overrightarrow{x}_2-\overrightarrow{x}_1
\right)
=0
}
```

The bias disappears.

Therefore the direction of the line depends on $`\overrightarrow{w}`$, not on $`w_0`$.

This is not just an intuition.

**We proved it algebraically.**

---

# 6.9 Connection With Slope

We can also understand the normal-vector idea using the familiar slope of a line.

Consider:

```math id="p6-slope-line"
ax+by+c=0
```

Rearrange:

```math id="p6-slope-rearrange"
by=-ax-c
```

Therefore:

```math id="p6-slope"
\boxed{
y=-\frac{a}{b}x-\frac{c}{b}
}
```

So the slope of the line is:

```math id="p6-slope-value"
\boxed{
m=-\frac{a}{b}
}
```

The coefficient vector is:

```math id="p6-coeff-vector"
\boxed{
\begin{bmatrix}
a\\
b
\end{bmatrix}
}
```

This vector is the normal vector.

A direction vector of the line can therefore be chosen as:

```math id="p6-direction"
\boxed{
\begin{bmatrix}
b\\
-a
\end{bmatrix}
}
```

Let's verify:

```math id="p6-dot"
\begin{bmatrix}
a & b
\end{bmatrix}
\begin{bmatrix}
b\\
-a
\end{bmatrix}
=
ab-ab
=
0
```

Therefore they are perpendicular.

This gives us another way to see the same result.

---

# 6.10 Three Equivalent Ways to Understand the Same Line

We now have three perspectives.

### Coordinate Geometry

```math id="p6-coordinate"
ax+by+c=0
```

### Vector Form

```math id="p6-vector"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

### Geometric Interpretation

```text id="p6-geo"
w → normal to the line

d → direction along the line
```

with:

```math id="p6-orthogonal"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

These are not three different concepts.

They are **three ways of looking at the same object**.

---

# 6.11 The Most Important Geometric Insight

There is a particularly useful way to think about $`\overrightarrow{w}`$.

Imagine standing on the line.

If you walk **along the line**, you are moving in a direction represented by $`\overrightarrow{d}`$.

If you walk in the direction of $`\overrightarrow{w}`$, you immediately leave the line at a right angle.

Therefore:

> **w tells us the direction in which we move most directly away from the line.**

This interpretation will become very useful later when we study **distance from a point to a line or hyperplane**.

---

# 6.12 A Useful Connection With Projection

We previously studied projection.

Remember:

> Projection extracts the component of one vector along another direction.

Now consider a point relative to a line.

Its displacement can be decomposed into:

* a component **along the line**
* a component **perpendicular to the line**

The perpendicular component lies along the normal direction $`\overrightarrow{w}`$.

So the normal vector gives us the direction associated with the **shortest path to the line**.

This connects our current topic directly with the projection chapter we just completed.

That is not accidental.

**Projection and normal vectors are deeply connected.**

---

# 6.13 Machine Learning Interpretation

Now let's connect the geometry to ML without jumping too far ahead.

Suppose:

```math id="p6-decision"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

represents a decision boundary.

Then:

```text id="p6-ml"
w
↓
normal direction

boundary
────────────────

w
↓
perpendicular direction
```

The vector $`\overrightarrow{w}`$ tells the model the direction **across** the boundary.

The boundary itself extends in directions perpendicular to $`\overrightarrow{w}`$.

This is why the weight vector has a geometric meaning beyond simply being a collection of learned numbers.

---

# 6.14 Why This Becomes Powerful in Classification

Imagine two classes separated by a straight boundary.

The model needs to determine:

> **Which side of the boundary does a point lie on?**

The quantity:

```math id="p6-score"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

produces a scalar.

The boundary occurs when that scalar equals zero.

So:

```text id="p6-sign"
Positive
   │
   │
--- Boundary ---
   │
   │
Negative
```

The vector $`\overrightarrow{w}`$ is perpendicular to that boundary and therefore defines the direction in which this score changes as we move across the boundary.

We will study the complete classification interpretation later.

---

# 6.15 A Deeper Geometric Picture

At this point, we can summarize the geometry as:

```text id="p6-summary-picture"
                 w
                 ↑
                 │
                 │
                 │
─────────────────┼─────────────────
                 │
        Decision / Boundary
                 │
                 │
                 │
```

The important relationships are:

```math id="p6-final-rel"
\boxed{
\overrightarrow{w}\perp\text{boundary}
}
```

and:

```math id="p6-direction-rel"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

The vector $`\overrightarrow{d}`$ lies along the boundary.

---

# 6.16 What We Have Learned

We can now interpret every component geometrically.

| Component                                        | Geometric Meaning                    |
| ------------------------------------------------ | ------------------------------------ |
| $`\overrightarrow{x}`$                           | Position of a point                  |
| $`\overrightarrow{d}`$                           | Direction along the line             |
| $`\overrightarrow{w}`$                           | Normal direction                     |
| $`w_0`$                                          | Controls the line's position         |
| $`\overrightarrow{w}^{T}\overrightarrow{x}+w_0`$ | Scalar value associated with a point |
| Value = 0                                        | Point lies on the boundary           |

---

# 🧠 Mental Model

The entire topic can now be visualized as:

```text
                    w
                    ↑
                    │
                    │  Normal
                    │
                    │
────────────────────┼────────────────────
                    │
                    │
                    │
             Direction of line
                    →
                    d
```

More precisely:

```math id="p6-mental"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

Therefore:

> **w points across the line, while d points along the line.**

---

# 🔑 Part 6 Summary

The most important geometric conclusions are:

### 1. Direction vector

```math id="p6-s1"
\boxed{
\overrightarrow{d}
=
\text{direction along the line}
}
```

### 2. Normal vector

```math id="p6-s2"
\boxed{
\overrightarrow{w}
=
\text{direction perpendicular to the line}
}
```

### 3. Perpendicularity

```math id="p6-s3"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

### 4. Role of w

$`\overrightarrow{w}`$ controls the **orientation** of the line.

### 5. Role of w₀

$`w_0`$ controls the **position** of the line.

### 6. ML interpretation

In a linear decision boundary:

```math id="p6-s4"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

$`\overrightarrow{w}`$ is the **normal vector of the boundary**.

---

## 🔭 Connection to the Next Part

Now that we understand the geometry, the next step is to make it concrete.

### **Part 7 — Numerical Examples**

We'll take actual equations of lines and calculate:

**line equation**

→ **w**

→ **two points on the line**

→ **direction vector**

→ **dot product**

→ **90° relationship**

This will verify the theorem numerically rather than leaving it as an abstract proof.
