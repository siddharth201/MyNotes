In Machine Learning (especially Linear Algebra for ML), **parallel lines** and **perpendicular lines** are important because they help us understand vectors, decision boundaries, gradients, and optimization.

## 1. Parallel Lines

Two lines are parallel if they have the **same direction**.

### Equation Form

$$y = mx + c$$

Two lines are parallel when:

$$m_1 = m_2$$

where $(m)$ is the slope.

### Example

$$y = 2x + 1$$

$$y = 2x - 5$$

Both have slope (2), so they are parallel.

### Vector Interpretation

Suppose:

$$\vec{v_1} = (2,4)$$

$$\vec{v_2} = (1,2)$$

Since

$$\vec{v_1} = 2\vec{v_2}$$

they point in exactly the same direction.

Hence they are **parallel vectors**.

---

### In ML

Consider a linear classifier:

$
w_1x_1 + w_2x_2 + b = 0
$

If we change only (b):

$
w_1x_1 + w_2x_2 + b_1 = 0
$

$
w_1x_1 + w_2x_2 + b_2 = 0
$

The decision boundaries are **parallel** because the weight vector (w) remains the same.

Example:

$
x+y-2=0
$

$
x+y-5=0
$

These are parallel lines.

---

## 2. Perpendicular Lines

Two lines are perpendicular when they intersect at (90^\circ).

### Slope Rule

$
m_1m_2=-1
$

### Example

$
y=2x+1
$

$
y=-\frac12 x+3
$

Check:

$
2 \times \left(-\frac12\right)=-1
$

Therefore they are perpendicular.

---

## Vector Interpretation

Two vectors are perpendicular when their **dot product is zero**.

$
\vec a \cdot \vec b = 0
$

### Example

$
\vec a=(2,1)
$

$
\vec b=(1,-2)
$

Dot product:

$
(2)(1)+(1)(-2)=0
$

Hence they are perpendicular.

---

## Why Perpendicular Matters in ML?

### Gradient and Contour Lines

Suppose loss function:

$
L(x,y)=x^2+y^2
$

Contours are circles.

Gradient:

$
\nabla L =
\left(
\frac{\partial L}{\partial x},
\frac{\partial L}{\partial y}
\right)
=======

(2x,2y)
$

The gradient is always **perpendicular** to the contour.

This is why Gradient Descent moves in the direction of steepest increase/decrease.

### Visualization

```
       ↑ Gradient
       |
       |
   ----●----
  /         \
 / Contour   \
 \           /
  \         /
```

Gradient is normal (90°) to the contour.

---

## Important ML Formula

For a line (decision boundary):

$
w^Tx+b=0
$

The vector

$
w=
\begin{bmatrix}
w_1\
w_2
\end{bmatrix}
$

is **perpendicular** to the line.

### Example

$
2x+y-3=0
$

Weight vector:

$
w=(2,1)
$

The vector $(2,1)$ is normal (perpendicular) to the line.

This concept is heavily used in:

* Linear Regression
* Logistic Regression
* SVM
* Neural Networks (gradients)

---

## Quick Cheat Sheet

| Concept               | Condition                          |
| --------------------- | ---------------------------------- |
| Parallel Lines        | (m_1=m_2)                          |
| Perpendicular Lines   | (m_1m_2=-1)                        |
| Parallel Vectors      | One is scalar multiple of other    |
| Perpendicular Vectors | Dot Product = 0                    |
| Decision Boundaries   | Same (w), different (b) ⇒ Parallel |
| Weight Vector (w)     | Perpendicular to boundary          |
| Gradient (\nabla L)   | Perpendicular to contour           |

### ML Interview Question

Given the decision boundary:

$
3x_1+4x_2-10=0
$

What vector is perpendicular to the boundary?

Answer:

$
w=(3,4)
$

because for any boundary

$
w^Tx+b=0
$

the weight vector (w) is always normal (perpendicular) to the boundary.

This single idea is one of the most important geometric concepts behind Logistic Regression and SVMs.
