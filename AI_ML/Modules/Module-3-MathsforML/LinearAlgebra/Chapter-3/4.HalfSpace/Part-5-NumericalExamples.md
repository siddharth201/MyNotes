# Half Space

# Part 5 — Numerical Examples

We now have the mathematical definition of a half-space.

For the hyperplane

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

we know:

```text
f(x) > 0  → Positive Half-Space
f(x) = 0  → Boundary
f(x) < 0  → Negative Half-Space
```

Now we will make this **completely concrete through numbers**.

The goal is not just to calculate the sign. For every example, we will understand:

1. Where is the boundary?
2. Which half-space is the point in?
3. Why?
4. What is the signed distance?
5. What is the ordinary perpendicular distance?

---

# 5.1 Example 1 — A Point in the Positive Half-Space

Consider the line:

```math
\boxed{
x+y-4=0
}
```

This is our boundary.

Define:

```math
\boxed{
f(x,y)=x+y-4
}
```

The corresponding normal vector is:

```math
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

```math
\boxed{
w_0=-4
}
```

---

## Step 1 — Identify the Two Half-Spaces

Positive:

```math
\boxed{
x+y-4>0
}
```

or:

```math
\boxed{
x+y>4
}
```

Negative:

```math
\boxed{
x+y-4<0
}
```

or:

```math
\boxed{
x+y<4
}
```

Boundary:

```math
\boxed{
x+y=4
}
```

---

## Step 2 — Take a Point

Let:

```math
\boxed{
A=
\begin{bmatrix}
5\\
2
\end{bmatrix}
}
```

Evaluate the function:

```math
f(A)=5+2-4
```

Therefore:

```math
\boxed{
f(A)=3
}
```

Since:

```math
3>0
```

we conclude:

```math
\boxed{
A\in H^+
}
```

So $A$ belongs to the **positive half-space**.

---

## Step 3 — Geometric Meaning

The normal vector is:

```math
\overrightarrow{w}
=
\begin{bmatrix}
1\\
1
\end{bmatrix}
```

which points diagonally upward/right.

Therefore, the positive half-space is the side toward that direction.

```text
                 +w
                  ↗
                   ● A
                  /
                 /
────────────────/────────────
             Boundary
```

So the algebraic result:

```math
f(A)>0
```

matches the geometry.

---

# 5.2 Example 2 — A Point in the Negative Half-Space

Keep the same boundary:

```math
\boxed{
x+y-4=0
}
```

Take:

```math
\boxed{
B=
\begin{bmatrix}
1\\
1
\end{bmatrix}
}
```

Evaluate:

```math
f(B)=1+1-4
```

Therefore:

```math
\boxed{
f(B)=-2
}
```

Since:

```math
-2<0
```

we conclude:

```math
\boxed{
B\in H^-
}
```

So $B$ belongs to the **negative half-space**.

---

## Geometric Meaning

The point lies on the side opposite to the normal direction.

```text
              +w
               ↗
────────────────────────
       Boundary
────────────────────────
        ● B
         ↙
       -w
```

Again:

```text
negative
   ↓
opposite side from +w
```

---

# 5.3 Example 3 — A Point Exactly on the Boundary

Same line:

```math
\boxed{
x+y-4=0
}
```

Take:

```math
\boxed{
C=
\begin{bmatrix}
2\\
2
\end{bmatrix}
}
```

Evaluate:

```math
f(C)=2+2-4
```

Therefore:

```math
\boxed{
f(C)=0
}
```

So:

```math
\boxed{
C\in H
}
```

The point lies **exactly on the boundary**.

This gives us the complete three-way test:

```text
f(x) > 0 → positive half-space
f(x) = 0 → boundary
f(x) < 0 → negative half-space
```

---

# 5.4 Example 4 — Connect Sign With Distance

Let's use point $A$ again:

```math
A=
\begin{bmatrix}
5\\
2
\end{bmatrix}
```

We already calculated:

```math
f(A)=3
```

Now let's calculate the **signed distance**.

The formula is:

```math
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

Our normal vector is:

```math
\overrightarrow{w}
=
\begin{bmatrix}
1\\
1
\end{bmatrix}
```

Therefore:

```math
\|\overrightarrow{w}\|
=
\sqrt{1^2+1^2}
=
\sqrt{2}
```

So:

```math
d_{\text{signed}}
=
\frac{3}{\sqrt{2}}
```

Approximately:

```math
\boxed{
d_{\text{signed}}\approx2.121
}
```

The positive sign tells us:

```text
A is on +w side
```

and the magnitude tells us:

```text
A is 2.121 units from the boundary
```

---

# 5.5 Example 5 — Signed Distance for the Negative Side

For point:

```math
B=
\begin{bmatrix}
1\\
1
\end{bmatrix}
```

we found:

```math
f(B)=-2
```

Therefore:

```math
d_{\text{signed}}
=
\frac{-2}{\sqrt{2}}
```

So:

```math
\boxed{
d_{\text{signed}}\approx-1.414
}
```

The negative sign tells us:

> $B$ lies on the $-\overrightarrow{w}$ side.

The magnitude:

```math
|d_{\text{signed}}|
=
1.414
```

tells us the perpendicular distance.

Therefore:

```text
Signed distance
      ↓
    -1.414

sign
 ↓
negative half-space

magnitude
 ↓
1.414 units away
```

---

# 5.6 Example 6 — Point on the Boundary

For:

```math
C=
\begin{bmatrix}
2\\
2
\end{bmatrix}
```

we have:

```math
f(C)=0
```

Therefore:

```math
d_{\text{signed}}
=
\frac{0}{\sqrt{2}}
=
0
```

and:

```math
\boxed{
d=0
}
```

This is exactly what we expect.

A point on the boundary has:

```text
signed distance = 0
ordinary distance = 0
```

---

# 5.7 One Example Showing All Three

Let's put everything together.

For:

```math
\boxed{
x+y-4=0
}
```

we have:

| Point     | $f(x,y)$ | Half-space | Signed distance |
| --------- | -------: | ---------- | --------------: |
| $A=(5,2)$ |      $3$ | Positive   |    $3/\sqrt{2}$ |
| $B=(1,1)$ |     $-2$ | Negative   |   $-2/\sqrt{2}$ |
| $C=(2,2)$ |      $0$ | Boundary   |             $0$ |

The pattern is:

```text
             Positive
                 ↑
                 │
            A ●  │
                 │
─────────────────┼────────────────
                 │
              C ●│  Boundary
                 │
─────────────────┼────────────────
                 │
            B ●  │
                 ↓
             Negative
```

---

# 5.8 Example 7 — A Different Orientation

Now let's change the line.

Consider:

```math
\boxed{
2x-y+3=0
}
```

Therefore:

```math
\overrightarrow{w}
=
\begin{bmatrix}
2\\
-1
\end{bmatrix}
```

and:

```math
w_0=3
```

The positive half-space is:

```math
\boxed{
2x-y+3>0
}
```

and the negative half-space is:

```math
\boxed{
2x-y+3<0
}
```

---

## Take Point A

```math
A=
\begin{bmatrix}
1\\
1
\end{bmatrix}
```

Evaluate:

```math
f(A)=2(1)-1+3
```

Therefore:

```math
\boxed{
f(A)=4
}
```

So:

```math
\boxed{
A\in H^+
}
```

---

## Take Point B

```math
B=
\begin{bmatrix}
-2\\
1
\end{bmatrix}
```

Then:

```math
f(B)=2(-2)-1+3
```

Therefore:

```math
f(B)=-2
```

So:

```math
\boxed{
B\in H^-
}
```

Notice that the line is tilted differently, but the exact same procedure works.

---

# 5.9 Example 8 — Three-Dimensional Plane

Now let's move from a line to an actual plane.

Consider:

```math
\boxed{
2x+3y+6z-12=0
}
```

The normal vector is:

```math
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

```math
\boxed{
w_0=-12
}
```

Define:

```math
f(x,y,z)=2x+3y+6z-12
```

The two half-spaces are:

```math
\boxed{
2x+3y+6z-12>0
}
```

and:

```math
\boxed{
2x+3y+6z-12<0
}
```

---

# 5.10 Test a Point in 3D

Take:

```math
\boxed{
A=
\begin{bmatrix}
3\\
2\\
1
\end{bmatrix}
}
```

Calculate:

```math
f(A)
=
2(3)+3(2)+6(1)-12
```

Therefore:

```math
f(A)
=
6+6+6-12
```

```math
\boxed{
f(A)=6
}
```

Since:

```math
6>0
```

we have:

```math
\boxed{
A\in H^+
}
```

So even in 3D, nothing fundamental changed.

---

# 5.11 Another 3D Point

Take:

```math
\boxed{
B=
\begin{bmatrix}
1\\
1\\
1
\end{bmatrix}
}
```

Calculate:

```math
f(B)
=
2+3+6-12
```

Therefore:

```math
\boxed{
f(B)=-1
}
```

So:

```math
\boxed{
B\in H^-
}
```

---

# 5.12 Find a Point on the Plane

Take:

```math
C=
\begin{bmatrix}
0\\
0\\
2
\end{bmatrix}
```

Then:

```math
f(C)
=
2(0)+3(0)+6(2)-12
```

Therefore:

```math
f(C)=12-12
```

```math
\boxed{
f(C)=0
}
```

So:

```math
\boxed{
C\text{ lies on the plane}
}
```

---

# 5.13 Example 9 — Origin as a Special Point

Let's use the same plane:

```math
2x+3y+6z-12=0
```

The origin is:

```math
\overrightarrow{0}
=
\begin{bmatrix}
0\\
0\\
0
\end{bmatrix}
```

Evaluate:

```math
f(\overrightarrow{0})
=
0+0+0-12
```

Therefore:

```math
\boxed{
f(\overrightarrow{0})=-12
}
```

So:

```math
\boxed{
\text{Origin lies in the negative half-space.}
}
```

Notice how this connects directly to our previous topic.

Since:

```math
w_0=-12
```

we already knew:

```text
w₀ < 0
 ↓
origin is on negative side
```

---

# 5.14 And Its Distance From the Plane

The normal magnitude is:

```math
\|\overrightarrow{w}\|
=
\sqrt{2^2+3^2+6^2}
```

Therefore:

```math
\|\overrightarrow{w}\|
=
\sqrt{4+9+36}
```

```math
\boxed{
\|\overrightarrow{w}\|=7
}
```

Signed distance of the origin:

```math
d_{\text{signed}}
=
\frac{-12}{7}
```

So:

```math
\boxed{
d_{\text{signed}}=-\frac{12}{7}
}
```

Ordinary distance:

```math
\boxed{
d=\frac{12}{7}\approx1.714
}
```

This single example combines our previous two topics:

```text
sign
 ↓
negative half-space

absolute magnitude
 ↓
perpendicular distance
```

---

# 5.15 Example 10 — What Happens If We Flip the Plane Equation?

Take:

```math
2x+3y+6z-12=0
```

Multiply by $-1$:

```math
-2x-3y-6z+12=0
```

The physical plane is exactly the same.

But for the origin:

### Original equation

```math
f(0)=-12
```

so:

```text
origin → negative side
```

### Flipped equation

```math
f(0)=+12
```

so:

```text
origin → positive side
```

Did the origin move?

**No.**

Did the plane move?

**No.**

What changed?

```text
Normal vector orientation
        ↓
+w became -w
        ↓
positive/negative labels swapped
```

This is a very important point to remember.

---

# 5.16 A Useful Numerical Shortcut

When you're given a point and a plane, you can use this simple procedure.

Suppose:

```math
\boxed{
w_1x_1+w_2x_2+\cdots+w_nx_n+w_0=0
}
```

and point:

```math
\boxed{
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2\\
\vdots\\
x_n
\end{bmatrix}
}
```

Calculate:

```math
\boxed{
S=
w_1x_1+w_2x_2+\cdots+w_nx_n+w_0
}
```

Then:

```text
S > 0 → Positive half-space
S = 0 → Boundary
S < 0 → Negative half-space
```

If distance is also required:

```math
\boxed{
d=\frac{|S|}{\sqrt{w_1^2+w_2^2+\cdots+w_n^2}}
}
```

If **signed distance** is required:

```math
\boxed{
d_{\text{signed}}
=
\frac{S}
{\sqrt{w_1^2+w_2^2+\cdots+w_n^2}}
}
```

---

# 5.17 The Most Important Numerical Pattern

Whenever you see a question like:

> Determine which half-space contains the point.

Do **not** immediately calculate distance.

Just calculate:

```math
\boxed{
S=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

Then inspect the sign.

```text
         S
         │
   ┌─────┼─────┐
   ↓     ↓     ↓
  >0     =0    <0
   ↓     ↓     ↓
  H⁺     H     H⁻
```

Only calculate:

```math
\frac{|S|}{\|\overrightarrow{w}\|}
```

if the question asks for distance.

---

# 5.18 Connection to ML Classification

Now let's translate our numerical process directly into ML.

Suppose our model is:

```math
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

For a new data point:

```math
\overrightarrow{x}
```

we calculate:

```math
S=f(\overrightarrow{x})
```

Then:

```text
S > 0
 ↓
one side of decision boundary

S < 0
 ↓
other side

S = 0
 ↓
exactly on decision boundary
```

So classification can be viewed as:

```text
Data point
    ↓
Calculate wᵀx + w₀
    ↓
Check sign
    ↓
Determine half-space
    ↓
Predict class
```

This is the geometric meaning of a simple linear classifier.

---

# 5.19 🎯 Ultimate Goal in ML — Simple Terms

Imagine your model creates an invisible wall:

```text
             Class A
          ●       ●
             ●

════════════════════════
     Decision Boundary
════════════════════════

          ●
       ●      ●
             Class B
```

When a new data point arrives, the model doesn't need to literally draw the wall.

It can simply calculate:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

The result tells it:

> **Which side of the invisible wall am I on?**

And if we normalize the result:

```math
\boxed{
\frac{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}{
\|\overrightarrow{w}\|
}
}
```

we additionally know:

> **How far am I from the wall, and on which side?**

That is the bridge from our geometry to ML classification.

---

# 5.20 One Example You Should Be Able to Solve Mentally

Given:

```math
\boxed{
2x+3y-6=0
}
```

and:

```math
P=(3,2)
```

Calculate:

```math
S=2(3)+3(2)-6
```

```math
S=6+6-6
```

```math
\boxed{
S=6
}
```

Therefore:

```text
S > 0
 ↓
P is in positive half-space
```

Normal magnitude:

```math
\|\overrightarrow{w}\|
=
\sqrt{2^2+3^2}
=
\sqrt{13}
```

Signed distance:

```math
\boxed{
d_{\text{signed}}
=
\frac{6}{\sqrt{13}}
}
```

Ordinary distance:

```math
\boxed{
d=
\frac{6}{\sqrt{13}}
\approx1.664
}
```

Notice how quickly the whole process becomes once the concept is clear.

---

# 5.21 Final Numerical Decision Procedure

For any point $\overrightarrow{x}$ and hyperplane:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

### Step 1 — Calculate the score

```math
\boxed{
S=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

### Step 2 — Determine the side

```text
S > 0 → Positive Half-Space

S = 0 → Boundary

S < 0 → Negative Half-Space
```

### Step 3 — If distance is required

```math
\boxed{
d=
\frac{|S|}
{\|\overrightarrow{w}\|}
}
```

### Step 4 — If signed distance is required

```math
\boxed{
d_{\text{signed}}
=
\frac{S}
{\|\overrightarrow{w}\|}
}
```

---

# 🧠 Part 5 Mental Model

Whenever you see a plane and a point, think:

```text
                Point X
                   ●
                   │
                   │
                   ↓
              Evaluate
                   │
                   ↓
            wᵀx + w₀
                   │
          ┌────────┼────────┐
          ↓        ↓        ↓
         +         0        -
          ↓        ↓        ↓
         H⁺      Plane      H⁻
```

Then:

```text
sign
 ↓
which side?

magnitude / ||w||
 ↓
how far?
```

---

# 🔑 Part 5 Takeaways

### Example pattern

For:

```math
\boxed{
w_1x_1+w_2x_2+\cdots+w_nx_n+w_0=0
}
```

calculate:

```math
\boxed{
S=
w_1x_1+w_2x_2+\cdots+w_nx_n+w_0
}
```

Then:

```text
S > 0 → Positive half-space
S = 0 → Boundary
S < 0 → Negative half-space
```

Distance:

```math
\boxed{
d=\frac{|S|}{\|\overrightarrow{w}\|}
}
```

Signed distance:

```math
\boxed{
d_{\text{signed}}
=
\frac{S}{\|\overrightarrow{w}\|}
}
```

And remember:

> **The sign tells us which side; the normalized magnitude tells us how far.**

---

## One-Line Understanding

> **For any point, simply evaluate $\overrightarrow{w}^{T}\overrightarrow{x}+w_0$: its sign identifies the half-space, zero identifies the boundary, and dividing its magnitude by $|\overrightarrow{w}|$ gives the perpendicular distance from the boundary.**

### Next: **Part 6 — Geometric Interpretation**

We will now step back from calculations and build the **complete visual mental model** of a plane, normal vector, positive half-space, negative half-space, signed distance, and why all these ideas are actually describing the same geometry.

