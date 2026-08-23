

# Given Dataset

We have:

| Point   | Label |
| ------- | ----: |
| ((1,2)) |     0 |
| ((3,1)) |     1 |
| ((0,0)) |     0 |
| ((4,0)) |     1 |

So visually:

```text
y
↑
2       ● (1,2) → Class 0

1                   ● (3,1) → Class 1

0   ● (0,0)                    ● (4,0) → Class 1
    └──────────────────────────────────→ x₁
```

We want a line that puts:

```text
Class 0  → one side
Class 1  → other side
```

---

# The Correct Approach

For these questions, don't immediately try to draw every line.

Instead:

### Step 1

Take one candidate line.

### Step 2

Convert it into:

[
g(x)=0
]

### Step 3

Calculate (g(x)) for every data point.

### Step 4

Check whether the two classes have **opposite signs**.

For example:

[
g(x)<0 \rightarrow Class\ 0
]

[
g(x)>0 \rightarrow Class\ 1
]

The exact assignment of positive/negative doesn't matter.

What matters is:

> **All points of one class must be on one side, and all points of the other class must be on the other side.**

Also, ideally **no training point should lie directly on the decision boundary** for "classify properly."

---

# Option 1: (x_1=0.5)

Rewrite:

[
x_1-0.5=0
]

Therefore:

[
g(x)=x_1-0.5
]

Check the points.

### ((1,2)), Class 0

[
g=1-0.5=0.5
]

Positive.

### ((3,1)), Class 1

[
g=3-0.5=2.5
]

Positive.

Already we have:

```text
Class 0 → Positive
Class 1 → Positive
```

❌ Not separated.

So:

[
\boxed{\text{Option 1: Incorrect}}
]

---

# Option 2: (x_2=1)

Rewrite:

[
x_2-1=0
]

So:

[
g(x)=x_2-1
]

Check:

### ((1,2)), Class 0

[
2-1=1
]

Positive.

### ((3,1)), Class 1

[
1-1=0
]

This point lies **directly on the boundary**.

Already this cannot properly separate the classes.

❌

[
\boxed{\text{Option 2: Incorrect}}
]

---

# Option 3: (x_1=2)

Rewrite:

[
x_1-2=0
]

Therefore:

[
g(x)=x_1-2
]

Now check every point.

### Class 0

Point:

[
(1,2)
]

[
g=1-2=-1
]

Negative.

Point:

[
(0,0)
]

[
g=0-2=-2
]

Negative.

Therefore:

[
\boxed{\text{Class 0 → Negative}}
]

---

### Class 1

Point:

[
(3,1)
]

[
g=3-2=1
]

Positive.

Point:

[
(4,0)
]

[
g=4-2=2
]

Positive.

Therefore:

[
\boxed{\text{Class 1 → Positive}}
]

Perfect!

```text
             x₁ = 2
                │
Class 0         │        Class 1
                │
 ● (1,2)        │          ● (3,1)
                │
 ● (0,0)        │                    ● (4,0)
                │
                │
```

Therefore:

[
\boxed{x_1=2}
]

is the correct answer.

---

# Option 4: (x_2=x_1+2)

Rewrite:

[
x_2-x_1-2=0
]

So:

[
g(x)=x_2-x_1-2
]

Let's check.

### ((1,2)), Class 0

[
g=2-1-2=-1
]

Negative.

### ((3,1)), Class 1

[
g=1-3-2=-4
]

Negative.

So we already have:

```text
Class 0 → Negative
Class 1 → Negative
```

❌ Not separated.

Also, notice something interesting:

The line

[
x_2=x_1+2
]

actually passes directly through ((1,3)), not through ((1,2)), so the problem is not that point. The sign test is enough to reject it.

Thus:

[
\boxed{\text{Option 4: Incorrect}}
]

---

# Final Answer

[
\boxed{x_1=2}
]

---

# 🧠 The General ML Approach

This is the important part to remember.

Whenever you get:

> **"Which line correctly classifies these points?"**

Think:

```text
Candidate line
      ↓
Write as g(x) = 0
      ↓
Calculate g(x) for each point
      ↓
Look at the signs
      ↓
┌─────────────────────────────┐
│ Class 0 → same sign         │
│ Class 1 → opposite sign     │
└─────────────────────────────┘
      ↓
Correct classifier
```

For a general line:

[
w^Tx+w_0=0
]

we calculate:

[
\boxed{g(x)=w^Tx+w_0}
]

Then:

[
g(x)>0
]

means the point is on one side.

[
g(x)<0
]

means the point is on the other side.

And:

[
g(x)=0
]

means:

> **The point lies exactly on the decision boundary.**

---

# 🔥 Why This Is Important for ML

You have now connected three things we have learned:

### 1. Hyperplane

[
w^Tx+w_0=0
]

↓

### 2. Dot Product

[
w^Tx
]

↓

### 3. Classification

[
\boxed{
w^Tx+w_0
\begin{cases}

> 0 & \text{Class 1}\
> <0 & \text{Class 0}
> \end{cases}
> }
> ]

This is the fundamental idea behind a **linear classifier**.

And notice how our answer

[
x_1=2
]

can itself be written in exactly this ML form:

[
x_1-2=0
]

which means:

[
w=
\begin{bmatrix}
1\
0
\end{bmatrix},
\qquad
w_0=-2
]

So we're not learning a new trick here—we are **using the (w^Tx+w_0=0) concept we already learned**.

