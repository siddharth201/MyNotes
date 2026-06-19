Let's break down that part of the calculation. It's very similar to how you multiply two binomials in algebra, like $(x + y)(u + v)$.

### 1. Distributive Property of Dot Product (Like Multiplying Binomials)

When we multiply two expressions involving vectors using the dot product, the distributive property allows us to multiply each term in the first expression by each term in the second expression.

Imagine you're multiplying:
$(\text{Term1}_a + \text{Term2}_a) \cdot (\text{Term1}_b + \text{Term2}_b)$

You do it just like algebra:
$= (\text{Term1}_a \cdot \text{Term1}_b) + (\text{Term1}_a \cdot \text{Term2}_b) + (\text{Term2}_a \cdot \text{Term1}_b) + (\text{Term2}_a \cdot \text{Term2}_b)$

In our case, the expressions are:
*   First expression: $\mathbf{a} + 2\mathbf{b}$
*   Second expression: $5\mathbf{a} - 4\mathbf{b}$

So, when we calculate $(\mathbf{a} + 2\mathbf{b}) \cdot (5\mathbf{a} - 4\mathbf{b})$, we get the four dot products:

*   $(\mathbf{a} \cdot 5\mathbf{a})$: The first term of the first vector $(\mathbf{a})$ multiplied by the first term of the second vector $(5\mathbf{a})$.
*   $(\mathbf{a} \cdot -4\mathbf{b})$: The first term of the first vector $(\mathbf{a})$ multiplied by the second term of the second vector $(-4\mathbf{b})$.
*   $(2\mathbf{b} \cdot 5\mathbf{a})$: The second term of the first vector $(2\mathbf{b})$ multiplied by the first term of the second vector $(5\mathbf{a})$.
*   $(2\mathbf{b} \cdot -4\mathbf{b})$: The second term of the first vector $(2\mathbf{b})$ multiplied by the second term of the second vector $(-4\mathbf{b})$.

Putting it all together, this gives us:
$(\mathbf{a} \cdot 5\mathbf{a}) + (\mathbf{a} \cdot -4\mathbf{b}) + (2\mathbf{b} \cdot 5\mathbf{a}) + (2\mathbf{b} \cdot -4\mathbf{b}) = 0$

---

### 2. Simplifying Each Term

Now we look at each of those four dot products and simplify them using properties of dot products and scalars.

#### Property: Scalar Multiplication with Dot Product

A key property is that you can move a scalar (a regular number) outside of a dot product. For example:
*   $(k \cdot \mathbf{v}) \cdot \mathbf{w} = k(\mathbf{v} \cdot \mathbf{w})$
*   $\mathbf{v} \cdot (k \cdot \mathbf{w}) = k(\mathbf{v} \cdot \mathbf{w})$

Let's apply this to our four terms:

*   **Term 1: $(\mathbf{a} \cdot 5\mathbf{a})$**
    The scalar is 5. We can move it out:
    $5(\mathbf{a} \cdot \mathbf{a})$

*   **Term 2: $(\mathbf{a} \cdot -4\mathbf{b})$**
    The scalar is -4. We can move it out:
    $-4(\mathbf{a} \cdot \mathbf{b})$

*   **Term 3: $(2\mathbf{b} \cdot 5\mathbf{a})$**
    Here we have two scalars, 2 and 5. We can move both out and multiply them:
    $(2 \cdot 5)(\mathbf{b} \cdot \mathbf{a}) = 10(\mathbf{b} \cdot \mathbf{a})$

*   **Term 4: $(2\mathbf{b} \cdot -4\mathbf{b})$**
    The scalars are 2 and -4. Move them out and multiply:
    $(2 \cdot -4)(\mathbf{b} \cdot \mathbf{b}) = -8(\mathbf{b} \cdot \mathbf{b})$

After applying this scalar property, our equation looks like this:
$5(\mathbf{a} \cdot \mathbf{a}) - 4(\mathbf{a} \cdot \mathbf{b}) + 10(\mathbf{b} \cdot \mathbf{a}) - 8(\mathbf{b} \cdot \mathbf{b}) = 0$

This matches the second line you showed. The next step would be to simplify $(\mathbf{a} \cdot \mathbf{a})$, $(\mathbf{b} \cdot \mathbf{b})$, and $\mathbf{b} \cdot \mathbf{a}$.
