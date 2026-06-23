A **vector** is a mathematical object that has both **magnitude** (size or length) and **direction**. Think of it like an arrow: it has a certain length, and it points in a specific way.

This is different from a **scalar**, which only has magnitude. For example, temperature is a scalar (it just has a value, like 25 degrees Celsius), but wind is a vector (it has a speed, like 15 kilometers per hour, *and* it's blowing from a specific direction, like from the north).

### How Vectors are Represented

Vectors can be represented in a few ways:

1.  **As an Arrow:** In diagrams, a vector is often shown as an arrow. The length of the arrow represents the magnitude, and the arrowhead shows the direction.
2.  **Using Coordinates:** In a coordinate system (like a graph), a vector can be represented by its components. For example, in a 2D plane, a vector might be written as $(x, y)$, where $x$ tells you how much to move horizontally, and $y$ tells you how much to move vertically. In 3D space, it would be $(x, y, z)$.

### Magnitude and Direction

*   **Magnitude:** This is the "how much" of the vector. For an arrow, it's its length. For a coordinate vector $(x, y)$, the magnitude (often written as $||\mathbf{v}||$ or $|\mathbf{v}|$) is calculated using the Pythagorean theorem: $||\mathbf{v}|| = \sqrt{x^2 + y^2}$.
*   **Direction:** This is the "which way" of the vector. It tells you the orientation of the vector. For an arrow, it's simply the way it's pointing. For a coordinate vector $(x, y)$, the direction can be described by an angle relative to an axis (like the positive x-axis).

---

### Examples

Here are some examples to help you understand vectors:

#### 1. Displacement

Imagine you walk 5 meters **east**.
*   This is a vector.
*   **Magnitude:** 5 meters.
*   **Direction:** East.

If you then walk 3 meters **north**, that's another vector. If you want to describe your final position relative to where you started, you'd be interested in the *resultant* vector that combines these two movements.

If we use coordinates, and East is the positive x-direction and North is the positive y-direction:
*   Walking 5 meters East can be represented as the vector $\mathbf{v}_1 = (5, 0)$.
*   Walking 3 meters North can be represented as the vector $\mathbf{v}_2 = (0, 3)$.
*   Your total displacement from the start is the sum of these vectors: $\mathbf{v}_{total} = \mathbf{v}_1 + \mathbf{v}_2 = (5, 0) + (0, 3) = (5, 3)$.
    *   This means you are 5 meters east and 3 meters north of your starting point.
    *   The magnitude of your total displacement is $\sqrt{5^2 + 3^2} = \sqrt{25 + 9} = \sqrt{34}$ meters.
    *   The direction can be described by the angle -
    
$$
\theta = \arctan\left(\frac{3}{5}\right)
$$

[**Explanation of Example**](https://chatgpt.com/s/t_6a3aa069fe4c81919f11a523793275af)

#### 2. Velocity

When a car moves, its velocity is a vector.
*   **Magnitude:** The speed of the car (e.g., 60 kilometers per hour).
*   **Direction:** The direction the car is traveling (e.g., North, or along Highway 101).

If a car is traveling at 60 km/h North, and another car is traveling at 60 km/h South, they have the same speed (magnitude) but opposite directions, so their velocities are different vectors.

#### 3. Force

In physics, a force is a push or a pull, and it always has a direction.
*   **Magnitude:** How strong the push or pull is (e.g., 10 Newtons).
*   **Direction:** The direction of the push or pull (e.g., pushing downwards, pulling to the left).

If you and a friend are pushing a box, the total force on the box is the sum of your individual force vectors. If you both push in the same direction, the magnitudes add up. If you push in opposite directions, they might cancel out.

#### 4. Wind

As mentioned earlier, wind has both speed and direction.
*   **Magnitude:** The wind speed (e.g., 20 km/h).
*   **Direction:** The direction the wind is coming from or blowing towards (e.g., a westerly wind blows from the west towards the east).

Understanding vectors is fundamental in many areas of science, engineering, and computer graphics because they allow us to precisely describe quantities that involve movement or orientation in space.
