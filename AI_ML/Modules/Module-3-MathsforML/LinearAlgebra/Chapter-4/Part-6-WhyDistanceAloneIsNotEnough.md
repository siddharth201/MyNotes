

# Part 6 — Why Distance Alone Is Not Enough

We now have an important tool:
For a specific training point $\overrightarrow{x}^{(i)}$, its signed distance from the decision boundary is

$$d^{(i)} = \frac{\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b}{\Vert{}\overrightarrow{w}\Vert{}}$$

And we know:

* $d^{(i)} > 0 \rightarrow$ one side
* $d^{(i)} = 0 \rightarrow$ on boundary
* $d^{(i)} < 0 \rightarrow$ other side

At first, this seems like everything we need.
But there is a subtle problem.

Distance by itself does not tell us whether the point is correctly classified.
Let's understand why.

## 1. Suppose We Have Two Classes

Let's define our labels as:


$$y^{(i)}\in\{-1,+1\}$$

For example:

* +1 → 🟢 Class A
* -1 → 🔴 Class B

And suppose our decision boundary is:

```text
                 +1
          ●   ●   ●
             ●

────────────────────────
      Decision Boundary
────────────────────────

          ○   ○
        ○   ○   ○
                 -1

```

The classifier predicts:

$$\hat{y}^{(i)} = \begin{cases} +1 & \text{if } \overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b>0 \\ -1 & \text{if } \overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b<0 \end{cases}$$

So far, so good.

## 2. Consider a Correctly Classified Point

Suppose the actual label is:


$$y^{(i)}=+1$$

And the point lies on the positive side:


$$\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b>0$$

Then:

* Actual label: +1
* Prediction: +1
* **✅ Correct**

Its signed distance might be:


$$d^{(i)}=+3$$

Excellent.

## 3. Now Consider a Misclassified Point

Suppose the actual label is still:


$$y^{(i)}=+1$$

But the point is on the negative side:


$$\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b<0$$

For example:


$$d^{(i)}=-3$$

Then:

* Actual label: +1
* Prediction: -1
* **❌ Wrong**

But look at the ordinary distance.
The first point had:


$$\vert{}d^{(i)}\vert{}=3$$

The second point also has:


$$\vert{}d^{(i)}\vert{}=3$$

So ordinary distance says:

* Correct point → 3 units away
* Wrong point → 3 units away

It doesn't care about the classification.

## 4. This Is the Core Problem

Imagine two points:

```text
                         +1 side

                ● A
                │
                │ +3
                │
────────────────┼────────────────
             Boundary
                │
                │ -3
                │
                ● B

                         -1 side

```

Suppose:

* A → actual label +1
* B → actual label +1

Then:

**Point A**

* Actual = +1
* Prediction = +1
* Correct ✅

**Point B**

* Actual = +1
* Prediction = -1
* Wrong ❌

Yet:

* Distance of A = 3
* Distance of B = 3

So:
Absolute distance cannot distinguish a correctly classified point from a misclassified point.

## 5. What Information Are We Missing?

We need to combine two pieces of information:

**Information 1 — Where is the point?**
The signed quantity:


$$\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b$$


tells us which side the point lies on.

**Information 2 — What should its class be?**
The actual label:


$$y^{(i)}$$


tells us whether it should belong to the positive or negative class.

So we need some way to combine:
**Actual label + Position relative to boundary**

This is the key idea of this Part.

## 6. The Beautiful Trick: Multiply Them

Our labels are:


$$y^{(i)}\in\{-1,+1\}$$

And our signed position is:


$$\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b$$

So let's multiply them:


$$y^{(i)}\left(\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b\right)$$

This looks like a small algebraic trick.
But it gives us something extremely useful.

## 7. Case 1 — Correctly Classified +1 Point

Suppose:


$$y^{(i)}=+1$$

and the point is correctly on the positive side:


$$\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b>0$$

Then:


$$(+1)(\text{positive}) = \text{positive}$$

Therefore:


$$\boxed{y^{(i)}\left(\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b\right)>0}$$

## 8. Case 2 — Correctly Classified -1 Point

Now suppose:


$$y^{(i)}=-1$$

A correctly classified $-1$ point must lie on the negative side:


$$\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b<0$$

Therefore:


$$(-1)(\text{negative}) = \text{positive}$$

Again:


$$\boxed{y^{(i)}\left(\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b\right)>0}$$

That's the clever part.

## 9. Both Correct Cases Become Positive

Let's put them together:

| Actual label | Side of boundary | Correct? | Product |
| --- | --- | --- | --- |
| $+1$ | Positive | ✅ | Positive |
| $-1$ | Negative | ✅ | Positive |

So:
**Correct classification ↓**
**$y^{(i)}(\overrightarrow{w}^{T}\overrightarrow{x}^{(i)} + b) > 0$**

This gives us a single mathematical test for correctness.

## 10. What Happens When the Point Is Wrong?

Now let's deliberately misclassify the points.

**Wrong +1 point**
Actual:


$$y^{(i)}=+1$$

But it lies on the negative side:


$$\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b<0$$

Therefore:


$$(+1)(\text{negative}) = \text{negative}$$

So:


$$\boxed{y^{(i)}\left(\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b\right)<0}$$

**Wrong -1 point**
Actual:


$$y^{(i)}=-1$$

But it lies on the positive side:


$$\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b>0$$

Therefore:


$$(-1)(\text{positive}) = \text{negative}$$

Again:


$$\boxed{y^{(i)}\left(\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b\right)<0}$$

## 11. The Entire Idea in One Table

This is one of the most important tables in this chapter.

| Actual $y^{(i)}$ | Position $\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b$ | Result | Classification |
| --- | --- | --- | --- |
| $+1$ | Positive | Positive | ✅ Correct |
| $-1$ | Negative | Positive | ✅ Correct |
| $+1$ | Negative | Negative | ❌ Wrong |
| $-1$ | Positive | Negative | ❌ Wrong |

Therefore:


$$\boxed{y^{(i)}\left(\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b\right)>0 \quad\Rightarrow\quad \text{correctly classified}}$$

and:


$$\boxed{y^{(i)}\left(\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b\right)<0 \quad\Rightarrow\quad \text{misclassified}}$$

## 12. Let's Bring Distance Back

Earlier we defined signed distance as:


$$d^{(i)} = \frac{\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b}{\Vert{}\overrightarrow{w}\Vert{}}$$

We can multiply this by the actual label:


$$y^{(i)}d^{(i)}$$

Therefore:


$$y^{(i)}d^{(i)} = y^{(i)} \frac{\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b}{\Vert{}\overrightarrow{w}\Vert{}}$$

or:


$$\boxed{y^{(i)}d^{(i)} = \frac{y^{(i)}\left(\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b\right)}{\Vert{}\overrightarrow{w}\Vert{}}}$$

This quantity is extremely important.
It tells us:
How far the point is from the boundary, while taking its actual class into account.

## 13. Why Is This Better Than Ordinary Distance?

Suppose we have:

* Point A → actual +1 → signed distance +3
* Point B → actual +1 → signed distance -3

Ordinary distances:


$$\vert{}+3\vert{}=3$$

$$\vert{}-3\vert{}=3$$


No distinction.

Now multiply by the labels.
**Point A**


$$(+1)(+3)=+3$$

**Point B**


$$(+1)(-3)=-3$$

Now:

* A → +3 → correct side
* B → -3 → wrong side

The sign has become meaningful.

## 14. A Very Simple Real-World Analogy

Imagine a road with a center line:

```text
          LEFT
           ←
───────────┼───────────
       CENTER LINE
           │
           │
          RIGHT
           →

```

Suppose:

* +1 = should be on RIGHT
* -1 = should be on LEFT

Now:
**Person A:**

* Actual = +1
* Position = RIGHT
* → Correct ✅

And:
**Person B:**

* Actual = +1
* Position = LEFT
* → Wrong ❌

Distance from the center line alone doesn't tell you whether they are on the correct side.
You need:
**What side are they on? + Where should they be?**

Multiplying the signs gives us exactly that information.

## 15. 🎯 Ultimate Goal in ML

This is the important conceptual progression.
We started with:

* Decision Boundary ↓
* Which side? ↓
* Signed Distance

But now we add:

* Actual label ↓
* Compare expected side with actual side ↓
* Correct or incorrect?

So:

* Data Point ↓
* $\overrightarrow{w}^{T}\overrightarrow{x}^{(i)} + b$ ↓
* Which side? ↓
* Signed distance ↓
* × actual label ↓
* Correct or incorrect?

And eventually we will go one step further:
Can we measure not merely whether a point is correct, but how safely correct it is?
That question leads us toward **margin**.

## 16. Important Distinction: Classification vs Confidence

Suppose three points are all correctly classified:

* Point A → +0.2
* Point B → +2
* Point C → +10

All are:
Correct ✅

But they are not equally well separated.

* +0.2 → very close to boundary
* +2   → reasonably far
* +10  → very far

So we would like a quantity that captures:
**Correctness + distance from the boundary**

That is precisely why the label-adjusted signed distance is useful.

## 17. Static Notebook Visual

Keep this visual in your `.md` notes:

```text
                         +1 CLASS

                    ●  x⁽ⁱ⁾
                    │
                    │ +d⁽ⁱ⁾
                    │
                    ↓
────────────────────┼────────────────────
                Decision Boundary
────────────────────┼────────────────────
                    ↑
                    │ -d⁽ʲ⁾
                    │
                    ●  x⁽ʲ⁾

                         -1 CLASS

```

Then:

**Correct +1 point:**
$y^{(i)} = +1$
$d^{(i)} > 0$
$(+1)(+\text{distance}) = \text{positive}$

**Correct -1 point:**
$y^{(i)} = -1$
$d^{(i)} < 0$
$(-1)(-\text{distance}) = \text{positive}$

So:

```text
             y⁽ⁱ⁾ × signed distance
                         ↓
              ┌──────────┴──────────┐
              ↓                     ↓
           positive               negative
              ↓                     ↓
          Correct                  Wrong

```

## 18. The Core Formula We Have Reached

The label-adjusted signed distance is:


$$\boxed{\frac{y^{(i)}\left(\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b\right)}{\Vert{}\overrightarrow{w}\Vert{}}}$$

Interpretation:
It tells us how far the data point lies on the side of the boundary that is correct for its actual class.
For now, that's the most important meaning.

---

## 🧠 Part 6 — What You Should Remember

**① Ordinary distance is not enough**


$$\frac{\left\vert{}\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b\right\vert{}}{\Vert{}\overrightarrow{w}\Vert{}}$$


only tells us: How far?
It loses the side information.

**② Signed distance preserves side information**


$$\frac{\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b}{\Vert{}\overrightarrow{w}\Vert{}}$$


tells us: How far + which side?

**③ Actual label tells us where the point SHOULD be**


$$y^{(i)}\in\{-1,+1\}$$

**④ Multiplying them aligns the signs**


$$\boxed{y^{(i)}\left(\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b\right)>0}$$


means: The point is correctly classified.

**⑤ Label-adjusted signed distance**


$$\boxed{\frac{y^{(i)}\left(\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b\right)}{\Vert{}\overrightarrow{w}\Vert{}}}$$


means: How far the point is on its correct side of the boundary.

---

### 🔑 One-line takeaway

Distance alone tells us how far a point is from the boundary; multiplying the signed distance by its actual label tells us whether that distance is on the correct side.

And this sets up the next important question:

### Part 7 — From Signed Distance to Margin

Here we will connect this quantity to the idea of margin and finally understand why a classifier would want the two classes to have a larger gap between them.
