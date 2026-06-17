Now that you understand vectors as points or arrows in space, the very next question a Machine Learning model asks is: **"How big are these vectors, and how far apart are they?"**

In Machine Learning, **Distance = Difference**. If you map two users as vectors based on their movie preferences, finding the "distance" between those vectors tells the AI exactly how similar or different those users are.

Let's break down how we measure this, starting with a single vector and then comparing two.

---

### 1. Vector Norms (The Math Word for "Magnitude")

In mathematics, a **Norm** is just a function that calculates the "size" or "length" of a vector. You can think of it as the **Magnitude**. We denote the norm of a vector $v$ with double bars: $||v||$.

There isn't just one way to measure length. We use different "Norms" depending on the problem.

#### A. Euclidean Magnitude ($L_2$ Norm)

This is the standard, everyday "length" of an arrow. It is derived directly from the Pythagorean theorem ($a^2 + b^2 = c^2$).

* **Formula:** $||v||_2 = \sqrt{x^2 + y^2}$
* **Intuition:** If you take a tape measure and stretch it directly from the origin $(0,0)$ to the tip of your vector, this is the number you get. It calculates the shortest, straight-line distance.
* **In ML:** It heavily penalizes large numbers because it squares the values.

#### B. Manhattan Magnitude ($L_1$ Norm)

Imagine the grid of the vector canvas is a city map with buildings, like Manhattan in New York. You cannot fly in a straight diagonal line; you must walk along the horizontal and vertical streets.

* **Formula:** $||v||_1 = |x| + |y|$ *(The absolute value of x plus the absolute value of y)*
* **Intuition:** If your vector is at `[4, 3]`, you walk 4 blocks East and 3 blocks North. The Manhattan magnitude is $4 + 3 = 7$. (Whereas the Euclidean magnitude is $\sqrt{4^2 + 3^2} = \sqrt{25} = 5$).

---

### 2. Distance Formulas (Comparing Two Vectors)

If Norms measure the size of *one* vector from the origin, **Distance** measures the gap between *two* vectors (e.g., Vector A at $(x_1, y_1)$ and Vector B at $(x_2, y_2)$). Mathematically, the distance is just the Norm of the difference between the two vectors: $||A - B||$.

#### A. Euclidean Distance

* **Formula:** $d = \sqrt{(x_2 - x_1)^2 + (y_2 - y_1)^2}$
* **The Path:** The exact, straight-line path between point A and point B ("as the crow flies").

#### B. Manhattan Distance

* **Formula:** $d = |x_2 - x_1| + |y_2 - y_1|$
* **The Path:** The path you take if you are forced to move strictly horizontally and vertically to get from point A to point B.

---

### 3. Use Cases and Importance in Machine Learning

Why do we need two different ways to measure distance? It completely changes how an AI behaves!

#### Use Case 1: Finding "Similar" Data (Clustering & KNN)

Algorithms like **K-Nearest Neighbors (KNN)** or **K-Means Clustering** look at a new piece of data and say, *"What is closest to me?"* * **When to use Euclidean:** This is the default. If you are plotting physical coordinates or general data where straight-line proximity means similarity, use Euclidean.

* **When to use Manhattan:** If your data has massive **Outliers** (e.g., most houses cost $200k, but one costs $50 million). Because Euclidean *squares* the differences, that $50 million house will mathematically warp the whole model. Manhattan just takes the absolute difference, making it **robust to outliers**. It is also frequently used in very high-dimensional data (like text analysis) because Euclidean distance starts to break down mathematically when you have thousands of dimensions (a phenomenon known as the *Curse of Dimensionality*).

#### Use Case 2: Regularization (Controlling the AI's "Brain")

Remember our weights ($w_1, w_2$, etc.)? In deep learning, an AI might assign a massive weight (like $w_1 = 10,000$) to memorize the training data, but this makes it fail in the real world (called **Overfitting**). We use Vector Norms to punish the AI for having weights that are too large!

* **L2 Regularization (Ridge Regression):** The AI calculates the **Euclidean Norm ($L_2$)** of its Weight Vector and tries to keep that number small. This forces the AI to shrink *all* its weights evenly, making the model smooth and stable.
* **L1 Regularization (Lasso Regression):** The AI calculates the **Manhattan Norm ($L_1$)** of its Weight Vector. Because of the way the absolute value math works, L1 Regularization will literally force useless weights to become exactly **$0$**. If "Number of Doorbells" is a useless feature for predicting house prices, the L1 Norm will delete its weight entirely. It acts as an automatic feature selector!

**Summary Checklist:**

* **Euclidean ($L_2$):** Straight lines, squares the differences, sensitive to huge outliers, used to shrink weights smoothly.
* **Manhattan ($L_1$):** Grid paths, absolute differences, ignores huge outliers, used to force useless weights to zero.  

---  

### More Info  
[GPT](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/ML/Maths/Distance_GPT.md)
