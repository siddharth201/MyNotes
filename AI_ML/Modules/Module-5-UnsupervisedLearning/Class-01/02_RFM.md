
 RFM is a very common technique used in industry for Customer Segmentation, especially in e-commerce, banking, retail, subscription businesses and marketing.

RFM stands for:

- R – Recency: Customer ne last purchase kab kiya?
- F – Frequency: Customer ne kitni baar purchase kiya?
- M – Monetary: Customer ne kitna paisa spend kiya?

Iska main purpose hai customers ko unke purchasing behaviour ke basis par meaningful groups mein divide karna.

## 1. Let's understand with a real-world example

Imagine Amazon ke paas 1 lakh customers hain.

Kya Amazon sabhi customers ko same marketing email bhejega? Probably nahi.

Kuch customers regularly purchase karte hain, kuch recently inactive ho gaye hain, aur kuch bahut zyada spend karte hain.

Business ko ye samajhna hai ki:

- Kaunse customers loyal hain?
- Kaunse customers high-value customers hain?
- Kaunse customers purchase karna band kar rahe hain?
- Kin customers ko discount ya special offer dena chahiye?

RFM isi problem ko solve karne mein help karta hai.

## 2. RFM ke three dimensions

**R – Recency**

Customer ne last purchase kitne din pehle kiya?

Example: Last purchase 5 days ago.

Generally, fewer days means more recent and potentially more engaged.

**F – Frequency**

Customer ne given time period mein kitni purchases ki?

Example: Last 12 months mein 20 orders.

Higher frequency generally indicates repeat purchasing behaviour.

**M – Monetary**

Customer ne given time period mein kitna spend kiya?

Example: Last 12 months mein ₹50,000.

Higher monetary value means higher spending.

## 3. Let's calculate RFM for some customers

Suppose hum last 12 months ka customer transaction data analyse kar rahe hain.

Assume today's analysis date is 31 October 2026.

| Customer | Last purchase | Orders (12 months) | Total spend |
| -------- | ------------- | ------------------ | ----------- |
| A        | 5 days ago    | 20                 | ₹50,000     |
| B        | 180 days ago  | 3                  | ₹5,000      |
| C        | 10 days ago   | 2                  | ₹2,000      |
| D        | 90 days ago   | 15                 | ₹40,000     |

Ab in customers ka RFM:

| Customer | Recency (R) | Frequency (F) | Monetary (M) |
| -------- | ----------- | ------------- | ------------ |
| A        | 5 days      | 20            | ₹50,000      |
| B        | 180 days    | 3             | ₹5,000       |
| C        | 10 days     | 2             | ₹2,000       |
| D        | 90 days     | 15            | ₹40,000      |

Abhi ye raw RFM values hain. Inhe directly compare karne se pehle scoring kar sakte hain.

## 4. RFM Scoring (1–5)

Industry mein ek common approach hai har dimension ko 1 se 5 tak score dena.

For example, customers ko Recency ke basis par rank karte hain:

| Recency              | Score |
| -------------------- | ----- |
| Very recent purchase | 5     |
| Recent purchase      | 4     |
| Moderately recent    | 3     |
| Old purchase         | 2     |
| Very old purchase    | 1     |

Notice something important:

Recency mein fewer days = higher score.

Lekin Frequency aur Monetary mein generally:

- Higher frequency = higher score.
- Higher spending = higher score.

In scores ko combine karke RFM profile bana sakte hain.

Example:

Customer A

# 5

Recency

# 5

Frequency

# 5

Monetary

# RFM Score: 555

Potential Champions

Customer recently purchased, purchases frequently, and spends significantly.

Note: Ye scoring illustration hai. Actual score boundaries business ke data distribution ke according define hote hain. Quintiles (five equal-sized groups) ek common method hain.

## 5. RFM se customer segments kaise banate hain?

RFM scores ke basis par business different customer segments create kar sakta hai.

| Segment         | Typical RFM behaviour      | Business action           |
| --------------- | -------------------------- | ------------------------- |
| Champions       | High R, F, M               | Rewards, VIP benefits     |
| Loyal Customers | High R, F                  | Loyalty programs          |
| Big Spenders    | High M                     | Premium offers            |
| New Customers   | High R, low F              | Encourage second purchase |
| At Risk         | Low R, previously high F/M | Re-engagement campaigns   |
| Lost Customers  | Low R, low F/M             | Win-back campaigns        |

For example:

A customer previously purchased 15 times and spent ₹40,000, but hasn't purchased in the last 180 days.

Business might classify this customer as At Risk and send a personalised offer.

But remember, segmentation rules differ between businesses. A customer inactive for 30 days might be at risk for a grocery app, whereas that may be normal for a furniture business.

## 6. RFM and K-Means — What's the connection?

This is particularly important for your Unsupervised Learning module.

RFM itself is not necessarily a clustering algorithm. It is a feature engineering and customer analysis technique.

We can use RFM values as input features for K-Means.

Customer Transaction Data

Order dates, order counts, purchase amounts

Calculate RFM Features

Recency, Frequency, Monetary

Preprocessing

Handle skew, scale features, inspect outliers

K-Means Clustering

Choose K and group similar customers

Customer Segments

Champions, loyal, at-risk, low-value, etc.

For example, K-Means might discover four groups:

- Cluster 1: Recent, frequent, high spenders.
- Cluster 2: Recent, infrequent, low spenders.
- Cluster 3: Inactive, previously frequent customers.
- Cluster 4: Infrequent, low spenders.

We then interpret these clusters and assign business-friendly names.

Important preprocessing detail: Monetary values may be much larger numerically than Recency or Frequency. Without feature scaling, Monetary can dominate Euclidean distance. Log transformation may also help with highly skewed spending distributions.

## 7. RFM vs K-Means

| RFM segmentation                 | K-Means segmentation             |
| -------------------------------- | -------------------------------- |
| Can use predefined scoring rules | Learns groups from data          |
| Business-defined thresholds      | Requires choosing K              |
| Easy to explain                  | Needs cluster interpretation     |
| Can work without clustering      | Is itself a clustering algorithm |

You can even use RFM scoring without K-Means. Both approaches can complement each other.

## 🎯 Ultimate Goal in ML — Simple Terms

Imagine an e-commerce company has 10 lakh customers.

Instead of manually analysing every customer, we calculate three features:

- When did they last purchase?
- How frequently do they purchase?
- How much do they spend?

Then we use these features to understand customer behaviour and create meaningful segments.

This is how businesses turn raw transaction data into actionable customer insights.

### Quick understanding check

Suppose a customer has:

- Recency = 3 days
- Frequency = 25 orders
- Monetary = ₹75,000

What kind of customer would you expect this to be?

A. High-value / Potential Champion

B. Lost Customer

C. Low-engagement Customer

&#x20;Correct! Recent, frequent and high spending.
