### Explain why we need to normalize at first place?

### Answer:
We normalize by $\Vert{}\vec{w}\Vert{}$ because the unnormalized value depends on the scale of your weights, whereas true physical distance must remain constant.
## The Scale Problem
The decision boundary is defined by the equation:
$$\vec{w}^T \vec{x} + b = 0$$ 

* Same Boundary: Multiplying $\vec{w}$ and $b$ by $2$ keeps the exact same line.
* Changing Values: The raw score $\vec{w}^T \vec{x} + b$ doubles.
* The Flaw: A distance metric cannot change when the boundary does not move.

------------------------------
## Geometric Projection
To find the true distance, we project the vector pointing to $\vec{x}^{(i)}$ onto the unit vector normal to the plane.

* Normal Vector: $\vec{w}$ is perpendicular to the boundary line.
* Unit Direction: Dividing $\vec{w}$ by $\Vert{}\vec{w}\Vert{}$ creates a vector of length 1.
* Standard Unit: This removes the arbitrary scaling of the weights.

------------------------------
## Core Benefits

* Invariance: Distance stays identical if weights scale up.
* Comparisons: Allows fair margin comparisons across different models.
* Optimization: Crucial for defining the maximum margin in SVMs.

If you'd like, let me know:

* Do you want to see the mathematical proof using vector projection?
* Are you studying this for Support Vector Machines (SVM)?
* Should we look at how this impacts the loss function?


---  

### Actually I am not able to fully understand the concept, although I have memorized it but did not understood properly

### Answer:

Normalization converts an arbitrary model "score" into an unchangeable physical distance.
Without normalization, the calculated distance changes even if the boundary does not move.
## The "Same Line, Different Math" Trap
Consider this simple line equation:
$$1x_1 + 1x_2 - 2 = 0$$ 
Now, multiply the entire equation by 10:
$$10x_1 + 10x_2 - 20 = 0$$ 
Both equations describe the exact same line on a graph.
------------------------------
## Why the Raw Score Fails
Let us test the point $(3, 3)$ using both equations.

* Using the first equation:
$$\text{Score} = 1(3) + 1(3) - 2 = 4$$ 
* Using the second equation:
$$\text{Score} = 10(3) + 10(3) - 20 = 40$$ 

The point did not move. The line did not move. Yet, the score jumped from $4$ to $40$ purely because we changed our math scaling. An algorithm cannot rely on a "distance" that changes arbitrarily.
------------------------------
## How Normalization Fixes It
Dividing by $\vert{}\vert{}\vec{w}\vert{}\vert{}$ removes this scaling effect completely. Let us compute $\vert{}\vert{}\vec{w}\vert{}\vert{}$ (the length of the weight vector) for both:

* First equation weights $\vec{w} = [1, 1]$:
$$\vert{}\vert{}\vec{w}\vert{}\vert{} = \sqrt{1^2 + 1^2} = \sqrt{2}$$ 
$$\text{True Distance} = \frac{4}{\sqrt{2}} \approx 2.83$$ 
* Second equation weights $\vec{w} = [10, 10]$:
$$\vert{}\vert{}\vec{w}\vert{}\vert{} = \sqrt{10^2 + 10^2} = \sqrt{200} = 10\sqrt{2}$$ 
$$\text{True Distance} = \frac{40}{10\sqrt{2}} = \frac{4}{\sqrt{2}} \approx 2.83$$ 

By dividing by $\vert{}\vert{}\vec{w}\vert{}\vert{}$, both equations yield the exact same physical distance in real coordinate space units.
------------------------------
## Summary Checklist

* Raw Score: Measures confidence relative to weight scale.
* Normalized Distance: Measures physical gap in geometric space.
* Why it matters: Allows algorithms to find the absolute widest path.

To help solidify this, let me know:

* Would you like to try a quick practice problem to calculate this yourself?
* Do you want to see how this connects to the margin of an SVM classifier?
* Is the vector math behind the square root ($\sqrt{\dots}$) part clear?



