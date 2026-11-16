# Gaussian Mixture Models (GMM) — Complete Explanation

Unsupervised Learning · Clustering · Probabilistic Models

Let's build our understanding of Gaussian Mixture Models from the ground up.

The learning sequence will be:

Why GMM? → Gaussian Distribution → Mixture Model → Soft Clustering → Mathematical Formulation → EM Algorithm → Covariance Types → K-Means Comparison → Python Implementation → Applications → Limitations.

The objective is not just to understand what GMM does, but also why it works and how it learns.

# 1. Motivation: Why do we need Gaussian Mixture Models?

Imagine an e-commerce company wants to segment its customers based on their shopping behaviour.

It has two features:

- Annual spending.
- Number of purchases per year.

The company wants to discover different customer groups without having predefined labels.

For example:

- Group A: Low spending, fewer purchases.
- Group B: Medium spending, moderate purchases.
- Group C: High spending, frequent purchases.

This is an unsupervised learning problem, specifically a clustering problem.

One algorithm we can use is K-Means.

However, let's understand a limitation of K-Means.

Suppose a customer has shopping behaviour that is somewhere between Group A and Group B.

K-Means will assign that customer to exactly one cluster.

For example:

```
Customer X → Cluster A
```

It doesn't directly tell us how strongly that customer belongs to each group.

But in real-world situations, group boundaries are not always clear.

A customer might have:

- 60% similarity to Group A.
- 35% similarity to Group B.
- 5% similarity to Group C.

This is where Gaussian Mixture Models become useful.

GMM uses probability distributions to model clusters and estimates the probability that each data point belongs to each cluster.

This is called soft clustering.

# 2. First understand Gaussian Distribution

Before understanding GMM, we need to understand what a Gaussian distribution is.

A Gaussian distribution is also known as a Normal Distribution.

It is a continuous probability distribution with a characteristic bell-shaped curve.

[The Bell Curve for Humans: Normal Distribution & Central Limit Theorem Explained | by Kalle Georgiev | Data Science Collective | Medium](https://images.openai.com/static-rsc-4/JMxRFAmfvkcoALwdc72XIZfyTWXhAcM8L4NmcBDH7eQ9HnkZAdln-WRnYXCvzk7c0E3dUIblkzps28JmxdMGghq79NjfB0kCnl65PQuB8x9Jwni1JPUMZE_N-X4X6P3GFNbTJRLN1Qy5xGTDQdXkpH3_c1DC8YM3YzjHvcsGdwM?purpose=inline)

Consider the heights of students in a school.

Suppose the average height is 160 cm.

You may observe:

- Many students have heights around 160 cm.
- Some students are shorter.
- Some students are taller.
- Very few students have extremely low or high heights.

The distribution of these heights might approximately follow a Gaussian distribution.

A Gaussian distribution is primarily described by two parameters.

## 2.1 Mean (\\(\mu\\))

Mean represents the centre of the distribution.

For example:

\\[ \mu=160 \\]

This means the distribution is centred around 160 cm.

Changing the mean shifts the centre of the curve.

[Lecture 4 — Uses of the Normal Distribution | High School Statistics Textbook](https://images.openai.com/static-rsc-4/jSZSEfC5OVp2b0-PPQAo6POydmBw2ZceAgso4wC7kuBvB8oOoBSEcN3XAY3KiThfru0PUCDzZ8ErWRDyAbDvYfjH715L5X8a3hkDizLpDoSnw0K6IejP4dds0NzrM-c8i4yKmYbHRHw5cv0G7Cs83Lty-rKcIRSfZdUCIWmF0BE?purpose=inline)

## 2.2 Variance (\\(\sigma^2\\))

Variance represents how spread out the values are around the mean.

For example:

- Distribution A: Variance = 10.
- Distribution B: Variance = 100.

Distribution B has a greater spread.

[Variance vs. Standard Deviation | MetricGate](https://images.openai.com/static-rsc-4/3yMABYRvnFmH7q_HboxJaJMEKEwridpTslsloHrxwgfNXnWbF1jRVlnpSFK41Von_FaFf47Zbbzh6yPNvVk2OCUDSpTUuX1TKmUPz_mowHAFDQxjGeyrYXeRGt8QPQ2xiSbyjA8Cv0Uef_4W3R_XdFxLUT4pqhi06dx2e-T72ss?purpose=inline)

Remember:

| Parameter                         | Meaning                 |
| --------------------------------- | ----------------------- |
| Mean (\\(\mu\\))                  | Centre of distribution  |
| Variance (\\(\sigma^2\\))         | Spread of distribution  |
| Standard deviation (\\(\sigma\\)) | Square root of variance |

Important: Variance is measured in squared units, whereas standard deviation is measured in the original units.

## 2.3 Gaussian distribution formula

For a one-dimensional Gaussian distribution:

\\[ \mathcal{N}(x\mid\mu,\sigma^2) = \frac{1}{\sqrt{2\pi\sigma^2}} e^{-\frac{(x-\mu)^2}{2\sigma^2}} \\]

Don't worry about memorizing this formula immediately.

Understand its components:

- \\(x\\): Observed value.
- \\(\mu\\): Mean.
- \\(\sigma^2\\): Variance.
- \\(e\\): Exponential function.

The formula gives the probability density at a particular value of \\(x\\).

A technical distinction: for a continuous distribution, the density at a point is not itself the probability of observing exactly that point. Probabilities are calculated over intervals or regions.

# 3. From Gaussian Distribution to Gaussian Mixture Model

Now let's connect Gaussian distributions to clustering.

Suppose our customer dataset contains three natural groups.

We can imagine that each group is generated by its own Gaussian distribution.

[Clustering and Mixture Models — Applied Machine Learning in Python](https://images.openai.com/static-rsc-4/CVDzLj7yIuVsw2DM_4S3fXhos1J0FU9JB6lPN49kgvyJzagTys7IhRVqcN9vtoHFldMPkIa0gavbvTFIt26pKzalaTRc0GdineVXlUQnDlwH-_YuoOjba5wXmy8x8CLSvPugteEoJ_t1vOZv5ldtj6v13FD761g2YVPDBZV3BMw?purpose=inline)

Think of it this way:

- Gaussian 1 represents one customer group.
- Gaussian 2 represents another customer group.
- Gaussian 3 represents another customer group.

The complete dataset is modelled as a combination of these distributions.

This is called a Gaussian Mixture Model.

Let's break down the name:

| Word     | Meaning                                                    |
| -------- | ---------------------------------------------------------- |
| Gaussian | Normal probability distribution                            |
| Mixture  | Combination of multiple distributions                      |
| Model    | Mathematical representation of the data-generating process |

### Formal definition

A Gaussian Mixture Model is a probabilistic model that represents a dataset as a weighted combination of multiple Gaussian distributions.

Each Gaussian distribution represents one component of the mixture.

GMM assumes that the observed data can be modelled as having been generated by one of these Gaussian components.

The actual component responsible for generating an observation is unknown. GMM estimates the component parameters and membership probabilities.

## 3.1 Three important parameters of every Gaussian component

Each component has three important parameters:

1. Mean (\\(\mu_k\\))
2. Covariance matrix (\\(\Sigma_k\\))
3. Mixing coefficient (\\(\pi_k\\))

Let's understand each.

Mean (\\(\mu_k\\))

Represents the centre of Gaussian component \\(k\\).

Covariance matrix (\\(\Sigma_k\\))

Represents the spread and relationships between features.

We will study covariance in detail later.

Mixing coefficient (\\(\pi_k\\))

Represents the proportion or prior weight of the dataset associated with component \\(k\\).

For example:

| Component  | Mixing coefficient |
| ---------- | ------------------ |
| Gaussian 1 | 0.30               |
| Gaussian 2 | 0.50               |
| Gaussian 3 | 0.20               |
| Total      | 1.00               |

This means the model estimates that the mixture contains:

- 30% weight from Gaussian 1.
- 50% weight from Gaussian 2.
- 20% weight from Gaussian 3.

The constraints are:

\\[ \pi_k\geq 0 \\]

\\[ \sum\_{k=1}^{K}\pi_k=1 \\]

Here, \\(K\\) represents the number of Gaussian components.

Important: A mixing coefficient is a component's prior mixture weight. It is not the same as an individual data point's membership probability.

# 4. How does GMM perform clustering?

This is the most important intuition behind GMM.

Suppose we have three Gaussian components:

- Gaussian A
- Gaussian B
- Gaussian C

Now consider a new customer.

GMM calculates the probability that this customer belongs to each component, based on the fitted distributions and their mixing weights.

Imagine the result is:

Customer X — Component membership

Gaussian A

## 10%

Gaussian B

## 75%

Gaussian C

## 15%

Total\
100%

What does this mean?

- 10% probability of belonging to Gaussian A.
- 75% probability of belonging to Gaussian B.
- 15% probability of belonging to Gaussian C.

Gaussian B has the highest probability.

Therefore, if we want a single cluster label, we assign this customer to Gaussian B.

But we also retain the information that the customer has some probability of belonging to A and C.

This is called Soft Clustering.

## 4.1 Hard clustering vs soft clustering

| K-Means                                         | GMM                                         |
| ----------------------------------------------- | ------------------------------------------- |
| Hard clustering                                 | Soft clustering                             |
| Assigns one cluster to each point               | Estimates probability for every component   |
| Example: Cluster B                              | Example: A = 10%, B = 75%, C = 15%          |
| Doesn't directly provide membership uncertainty | Provides model-based membership uncertainty |

Remember this distinction:

K-Means says:

> Which cluster should this data point belong to?

GMM says:

> How likely is this data point to belong to each Gaussian component?

One important nuance: these probabilities are based on the fitted model. They are not automatically calibrated real-world probabilities or objective measures of similarity.

# 5. Mathematical formulation of GMM

Now let's understand the mathematical foundation.

Suppose we have \\(K\\) Gaussian components.

GMM represents the overall probability density as:

\\[ \boxed{ p(x)= \sum\_{k=1}^{K} \pi_k\mathcal{N}(x\mid\mu_k,\Sigma_k) } \\]

This is the central equation of GMM.

Let's decode it.

| Symbol            | Meaning                                 |
| ----------------- | --------------------------------------- |
| \\(p(x)\\)        | Overall probability density             |
| \\(K\\)           | Number of Gaussian components           |
| \\(\pi_k\\)       | Mixing coefficient of component \\(k\\) |
| \\(\mu_k\\)       | Mean of component \\(k\\)               |
| \\(\Sigma_k\\)    | Covariance matrix of component \\(k\\)  |
| \\(\mathcal{N}\\) | Gaussian probability density function   |
| \\(x\\)           | Observed data point                     |

### What is this equation actually saying?

Suppose we have three Gaussian components.

Then:

\\[ p(x)= \pi_1\mathcal{N}(x\mid\mu_1,\Sigma_1) + \pi_2\mathcal{N}(x\mid\mu_2,\Sigma_2) + \pi_3\mathcal{N}(x\mid\mu_3,\Sigma_3) \\]

In simple words:

The overall probability density of a data point is the weighted sum of the density contributions from all Gaussian components.

Each component contributes according to its mixing coefficient.

This is why GMM is called a mixture model.

# 6. How does GMM learn? Expectation-Maximization (EM)

Now comes the most important part of GMM: how does it learn the Gaussian distributions?

We have a dataset, but we don't know:

- Which Gaussian generated each data point.
- Where each Gaussian should be centred.
- How spread out each Gaussian should be.
- What proportion of the dataset each Gaussian represents.

These are unknown parameters.

We need an algorithm to estimate them.

GMM commonly uses Expectation-Maximization (EM).

EM is an iterative optimization algorithm used to estimate parameters when a model contains hidden or latent variables.

In GMM, the hidden variable is the Gaussian component responsible for generating each observation.

## 6.1 Understand the overall EM process

## Expectation-Maximization algorithm

Step 1 — Initialization

Initialize means, covariance matrices and mixing coefficients.

Step 2 — E-Step (Expectation)

Estimate the probability that each Gaussian component generated each data point.

Step 3 — M-Step (Maximization)

Update means, covariance matrices and mixing coefficients using the estimated probabilities.

Step 4 — Convergence check

Check whether the improvement in log-likelihood is sufficiently small. If not, repeat E-Step and M-Step.

Let's understand each step carefully.

## 6.2 Initialization

Before EM starts, we need initial estimates of:

- Mean (\\(\mu_k\\))
- Covariance (\\(\Sigma_k\\))
- Mixing coefficient (\\(\pi_k\\))

A common approach is to use K-Means to initialize the Gaussian means.

Why?

Because K-Means can provide an initial estimate of where the clusters might be located.

However, K-Means initialization is not mandatory. Other initialization strategies are available.

Poor initialization can lead to poor local solutions, so implementations often run EM multiple times with different initializations.

## 6.3 E-Step — Expectation

The E-Step calculates the responsibility of each Gaussian component for every data point.

What is responsibility?

Responsibility represents the posterior probability that a particular Gaussian component generated a particular data point.

Let's understand with an example.

Suppose we have one customer and three Gaussian components.

We want to estimate:

- Probability that Gaussian 1 generated this customer.
- Probability that Gaussian 2 generated this customer.
- Probability that Gaussian 3 generated this customer.

GMM uses Bayes' theorem to calculate these probabilities.

The responsibility formula is:

\\[ \boxed{ \gamma\_{ik}= \frac{ \pi_k\mathcal{N}(x_i\mid\mu_k,\Sigma_k) }{ \sum\_{j=1}^{K} \pi_j\mathcal{N}(x_i\mid\mu_j,\Sigma_j) } } \\]

Let's understand the symbols:

| Symbol             | Meaning                                               |
| ------------------ | ----------------------------------------------------- |
| \\(\gamma\_{ik}\\) | Responsibility of component \\(k\\) for point \\(i\\) |
| \\(x_i\\)          | The \\(i\\)-th data point                             |
| \\(\pi_k\\)        | Mixing coefficient                                    |
| \\(\mu_k\\)        | Mean of component \\(k\\)                             |
| \\(\Sigma_k\\)     | Covariance of component \\(k\\)                       |
| \\(K\\)            | Number of components                                  |

The numerator represents the weighted density contribution from component \\(k\\).

The denominator represents the total mixture density at that point.

Therefore, the result is the posterior probability for component \\(k\\).

Important: For each data point, responsibilities across all components sum to 1.

\\[ \sum\_{k=1}^{K}\gamma\_{ik}=1 \\]

### E-Step example

Suppose the calculated responsibilities are:

| Data point | Gaussian 1 | Gaussian 2 | Gaussian 3 |
| ---------- | ---------- | ---------- | ---------- |
| P1         | 0.80       | 0.15       | 0.05       |
| P2         | 0.10       | 0.70       | 0.20       |
| P3         | 0.05       | 0.15       | 0.80       |

Notice that each row sums to 1.

These are the soft assignments calculated during the E-Step.

In simple Hinglish:

E-Step mein hum estimate karte hain ki har data point ko generate karne mein kaunsa Gaussian component kitna responsible hai.

## 6.4 M-Step — Maximization

Now we have responsibilities.

What do we do with them?

We use these probabilities to update the Gaussian parameters.

There are three parameters to update:

1. Mean.
2. Covariance matrix.
3. Mixing coefficient.

This is called the M-Step.

### First: Calculate effective membership

\\[ N_k=\sum\_{i=1}^{N}\gamma\_{ik} \\]

Here:

- \\(N\\) = Total number of data points.
- \\(K\\) = Number of Gaussian components.
- \\(N_k\\) = Effective number of points assigned to component \\(k\\).

Why do we call it effective membership?

Because we are not counting only points that belong completely to a cluster.

We are adding their membership probabilities.

For example:

| Data point | Responsibility for Gaussian 1 |
| ---------- | ----------------------------- |
| P1         | 0.80                          |
| P2         | 0.10                          |
| P3         | 0.05                          |
| P4         | 0.75                          |

Then:

\\[ N_1=0.80+0.10+0.05+0.75 \\]

\\[ N_1=1.70 \\]

So the effective membership of Gaussian 1 is 1.70.

### Second: Update the mean

\\[ \boxed{ \mu_k^{new}= \frac{1}{N_k} \sum\_{i=1}^{N}\gamma\_{ik}x_i } \\]

What is happening?

We calculate a weighted average of all data points.

Points with higher responsibility have more influence on the new mean.

For example:

- A point with responsibility 0.90 has a strong influence.
- A point with responsibility 0.10 has a weaker influence.

This gives us the updated centre of the Gaussian component.

### Third: Update the covariance matrix

\\[ \boxed{ \Sigma_k^{new}= \frac{1}{N_k} \sum\_{i=1}^{N} \gamma\_{ik} (x_i-\mu_k^{new}) (x_i-\mu_k^{new})^T } \\]

This calculates the weighted covariance of the data around the updated mean.

In simple words:

It estimates how spread out the data points are around the new centre and how the features vary together.

### Fourth: Update the mixing coefficient

\\[ \boxed{ \pi_k^{new}=\frac{N_k}{N} } \\]

This estimates the proportion of the dataset represented by the component.

For example, suppose:

- Total data points = 100.
- Effective membership of Gaussian 1 = 30.

Then:

\\[ \pi_1=\frac{30}{100}=0.30 \\]

The updated mixing coefficient is 0.30.

## 6.5 Convergence check

After the M-Step, we have updated:

- Mean.
- Covariance.
- Mixing coefficient.

Now we calculate the model's observed-data log-likelihood.

\\[ \ell(\theta)= \sum\_{i=1}^{N} \log \left[ \sum\_{k=1}^{K} \pi_k\mathcal{N}(x_i\mid\mu_k,\Sigma_k) \right] \\]

This measures how well the fitted mixture model explains the observed data in terms of likelihood.

EM repeats E-Step and M-Step until the improvement becomes sufficiently small or the maximum number of iterations is reached.

Important interview point

EM generally increases or maintains the observed-data log-likelihood at each iteration under standard EM assumptions. However, it does not guarantee finding the global maximum.

It may converge to a local optimum or stationary point, depending on initialization.

### EM in simple Hinglish

- Initialization: Gaussian distributions ke initial parameters set karo.
- E-Step: Har point ke liye calculate karo ki kaunsa Gaussian kitna responsible hai.
- M-Step: In probabilities ka use karke Gaussian ke mean, covariance aur weight update karo.
- Repeat: Jab tak model sufficiently converge na kar jaye.

This is the learning process of GMM.

# 7. Covariance matrix: Why is it important in GMM?

This is a particularly important topic because it explains why GMM can model different cluster shapes.

First, remember:

- Mean determines the centre.
- Covariance determines the spread and relationship between features.

Suppose our dataset contains two features:

- Annual spending.
- Number of purchases.

The covariance matrix is:

\\[ \Sigma= \begin{bmatrix} \sigma_1^2 & \sigma\_{12}\\\ \sigma\_{12} & \sigma_2^2 \end{bmatrix} \\]

Here:

- \\(\sigma_1^2\\): Variance of feature 1.
- \\(\sigma_2^2\\): Variance of feature 2.
- \\(\sigma\_{12}\\): Covariance between feature 1 and feature 2.

Covariance helps describe whether two features tend to increase or decrease together.

For example:

- Positive covariance: Features tend to increase together.
- Negative covariance: One tends to increase as the other decreases.
- Zero covariance: No linear covariance between them.

A covariance matrix is symmetric and positive semidefinite. In a non-degenerate multivariate Gaussian density, it must be positive definite.

## 7.1 How covariance affects cluster shape

A Gaussian distribution in two dimensions can form elliptical contours.

The covariance matrix controls:

- Width.
- Height.
- Orientation.
- Correlation between features.

[GMM Appendix B: Covariance Matrix Structure in Multivariate Gaussians – Tools for Data Science](https://images.openai.com/static-rsc-4/akqaKzDsuPdYKmard3CZnMqZzmpKDgfgbYQtD2YgQ55K2WTlO0ZZl_zgcUfNnWLyxwCF_nhPC5m0Puzb0J9kks-9zq_Np8Y-0wNxy_OIlTahZ-h79My6Ut4KQBVGRN7goEFhw_0_FrfinSbjJ4rwxoVKoCbm8B27UdrVz1UtVX0?purpose=inline)

This gives GMM flexibility to model clusters that are not necessarily circular.

But this flexibility depends on the selected covariance structure.

# 8. Four covariance types in Scikit-learn

Scikit-learn provides four covariance types for GMM.

These are:

- `full`
- `tied`
- `diag`
- `spherical`

Let's understand them.

## 8.1 Full covariance

```
covariance_type="full"
```

Each Gaussian component has its own full covariance matrix.

It can model:

- Different cluster sizes.
- Different cluster shapes.
- Different orientations.
- Correlation between features.

[What is a Gaussian Mixture Model (GMM) – 3D Point Cloud Classification Primer](https://images.openai.com/static-rsc-4/ECBoEB314CHmo4vr2rTbopT96HkMod-bDiHYFZ-5b3yJr1xE41EY0J_EnTXuACSWuaIXrE8dgoLkz18xX9WuWVOc0aeIwHe8L8BQR3-D3u6Rqaz9-g82sFK3_9BJ9TaPnKx7SBkhucJ_C58GYmodBZXfPfi0YcVePoe4wmf-bpA?purpose=inline)

This is the most flexible covariance option.

However, it requires estimating more parameters and may overfit when data is limited relative to the number of features.

## 8.2 Diagonal covariance

```
covariance_type="diag"
```

Each component has its own diagonal covariance matrix.

The off-diagonal covariance terms are zero.

This means the model assumes zero covariance between features within each Gaussian component.

It can model axis-aligned elliptical clusters, but not rotated elliptical contours.

[GMM Appendix B: Covariance Matrix Structure in Multivariate Gaussians – Tools for Data Science](https://images.openai.com/static-rsc-4/1wk9QF5a5robKH39F7339G4P4BMscGCIQ7v1ijkA1V2OsgstJYPj6VjGJ5t0PdDGVcMYSVwDAA703gQ2ptZdsWQYUdehd6PdSIu0J-9FRa7U2rpy_A1v55zqH3mriUJSrVBezo9YRM5BajYh3X9izEF7B4moTIa5SwMOBm-hvW0?purpose=inline)

## 8.3 Spherical covariance

```
covariance_type="spherical"
```

Each component has one variance value shared across all feature dimensions.

For two-dimensional data, this creates circular contours.

For higher dimensions, these become hyperspheres.

[Google Colab](https://images.openai.com/static-rsc-4/SvR228FOcHUw9wDfBMmnf8Yn4UyCwMMshmNcEPDp8Mtb5g1weSjxIhtjl84OitzqJ2DGo2LOB0WwLrvCdRHXC9vyMBF7vEd-MqLncLF8wl8rWWuLchyvpsHY0JC_90TLpKovCp2JATHpAFxKQXKc9kus9tC3-g-gfyVauieaME4?purpose=inline)

This is a more restrictive model.

It is often easier to estimate than full covariance.

## 8.4 Tied covariance

```
covariance_type="tied"
```

All Gaussian components share the same full covariance matrix.

Their centres can differ, but they share the same covariance structure.

[GMM Appendix B: Covariance Matrix Structure in Multivariate Gaussians – Tools for Data Science](https://images.openai.com/static-rsc-4/mVG699OG2afs6f-FDUkLSPsnQMMhrhXRTcCo6KocAzN5hrmhWt4id9H2Usbg6FNUTxPnkfZzNi0Dh7Z-SvD12aWfjrZYCTO-sBnhekUHgsFizvEfPXGJynS1jY0Kz6jle1h5bazf5vKJdyvs_D7nJ_wVSq-aF3OKzrWumTn-NcI?purpose=inline)

### Comparison

| Type        | Covariance structure                       | Geometry                   |
| ----------- | ------------------------------------------ | -------------------------- |
| `full`      | Each component has its own full matrix     | General ellipses           |
| `tied`      | One shared full matrix                     | Same shape and orientation |
| `diag`      | Each component has its own diagonal matrix | Axis-aligned ellipses      |
| `spherical` | One scalar variance per component          | Circles / hyperspheres     |

### How many covariance parameters?

Let:

- \\(K\\) = Number of components.
- \\(d\\) = Number of features.

| Type      | Number of covariance parameters |
| --------- | ------------------------------- |
| Full      | \\(K \cdot d(d+1)/2\\)          |
| Tied      | \\(d(d+1)/2\\)                  |
| Diag      | \\(K \cdot d\\)                 |
| Spherical | \\(K\\)                         |

This is useful because full covariance becomes increasingly expensive as the number of features increases.

# 9. GMM vs K-Means

Let's compare these two algorithms carefully.

| Feature             | K-Means                                                             | GMM                                                  |
| ------------------- | ------------------------------------------------------------------- | ---------------------------------------------------- |
| Learning type       | Unsupervised                                                        | Unsupervised                                         |
| Clustering          | Hard                                                                | Soft                                                 |
| Main representation | Centroids                                                           | Gaussian distributions                               |
| Assignment          | Nearest centroid                                                    | Posterior membership probabilities                   |
| Optimization        | Minimize within-cluster sum of squared distances                    | Maximize observed-data log-likelihood                |
| Cluster geometry    | Voronoi-based partitions; favours compact, roughly spherical groups | Can model elliptical groups with suitable covariance |
| Algorithm           | Lloyd's algorithm                                                   | Usually EM                                           |
| Output              | Labels and centroids                                                | Labels, probabilities and distribution parameters    |

## 9.1 Why can GMM model elliptical clusters?

K-Means uses distance to cluster centroids.

Its standard objective is:

\\[ J= \sum\_{i=1}^{N} \\|x_i-\mu\_{c_i}\\|^2 \\]

It tries to minimize the total squared distance between points and their assigned centroids.

GMM, on the other hand, models the probability density of each Gaussian component.

With full covariance, each component can have its own orientation and spread.

This allows GMM to model elongated or rotated clusters.

[From K-Means to GMM: Hard vs Soft Clustering - DEV Community](https://images.openai.com/static-rsc-4/QC0JA7F7zwVmpL9R6FbQ6eJHTraR6cQcRjRSbEmBmvWo2AvDMrBcCloP6wjt_KXu46dld-kekPYuf2v2jNu8XiQcAz6bzkFL8wRH7nKuUaxp-GdLnD3Bki4hy8iccVEhYOiHyGyAuC6iV-oygFOFXosJzdzrSHg_qFgB6B-T5qc?purpose=inline)

## 9.2 Relationship between K-Means and GMM

K-Means and GMM are closely related.

Under restrictive assumptions, GMM approaches K-Means-like behaviour:

- Equal spherical covariance across components.
- Covariance becomes very small.
- Posterior responsibilities become increasingly hard.

In this limiting situation, assignment approaches nearest-centroid assignment.

However, standard K-Means and GMM optimize different objectives:

- K-Means minimizes within-cluster squared distances.
- GMM maximizes mixture-model likelihood.

So we should not treat them as identical algorithms.

# 10. How to choose the number of Gaussian components?

GMM requires us to specify the number of components.

In Scikit-learn, this is controlled by:

```
n_components=3
```

But how do we decide whether we need 2, 3, 4 or 5 components?

Two commonly used model-selection criteria are:

1. AIC — Akaike Information Criterion.
2. BIC — Bayesian Information Criterion.

Both balance model fit against model complexity.

Generally, when comparing candidate models on the same dataset:

Lower AIC or BIC is preferred.

BIC penalizes additional model complexity more strongly than AIC.

These criteria are useful for selecting the number of components, but they do not guarantee the true number of real-world clusters.

### Example

Suppose we train GMM with different component counts.

| Components | AIC  | BIC  |
| ---------- | ---- | ---- |
| 1          | 1200 | 1220 |
| 2          | 950  | 990  |
| 3          | 870  | 930  |
| 4          | 890  | 970  |
| 5          | 920  | 1020 |

In this illustrative example:

- Lowest AIC = 870, with 3 components.
- Lowest BIC = 930, with 3 components.

Both criteria favour three components among the candidates.

# 11. Python implementation using Scikit-learn

Now let's implement GMM.

We will generate a sample dataset and train a Gaussian Mixture Model.

## 11.1 Basic implementation

```
from sklearn.datasets import make_blobsfrom sklearn.mixture import GaussianMixture# Generate sample datasetX, _ = make_blobs(    n_samples=300,    centers=3,    cluster_std=1.2,    random_state=42)# Create GMM modelgmm = GaussianMixture(    n_components=3,    covariance_type="full",    reg_covar=1e-6,    n_init=10,    random_state=42)# Train the modelgmm.fit(X)# Predict cluster labelslabels = gmm.predict(X)# Get membership probabilitiesprobabilities = gmm.predict_proba(X)print("Cluster Labels:")print(labels[:5])print("Membership Probabilities:")
```

Let's understand the important parameters.

| Parameter         | Meaning                                            |
| ----------------- | -------------------------------------------------- |
| `n_components`    | Number of Gaussian components                      |
| `covariance_type` | Covariance structure                               |
| `reg_covar`       | Regularization added to covariance diagonal        |
| `n_init`          | Number of initializations                          |
| `random_state`    | Controls random initialization for reproducibility |

Why did we use `n_init=10`?

Because GMM is sensitive to initialization.

Scikit-learn runs the EM algorithm multiple times with different initializations and retains the fitted solution with the highest training log-likelihood.

This improves the chance of finding a good solution, although it still does not guarantee the global optimum.

## 11.2 Important GMM methods

| Method             | Purpose                                   |
| ------------------ | ----------------------------------------- |
| `fit(X)`           | Learns the Gaussian mixture parameters    |
| `predict(X)`       | Returns the most likely component         |
| `predict_proba(X)` | Returns membership probabilities          |
| `score(X)`         | Returns average log-likelihood per sample |
| `score_samples(X)` | Returns log-density for each sample       |
| `aic(X)`           | Calculates AIC                            |
| `bic(X)`           | Calculates BIC                            |
| `sample(n)`        | Generates synthetic samples               |

Notice the difference:

```
labels = gmm.predict(X)
```

Returns the most likely component for every point.

Whereas:

```
probabilities = gmm.predict_proba(X)
```

Returns the probability of each component for every point.

For example:

```
[0.10, 0.75, 0.15]
```

This means the second component has the highest membership probability.

# 12. Selecting the number of components using AIC and BIC

Let's compare models with different numbers of components.

```
from sklearn.mixture import GaussianMixturefor k in range(1, 7):    model = GaussianMixture(        n_components=k,        covariance_type="full",        n_init=10,        random_state=42    )    model.fit(X)    print(        f"K={k} | "        f"AIC={model.aic(X):.2f} | "        f"BIC={model.bic(X):.2f}"    )
```

The model with the lower AIC or BIC is generally preferred within the candidate set.

A practical consideration: compare models using the same data and consistent preprocessing. Also consider whether the selected model is meaningful for the actual application.

# 13. GMM beyond clustering

This is an important concept that makes GMM more interesting.

GMM is not just a clustering algorithm.

It is also a generative probabilistic model.

Why?

Because it estimates a probability distribution that describes how the observed data could have been generated.

This gives us several additional applications.

## 13.1 Density estimation

GMM estimates the probability density of data points.

For a new observation, it can calculate how well that observation fits the learned distribution.

Scikit-learn provides:

```
log_density = gmm.score_samples(X)
```

This returns the log probability density for each sample.

## 13.2 Anomaly detection

Imagine you train GMM on normal customer behaviour.

Now a new customer appears with extremely unusual spending and purchase frequency.

The model may assign this observation a very low density.

Such observations can be investigated as potential anomalies.

Typical process:

1. Train GMM on representative normal data.
2. Calculate log-density for new observations.
3. Choose an appropriate threshold.
4. Flag observations below the threshold for further investigation.

Important: A low-density observation is not automatically fraudulent or abnormal. The threshold must be selected and validated for the application.

## 13.3 Synthetic data generation

GMM can also generate new synthetic samples.

```
samples, component_labels = gmm.sample(10)print(samples)print(component_labels)
```

What happens internally?

1. Select a Gaussian component according to its mixing coefficient.
2. Sample a data point from that Gaussian distribution.
3. Repeat for the required number of samples.

This is why GMM is called a generative model.

# 14. Limitations of GMM

Although GMM is powerful, it has some limitations.

## 14.1 Requires the number of components

We generally need to specify `n_components` before fitting.

AIC and BIC can help select it, but choosing the right number is not always straightforward.

## 14.2 Sensitive to initialization

Different initial parameters can lead EM to different local solutions.

Using multiple initializations can help.

## 14.3 Gaussian assumption

GMM assumes the data can be represented reasonably well by a mixture of Gaussian distributions.

If the actual structure is very different, GMM may not model it effectively.

## 14.4 Outlier sensitivity

Extreme observations can influence estimated means and covariance matrices.

GMM is not inherently robust to outliers.

## 14.5 Covariance singularity

This is an important numerical issue.

Imagine a Gaussian component collapses around a single observation.

Its covariance matrix approaches zero.

The Gaussian density can become extremely large, potentially making the unconstrained mixture likelihood unbounded.

This is called covariance singularity or covariance collapse.

Scikit-learn provides regularization through:

```
reg_covar=1e-6
```

It adds a small positive value to the covariance diagonal to help prevent singular or near-singular covariance estimates.

## 14.6 High-dimensional data

Full covariance matrices require many parameters.

For each component, the covariance matrix contains:

\\[ \frac{d(d+1)}{2} \\]

independent parameters, where \\(d\\) is the number of features.

As the number of features increases, estimating covariance becomes more difficult and requires more data.

## 14.7 Computational cost

GMM's computational cost depends on:

- Number of samples.
- Number of features.
- Number of components.
- Covariance type.
- Number of EM iterations.
- Number of initializations.

Full covariance is generally more expensive than diagonal or spherical covariance.

# 15. When should we use GMM?

GMM can be a good choice when:

- You expect overlapping clusters.
- You want probabilistic membership rather than only hard labels.
- Clusters have different sizes and orientations.
- You want to estimate the density of the data.
- You want to perform model-based anomaly detection.
- You want to generate samples from a fitted mixture distribution.

K-Means may be a better practical choice when:

- You need a simpler and faster clustering baseline.
- Your clusters are reasonably compact and separated.
- You have a large dataset and need efficient clustering.
- You do not need membership probabilities.

Neither algorithm is universally better. The choice depends on the data and the problem.

# 16. Interview questions and answers

Q1. What is Gaussian Mixture Model?

GMM is a probabilistic model that represents data as a weighted combination of multiple Gaussian distributions. It uses the Expectation-Maximization algorithm to estimate the parameters of these distributions and performs soft clustering.

Q2. Why is GMM called a soft clustering algorithm?

Because it calculates the posterior probability of every data point belonging to each Gaussian component rather than assigning it exclusively to one cluster during probability estimation.

Q3. What is the difference between mean and covariance in GMM?

Mean represents the centre of a Gaussian component, while covariance represents its spread and relationships between features.

Q4. What is a responsibility in GMM?

Responsibility is the posterior probability that a particular Gaussian component generated a particular data point.

Q5. What is the role of EM in GMM?

EM estimates GMM parameters iteratively. The E-Step calculates responsibilities, and the M-Step updates means, covariance matrices and mixing coefficients.

Q6. Does EM guarantee a global optimum?

No. EM generally improves the observed-data log-likelihood at each iteration but may converge to a local optimum or stationary point.

Q7. What is the difference between `predict()` and `predict_proba()`?

- `predict()` returns the most likely component label.
- `predict_proba()` returns membership probabilities for all components.

Q8. What are the four covariance types in Scikit-learn?

`full`, `tied`, `diag` and `spherical`.

Q9. What is covariance singularity?

It occurs when a Gaussian component's covariance becomes singular or approaches zero, potentially causing numerical instability and an unbounded likelihood. Regularization helps prevent this.

Q10. Can GMM be used for anomaly detection?

Yes. It can estimate the density of observations. Very low-density observations may be flagged as potential anomalies using an appropriate threshold.

Q11. How do you choose the number of Gaussian components?

AIC, BIC, domain knowledge and validation can help select a suitable number of components.

Q12. Is GMM always better than K-Means?

No. GMM is more flexible and provides probabilities, but it is also more computationally demanding and requires estimating additional parameters.

# 17. Quick revision sheet

# GMM — Remember these concepts

1\. Definition

Probabilistic model representing data using a weighted mixture of Gaussian distributions.

2\. Three component parameters

- Mean (\\(\mu\\)): Centre.
- Covariance (\\(\Sigma\\)): Spread and feature relationships.
- Mixing coefficient (\\(\pi\\)): Component's prior weight.

3\. Clustering type

Soft clustering — membership probabilities for every component.

4\. Learning algorithm

Expectation-Maximization (EM).

- E-Step: Calculate responsibilities.
- M-Step: Update Gaussian parameters.

5\. Covariance types

- Full: General ellipses.
- Tied: Shared full covariance.
- Diag: Axis-aligned ellipses.
- Spherical: Circles / hyperspheres.

6\. Model selection

AIC and BIC — generally prefer lower values among candidate models.

7\. Applications

Clustering, density estimation, anomaly detection and synthetic data generation.

8\. Limitations

Local optima, initialization sensitivity, covariance singularity, outliers and high-dimensional data.

# 18. Test your understanding

Try answering these questions without looking at the notes.

GMM knowledge check

0/7 answered

Q1. What are the three parameters of each Gaussian component?

Mean, covariance and mixing coefficient

Mean, median and mode

Centroid, distance and variance

Q2. What does the E-Step calculate?

Updated Gaussian means

Responsibilities for each component

The optimal number of clusters

Q3. What happens in the M-Step?

The model updates its Gaussian parameters

The model removes all overlapping points

The model changes the dataset labels

Q4. Which covariance type allows each component to have its own general covariance matrix?

Spherical

Diagonal

Full

Q5. Which method returns membership probabilities in Scikit-learn?

fit()

predict()

predict_proba()

Q6. What does a low score from score_samples() indicate?

Potentially low density under the fitted model

Definitely a fraudulent observation

The point belongs to every cluster equally

Q7. Does EM guarantee the global maximum likelihood solution?

Yes, always

No, it may converge to a local optimum

Only when K=2

Submit answers

# 19. Ultimate goal in ML — understand the bigger picture

Let's finish with the most important conceptual takeaway.

Imagine you have a dataset with 10,000 customer records and no labels.

You want to discover the underlying customer groups.

- K-Means tries to find cluster centres and assign each customer to the nearest centre.
- GMM assumes the data can be represented by a mixture of Gaussian distributions and estimates the probability that each customer belongs to each component.

GMM learns the parameters of these distributions using EM.

This gives you more than cluster labels: you also get membership probabilities and a model of the data density.

The central idea to remember:

> GMM does not simply divide data into clusters. It models how the data may have been generated using multiple Gaussian distributions and uses probability to understand the membership of each observation.

My recommendation for your next learning step: implement GMM on a two-dimensional dataset, visualize its Gaussian contours, and compare its probability assignments with K-Means labels. That practical exercise will connect almost all the concepts in this chapter.
