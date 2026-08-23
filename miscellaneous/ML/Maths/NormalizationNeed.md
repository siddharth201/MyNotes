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

### 
