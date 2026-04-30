Let's explore how to find the distance between two points on a Cartesian plane. This concept is fundamental in geometry and linear algebra.

---

### Understanding the Cartesian Plane

The Cartesian plane is a 2D coordinate system. It has two perpendicular axes:
*   The **x-axis** (horizontal)
*   The **y-axis** (vertical)

Any point on this plane can be identified by an ordered pair of numbers $(x, y)$, where the first number ($x$) is its position along the x-axis, and the second number ($y$) is its position along the y-axis.

---

### The Distance Formula

To find the distance between two points, say $P_1$ and $P_2$, we use a formula derived from the Pythagorean theorem.

Let $P_1$ have coordinates $(x_1, y_1)$ and $P_2$ have coordinates $(x_2, y_2)$.

1.  **Form a Right-Angled Triangle:** Imagine drawing a straight line segment connecting $P_1$ and $P_2$. Now, draw a horizontal line from $P_1$ and a vertical line from $P_2$ (or vice-versa) until they meet. This forms a right-angled triangle where the segment $P_1P_2$ is the hypotenuse.

2.  **Calculate the Lengths of the Legs:**
    *   The length of the horizontal leg is the absolute difference between the x-coordinates: $|x_2 - x_1|$.
    *   The length of the vertical leg is the absolute difference between the y-coordinates: $|y_2 - y_1|$.

3.  **Apply the Pythagorean Theorem:** The Pythagorean theorem states that in a right-angled triangle, the square of the hypotenuse (c) is equal to the sum of the squares of the other two sides (a and b): $a^2 + b^2 = c^2$.

    In our case:
    *   $a = |x_2 - x_1|$
    *   $b = |y_2 - y_1|$
    *   $c = d$ (the distance between $P_1$ and $P_2$)

    So, we have:
    \[ d^2 = (|x_2 - x_1|)^2 + (|y_2 - y_1|)^2 \]

    Since squaring a number always results in a non-negative value, we can remove the absolute value signs:
    \[ d^2 = (x_2 - x_1)^2 + (y_2 - y_1)^2 \]

4.  **Solve for the Distance (d):** To find the distance $d$, we take the square root of both sides:
    \[ d = \sqrt{(x_2 - x_1)^2 + (y_2 - y_1)^2} \]

This is the **distance formula**. It tells us that the distance between any two points $(x_1, y_1)$ and $(x_2, y_2)$ in a Cartesian plane is the square root of the sum of the squares of the differences in their coordinates.
  

## Q. How to you think we should use Pythagorean theorem for this and what is hypotenuse in general, how to understand this?  

Let's break down the Pythagorean theorem and how it helps us find the distance between two points.

---

### What is a Hypotenuse?

In a **right-angled triangle**, which is a triangle that has one angle measuring exactly 90 degrees, the **hypotenuse** is the side that is **opposite** the right angle. It is always the **longest** side of the right-angled triangle.

Imagine a triangle with corners labeled A, B, and C, where angle C is the right angle (90 degrees). The side connecting points A and B would be the hypotenuse.

---

### The Pythagorean Theorem

The Pythagorean theorem states a relationship between the lengths of the sides of a right-angled triangle. If we call the lengths of the two shorter sides (the ones that form the right angle) '$a$' and '$b$', and the length of the hypotenuse '$c$', then the theorem says:

$a^2 + b^2 = c^2$

In simple terms: If you square the length of side 'a' and add it to the square of the length of side 'b', you get the same result as squaring the length of the hypotenuse 'c'.

---

### Using the Pythagorean Theorem for Distance

When we want to find the distance between two points, let's call them $P_1$ and $P_2$, on a Cartesian plane, we can imagine these two points as forming the hypotenuse of a right-angled triangle.

Let $P_1$ be at $(x_1, y_1)$ and $P_2$ be at $(x_2, y_2)$.

1.  **Visualize the Triangle:**
    *   Draw a horizontal line from $P_1$ (or $P_2$).
    *   Draw a vertical line from $P_2$ (or $P_1$).
    *   These two lines will meet at a third point, let's call it $P_3$. This point will have coordinates $(x_1, y_2)$ or $(x_2, y_1)$.
    *   The points $P_1$, $P_2$, and $P_3$ now form a right-angled triangle, with the right angle at $P_3$. The distance we want to find (between $P_1$ and $P_2$) is the hypotenuse of this triangle.

2.  **Find the Lengths of the Other Two Sides (the Legs):**
    *   The horizontal leg of the triangle is the distance between $P_1$ and $P_3$ along the x-axis. Its length is the difference between their x-coordinates: $|x_2 - x_1|$.
    *   The vertical leg of the triangle is the distance between $P_2$ and $P_3$ along the y-axis. Its length is the difference between their y-coordinates: $|y_2 - y_1|$.

3.  **Apply the Pythagorean Theorem:**
    *   Let the horizontal leg be '$a$' and the vertical leg be '$b$'.
    *   Let the distance between $P_1$ and $P_2$ (the hypotenuse) be '$d$'.
    *   According to the Pythagorean theorem: $a^2 + b^2 = d^2$.

    Now, substitute the lengths we found:
    $$(|x_2 - x_1|)^2 + (|y_2 - y_1|)^2 = d^2$$

    Since squaring a number makes it positive, $(|x_2 - x_1|)^2$ is the same as $(x_2 - x_1)^2$, and $(|y_2 - y_1|)^2$ is the same as $(y_2 - y_1)^2$. So we get:

    $$(x_2 - x_1)^2 + (y_2 - y_1)^2 = d^2$$

4.  **Solve for the Distance ($d$):**
    To find the distance $d$, we take the square root of both sides:

    $$d = \sqrt{(x_2 - x_1)^2 + (y_2 - y_1)^2}$$

This formula is exactly the distance formula we use, and it's directly derived from the Pythagorean theorem by seeing the distance between two points as the hypotenuse of a carefully constructed right-angled triangle!  

## Q. 
