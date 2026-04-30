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
  

## Q. 
