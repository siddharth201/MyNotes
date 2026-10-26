[Chat-GPT Link](https://chatgpt.com/s/t_6adf41fca5c88191ada218fd155f6504)

## What is Unsupervised Learning?

Unsupervised Learning is a type of Machine Learning in which a model learns patterns, structures, or groups from data without being given predefined target labels.

Simple words mein: Hum model ko data dete hain, lekin pehle se nahi batate ki har data point ka correct answer ya category kya hai. Model data ke andar existing patterns aur relationships discover karne ki koshish karta hai.

## 1. Real-world example

Imagine karo ek shopping mall ke paas 1,000 customers ka data hai.

| Customer | Monthly spending | Purchases/month |
| -------- | ---------------- | --------------- |
| A        | ₹1,000           | 2               |
| B        | ₹1,200           | 3               |
| C        | ₹15,000          | 12              |
| D        | ₹18,000          | 15              |

Humne customers ko koi category assign nahi ki hai.

Unsupervised Learning algorithm data analyze karke discover kar sakta hai ki:

Group 1

Customers A and B — relatively low spending and fewer purchases.

Group 2

Customers C and D — relatively high spending and more purchases.

Algorithm ko humne ye groups pehle se nahi bataye. Usne spending aur purchase frequency ke patterns ke basis par groups discover kiye.

This is an example of Clustering, an unsupervised learning task.

## 2. Supervised vs. Unsupervised Learning

| Supervised Learning                           | Unsupervised Learning                           |
| --------------------------------------------- | ----------------------------------------------- |
| Data ke saath known target labels hote hain   | Target labels generally nahi hote               |
| Model target predict karna seekhta hai        | Model patterns aur structure discover karta hai |
| Example: Email spam hai ya nahi predict karna | Example: Similar customers ke groups banana     |
| Classification, Regression                    | Clustering, Dimensionality Reduction            |

Ek important distinction: Unsupervised Learning mein data ke andar information hoti hai; bas target answers pehle se provide nahi kiye jaate.

## 3. Unsupervised Learning ke main tasks

**1\. Clustering**

<a href="https://github.com/siddharth201/MyNotes/blob/main/AI_ML/Modules/Module-5-UnsupervisedLearning/Misc/Images/clustering.jpeg" target="_blank">
  <img src="https://github.com/siddharth201/MyNotes/blob/main/AI_ML/Modules/Module-5-UnsupervisedLearning/Misc/Images/clustering.jpeg" width="250" alt="Click to enlarge">
</a>

Similar data points ko groups mein organize karna.

Example: K-Means, DBSCAN


**2\. Dimensionality Reduction**


<a href="https://github.com/siddharth201/MyNotes/blob/main/AI_ML/Modules/Module-5-UnsupervisedLearning/Misc/Images/DimensionalityReduction.jpeg" target="_blank">
  <img src="https://github.com/siddharth201/MyNotes/blob/main/AI_ML/Modules/Module-5-UnsupervisedLearning/Misc/Images/DimensionalityReduction.jpeg" width="250" alt="Click to enlarge">
</a>


Data ko fewer dimensions mein represent karna while preserving useful information as much as possible.

Example: PCA


**3\. Association Rule Learning**

<a href="https://github.com/siddharth201/MyNotes/blob/main/AI_ML/Modules/Module-5-UnsupervisedLearning/Misc/Images/AssociationRuleLearning.jpeg" target="_blank">
  <img src="https://github.com/siddharth201/MyNotes/blob/main/AI_ML/Modules/Module-5-UnsupervisedLearning/Misc/Images/AssociationRuleLearning.jpeg" width="250" alt="Click to enlarge">
</a>


Data mein items ya events ke beech recurring relationships discover karna.

Example: Market basket analysis

## 4. Ultimate Goal in ML — In Simple Terms

Supervised Learning mein hum poochte hain:

"Given this input, correct output kya hoga?"

Unsupervised Learning mein hum poochte hain:

"Is data ke andar kaun-se patterns, groups, ya relationships chhupe hue hain?"

Remember: Unsupervised Learning khud se har pattern ka real-world meaning nahi jaanta. Algorithm structure discover karta hai; us structure ko interpret aur validate karna humari responsibility hai.

Since we're starting with K-Means, humara pehla focus hoga Clustering: unlabeled data ko meaningful groups mein divide karna.
