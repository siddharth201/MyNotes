
# Half Space

## Part 3 — Geometric Meaning of Positive and Negative Half-Spaces

In Part 2, we learned that for the hyperplane

```math id="hs3-plane"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

we can evaluate any point using:

```math id="hs3-f"
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

and obtain:

```text
f(x) > 0  → one half-space
f(x) = 0  → boundary
f(x) < 0  → other half-space
```

But there is still an important question:

> **Why does positive correspond to one particular side, and negative to the other?**

More specifically:

> **Why is the positive side associated with the direction of $\overrightarrow{w}$?**

This is where the geometry of the **normal vector + dot product + projection** comes together.

---

# 3.1 Start With the Plane as a Wall

Imagine a wall.

```text
                    ↑
                    │
                    │
                    │
────────────────────┼────────────────────
                    │
                  WALL
────────────────────┼────────────────────
                    │
                    │
                    ↓
```

The arrow $\overrightarrow{w}$ is perpendicular to the wall.

So:

```math id="hs3-normal"
\boxed{
\overrightarrow{w}\perp\text{plane}
}
```

There are therefore two natural directions:

```text
toward +w
   ↑

PLANE

   ↓
toward -w
```

These two directions point into the two different half-spaces.

This gives us our first geometric picture:

```text
                 +w direction
                      ↑
                      │
                      │
══════════════════════╪══════════════════════
                    PLANE
══════════════════════╪══════════════════════
                      │
                      │
                      ↓
                 -w direction
```

---

# 3.2 But How Does the Equation Know This?

Our equation is:

```math id="hs3-equation"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

The important part is:

```math id="hs3-dot"
\overrightarrow{w}^{T}\overrightarrow{x}
```

We know from vector geometry:

```math id="hs3-dot-formula"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}
=
\|\overrightarrow{w}\|
\|\overrightarrow{x}\|
\cos\theta
}
```

So the sign of the dot product depends on $\cos\theta$.

Remember:

```text
θ < 90°  → cos θ > 0
θ = 90°  → cos θ = 0
θ > 90°  → cos θ < 0
```

Therefore:

```text
Point/vector roughly toward w
        ↓
positive dot product

Point/vector perpendicular to w
        ↓
zero dot product

Point/vector roughly opposite w
        ↓
negative dot product
```

This is the mathematical foundation of the positive/negative half-space idea.

---

# 3.3 But There Is One Missing Piece: $w_0$

We cannot simply look at:

```math id="hs3-dot-only"
\overrightarrow{w}^{T}\overrightarrow{x}
```

because our plane is not necessarily passing through the origin.

The actual expression is:

```math id="hs3-full"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

So we need a cleaner geometric construction.

---

# 3.4 Choose a Reference Point on the Plane

Pick **any point** $P$ that lies on the plane.

Because $P$ is on the plane:

```math id="hs3-p-plane"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{p}+w_0=0
}
```

Therefore:

```math id="hs3-w0"
w_0=-\overrightarrow{w}^{T}\overrightarrow{p}
```

Now take another arbitrary point $X$ with position vector $\overrightarrow{x}$.

Our function is:

```math id="hs3-fx"
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

Substitute the expression for $w_0$:

```math id="hs3-sub"
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}
-
\overrightarrow{w}^{T}\overrightarrow{p}
```

Using linearity of the dot product:

```math id="hs3-factor"
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}
\left(
\overrightarrow{x}-\overrightarrow{p}
\right)
}
```

And:

```math id="hs3-xp"
\boxed{
\overrightarrow{x}-\overrightarrow{p}
=
\overrightarrow{PX}
}
```

So:

```math id="hs3-key"
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{PX}
}
```

This is a **very important result**.

---

# 3.5 What Did We Just Discover?

The complicated-looking expression:

```math id="hs3-original"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

can be understood geometrically as:

```math id="hs3-geometric"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{PX}
}
```

where $P$ is any point on the plane.

So we're essentially asking:

> **How much does the vector from the plane toward our point $X$ point in the direction of the normal vector $\overrightarrow{w}$?**

This is exactly the kind of question the dot product answers.

---

# 3.6 Now the Sign Becomes Easy to Understand

Suppose $X$ lies on the side toward which $\overrightarrow{w}$ points.

Then the angle between:

```math id="hs3-angle-positive"
\overrightarrow{w}
```

and:

```math id="hs3-px"
\overrightarrow{PX}
```

is less than $90^\circ$.

Therefore:

```math id="hs3-positive-dot"
\cos\theta>0
```

and hence:

```math id="hs3-positive"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{PX}>0
}
```

Therefore:

```math id="hs3-positive-final"
\boxed{
f(\overrightarrow{x})>0
}
```

So:

> **The side toward $\overrightarrow{w}$ is the positive half-space.**

---

# 3.7 What About the Opposite Side?

Now suppose $X$ lies on the opposite side of the plane.

Then:

```text
        -w direction
             ↓
             ● X
             │
             │
═════════════╪═════════════
           PLANE
             ↑
             │
             w
```

The angle between $\overrightarrow{w}$ and $\overrightarrow{PX}$ is now greater than $90^\circ$.

Therefore:

```math id="hs3-negative-cos"
\cos\theta<0
```

So:

```math id="hs3-negative-dot"
\overrightarrow{w}^{T}\overrightarrow{PX}<0
```

and therefore:

```math id="hs3-negative-final"
\boxed{
f(\overrightarrow{x})<0
}
```

So:

> **The side opposite to $\overrightarrow{w}$ is the negative half-space.**

---

# 3.8 What Happens Exactly on the Plane?

If $X$ lies on the plane itself, then $PX$ lies **along the plane**.

But $\overrightarrow{w}$ is perpendicular to the plane.

Therefore:

```math id="hs3-right-angle"
\theta=90^\circ
```

and:

```math id="hs3-cos-zero"
\cos90^\circ=0
```

Hence:

```math id="hs3-zero-dot"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{PX}=0
}
```

Therefore:

```math id="hs3-zero"
\boxed{
f(\overrightarrow{x})=0
}
```

Exactly what we expect.

---

# 3.9 The Complete Geometric Picture

Now we can draw the whole concept:

```text
                         +w
                          ↑
                          │
                    X₁ ●  │
                          │
                          │
══════════════════════════●══════════════════
                         P
                       PLANE
══════════════════════════════════════════════
                          │
                          │
                    X₂ ●  │
                          ↓
                         -w
```

For $X_1$:

```math id="hs3-x1"
f(X_1)>0
```

For $P$:

```math id="hs3-p"
f(P)=0
```

For $X_2$:

```math id="hs3-x2"
f(X_2)<0
```

So:

```text
             Positive half-space
                     ↑
                     │
─────────────────────┼─────────────────────
                   PLANE
─────────────────────┼─────────────────────
                     │
                     ↓
             Negative half-space
```

---

# 3.10 A Very Important Insight About the Normal Vector

This gives $\overrightarrow{w}$ a much deeper meaning.

Previously, we said:

> $\overrightarrow{w}$ is perpendicular to the plane.

That's true.

But now we can say more:

> **$\overrightarrow{w}$ not only tells us the orientation of the plane; it also establishes which side we call the positive side.**

So $\overrightarrow{w}$ has two closely related geometric roles:

```text
w
│
├── perpendicular to plane
│
└── points toward positive half-space
```

And:

```math id="hs3-opposite"
-\overrightarrow{w}
```

points toward the negative half-space.

---

# 3.11 This Explains Why Flipping the Equation Flips the Sign

Suppose the original plane is:

```math id="hs3-original-plane"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

Now multiply everything by $-1$:

```math id="hs3-flipped-plane"
-\overrightarrow{w}^{T}\overrightarrow{x}-w_0=0
```

The plane hasn't changed.

But the normal vector has changed:

```math id="hs3-w-flip"
\overrightarrow{w}
\rightarrow
-\overrightarrow{w}
```

Therefore the orientation has flipped.

The positive side becomes the negative side and vice versa.

```text
Before:

       +w
        ↑
        │
────────┼────────
        │
        ↓
       -w


After:

       -w
        ↑
        │
────────┼────────
        │
        ↓
       +w
```

The **physical boundary is identical**.

Only our orientation convention changed.

---

# 3.12 This Is Similar to Choosing "Forward" and "Backward"

Here's a simple real-world analogy.

Imagine standing on a road.

You choose:

```text
forward → positive
backward → negative
```

Now turn around.

Your physical location hasn't changed.

The road hasn't changed.

But:

```text
what you previously called "forward"
```

is now:

```text
"backward"
```

The same thing happens when we replace:

```math id="hs3-w-reverse"
\overrightarrow{w}
\rightarrow
-\overrightarrow{w}
```

The plane doesn't move.

Our **orientation** changes.

---

# 3.13 Numerical Example

Consider the line:

```math id="hs3-example"
\boxed{
x+y-4=0
}
```

Its normal vector is:

```math id="hs3-example-w"
\overrightarrow{w}
=
\begin{bmatrix}
1\\
1
\end{bmatrix}
```

Let's choose a point on the line:

```math id="hs3-example-p"
P=(2,2)
```

Check:

```math id="hs3-check"
2+2-4=0
```

Correct.

---

## Point A: $(5,2)$

The vector from $P$ to $A$ is:

```math id="hs3-pa"
\overrightarrow{PA}
=
\begin{bmatrix}
5-2\\
2-2
\end{bmatrix}
=
\begin{bmatrix}
3\\
0
\end{bmatrix}
```

Now calculate:

```math id="hs3-dot-a"
\overrightarrow{w}^{T}\overrightarrow{PA}
=
\begin{bmatrix}
1 & 1
\end{bmatrix}
\begin{bmatrix}
3\\
0
\end{bmatrix}
```

Therefore:

```math id="hs3-dot-a2"
=3
```

So:

```math id="hs3-a-positive"
\boxed{
f(A)>0
}
```

A is in the positive half-space.

---

# 3.14 Point B: $(1,1)$

Now:

```math id="hs3-pb"
\overrightarrow{PB}
=
\begin{bmatrix}
1-2\\
1-2
\end{bmatrix}
=
\begin{bmatrix}
-1\\
-1
\end{bmatrix}
```

Dot product:

```math id="hs3-dot-b"
\overrightarrow{w}^{T}\overrightarrow{PB}
=
\begin{bmatrix}
1 & 1
\end{bmatrix}
\begin{bmatrix}
-1\\
-1
\end{bmatrix}
```

Therefore:

```math id="hs3-dot-b2"
=-2
```

So:

```math id="hs3-b-negative"
\boxed{
f(B)<0
}
```

B is in the negative half-space.

---

# 3.15 Notice Something Beautiful

We could have simply calculated:

```math id="hs3-direct-a"
f(A)=5+2-4=3
```

and:

```math id="hs3-direct-b"
f(B)=1+1-4=-2
```

But now we understand **why** those numbers have those signs.

The algebra:

```math id="hs3-algebra"
x+y-4
```

is secretly measuring the alignment of:

```math id="hs3-vector-alignment"
\overrightarrow{PX}
```

with the normal:

```math id="hs3-normal-vector"
\overrightarrow{w}
```

That is the geometric meaning hidden inside the equation.

---

# 3.16 Connection to Projection

This is also directly connected to our earlier topic **Projection of a Vector**.

Remember:

$$\text{proj}_{\overrightarrow{w}} (\overrightarrow{PX}) 
= 
\frac{
\overrightarrow{w}^{T}\overrightarrow{PX}
}{
\|\overrightarrow{w}\|^2
}
\overrightarrow{w}$$


The scalar component along $\overrightarrow{w}$ is:

```math id="hs3-scalar-projection"
\boxed{
\frac{
\overrightarrow{w}^{T}\overrightarrow{PX}
}{
\|\overrightarrow{w}\|
}
}
```

Its sign tells us:

```text
positive → projection along +w
negative → projection along -w
zero     → perpendicular to w
```

And because the plane is perpendicular to $\overrightarrow{w}$:

```text
projection onto w
       ↓
perpendicular direction
       ↓
position relative to plane
```

This is why the projection topic we studied earlier was not isolated—it is directly supporting our understanding here.

---

# 3.17 From Signed Projection to Signed Distance

The signed distance from $X$ to the plane is:

```math id="hs3-signed-distance"
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

We can interpret this as:

```text
Signed distance
       ↓
projection onto unit normal
```

because the unit normal is:

```math id="hs3-unit-normal"
\boxed{
\widehat{w}
=
\frac{\overrightarrow{w}}
{\|\overrightarrow{w}\|}
}
```

Then:

```math id="hs3-unit-dot"
d_{\text{signed}}
=
\widehat{w}^{T}
(\overrightarrow{x}-\overrightarrow{p})
```

So:

> **Signed distance is the signed projection of the point's displacement from the plane onto the unit normal vector.**

This is a very deep and useful interpretation.

---

# 3.18 Why the Absolute Value Disappears Here

Earlier, for ordinary distance, we used:

```math id="hs3-ordinary"
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

But now we're studying half-spaces.

We **do not** want to throw away the sign.

Instead:

```math id="hs3-signed-final"
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

because:

```text
positive → +w side
negative → -w side
```

This is why signed distance is so useful.

---

# 3.19 The Complete Geometric Chain

We can now connect everything:

```text
Choose point X
      ↓
Choose point P on plane
      ↓
Construct PX
      ↓
Project PX onto normal w
      ↓
Look at sign of projection
      ↓
+ → toward +w
− → toward −w
0 → on plane
```

And if we normalize:

```text
projection
    ↓
signed distance
```

Therefore:

```math id="hs3-chain"
\boxed{
\text{Signed distance}
=
\text{projection onto unit normal}
}
```

---

# 3.20 🎯 Ultimate Goal in ML — Layman Version

Now imagine our ML decision boundary as an invisible wall:

```text
                    +w
                     ↑
                     │
     Class 1         │
       ●             │
                     │
─────────────────────┼─────────────────────
              Decision Boundary
─────────────────────┼─────────────────────
                     │
                     │
       ●             │
     Class 0         ↓
                    -w
```

The model has learned a weight vector $\overrightarrow{w}$.

That vector tells us:

> **"This is the direction perpendicular to my decision boundary."**

Then for a new data point:

```math id="hs3-ml-score"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

asks:

> **"Is this point displaced from the boundary toward $\overrightarrow{w}$ or toward $-\overrightarrow{w}$?"**

So:

```text
positive
   ↓
toward +w
   ↓
one side / class

negative
   ↓
toward -w
   ↓
other side / class
```

This is the geometric meaning behind the sign of a linear classifier.

---

# 3.21 An Important ML Nuance

We should be precise:

> **Positive does not inherently mean Class 1, and negative does not inherently mean Class 0.**

The model designer can choose either convention.

For example:

```text
f(x) > 0 → Class 1
f(x) < 0 → Class 0
```

or we could define:

```text
f(x) > 0 → Class 0
f(x) < 0 → Class 1
```

Both are possible.

The mathematics only tells us:

```text
positive → +w side
negative → -w side
```

The **class labels** are a modelling choice.

---

# 3.22 Why This Matters for Future ML Topics

This concept becomes especially important when we study:

### Linear Classification

```text
sign(wᵀx+w₀)
```

### Logistic Regression

```text
wᵀx+w₀
   ↓
probability
```

### Perceptron

```text
wᵀx+w₀
   ↓
class decision
```

### SVM

```text
distance from boundary
        ↓
margin
```

So this seemingly simple half-space concept is actually laying the geometric foundation for several major ML algorithms.

---

# 🧠 Part 3 Mental Model

Don't memorize:

> "Positive means one side and negative means another."

Instead visualize:

```text
                       +w
                        ↑
                        │
                        │
                        ●  X
                        │
════════════════════════●════════════════
                       P
                     PLANE
════════════════════════════════════════
                        │
                        │
                        ↓
                       -w
```

Then remember:

```text
X toward +w
    ↓
positive

X on plane
    ↓
zero

X toward -w
    ↓
negative
```

The equation is simply the algebraic way of detecting this geometric relationship.

---

# 🔑 Part 3 Takeaways

### 1. $\overrightarrow{w}$ is perpendicular to the plane.

```math id="hs3-t1"
\boxed{
\overrightarrow{w}\perp\text{plane}
}
```

### 2. Pick any point $P$ on the plane.

Then:

```math id="hs3-t2"
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}
(\overrightarrow{x}-\overrightarrow{p})
}
```

### 3. The dot product determines the side.

```text
positive → displacement has component along +w
negative → displacement has component along -w
zero     → point is on plane
```

### 4. $\overrightarrow{w}$ establishes the orientation.

```text
+w → positive half-space
-w → negative half-space
```

### 5. Flipping $\overrightarrow{w}$ flips the positive/negative labels but does not change the boundary.

### 6. Signed distance is projection onto the unit normal:

```math id="hs3-t6"
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

### 7. Ordinary distance removes the sign:

```math id="hs3-t7"
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

## One-Line Understanding

> **The normal vector $\overrightarrow{w}$ points toward one half-space; the dot product measures whether a point's displacement from the plane points along $\overrightarrow{w}$ or opposite to it, so the sign of $\overrightarrow{w}^{T}\overrightarrow{x}+w_0$ tells us which half-space contains the point.**

### Next: **Part 4 — Mathematical Definition of Half-Space**

We will now formalize everything we have understood geometrically: define positive and negative half-spaces mathematically, distinguish **open vs closed half-spaces**, and connect the inequalities directly to ML classification.
