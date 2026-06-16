
In standard math, we deal with single numbers (like x=5 or y=10). In Machine Learning, dealing with one number at a time is far too slow and limited. We need a way to package multiple numbers together and mathematically operate on them all at once. That is what a vector is.


### Why is this shift to Vectors so important?
**Dimensionality:** A house doesn't just have an area (x). It has an area $(x1)$, a number of bedrooms $(x2)$, an age $(x3)$, and a distance to a school $(x4)$. Instead of creating complex 4D algebraic equations, we just put all those inputs into a single array: $X = [x1, x2, x3, x4]$. This is a 4-dimensional vector.  

**Operations:** Once your data is in a vector, you can do magical things. For example, if you have a vector representing "King" and a vector representing "Woman", you can add and subtract them. $[King] - [Man] + [Woman]$ in a well-trained AI will actually equal the vector for $[Queen]!$
