The Question has given:

```text
x = [2]
    [3]

y = [ 3]
    [-2]
```

And asks:

1. What is the dot product?
2. What is the angle between them?

---

# Step 1: Calculate Dot Product

For two vectors:

```text
x = [x₁]
    [x₂]

y = [y₁]
    [y₂]
```

Dot product is:

```text
x·y = x₁y₁ + x₂y₂
```

For our vectors:

```text
x = [2]
    [3]

y = [ 3]
    [-2]
```

Calculate:

```text
x·y = (2 × 3) + (3 × -2)
```

```text
x·y = 6 - 6
```

```text
x·y = 0
```

✅ **Dot Product = 0**

---

# Step 2: What does Dot Product = 0 mean?

A very important property:

If

```text
x·y = 0
```

then vectors are **orthogonal (perpendicular)**.

So immediately we know:

```text
Angle = 90°
```

or

```text
π/2 radians
```

---

# Step 3: Verify using angle formula

The angle formula is:

[
\cos\theta =
\frac{x\cdot y}
{|x||y|}
]

Using our values:

```text
x·y = 0
```

Therefore:

[
\cos\theta =
\frac{0}
{|x||y|}
]

[
\cos\theta = 0
]

Now:

[
\theta = \cos^{-1}(0)
]

[
\theta = \frac{\pi}{2}
]

---

# Step 4: Magnitudes (for completeness)

Magnitude of x:

[
|x| = \sqrt{2^2 + 3^2}
]

[
|x| = \sqrt{13}
]

Magnitude of y:

[
|y| = \sqrt{3^2 + (-2)^2}
]

[
|y| = \sqrt{13}
]

So:

[
\cos\theta
==========

# \frac{0}{\sqrt{13}\times\sqrt{13}}

0
]

Same answer.

---

# Final Answer

### Dot Product

```text
0
```

### Angle Between Vectors

```text
90°
```

or

[
\boxed{\frac{\pi}{2}}
]

---

## ML/AI Interview Tip

Whenever you compute a dot product and get:

```text
0
```

you can immediately conclude:

```text
Vectors are perpendicular
Angle = 90° = π/2
```

without even calculating magnitudes. This shortcut appears frequently in Linear Algebra, ML, and Scaler assignments.

