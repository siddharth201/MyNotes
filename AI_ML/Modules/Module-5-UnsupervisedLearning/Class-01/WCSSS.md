
WCSS calculate karna K-Means ka ek important concept hai. Chalo apne previous example se step by step samajhte hain.

## 1. WCSS kya measure karta hai?

**WCSS (Within-Cluster Sum of Squares)** measure karta hai ki cluster ke data points apne centroid se kitne spread out hain.

- WCSS low → points generally apne centroids ke close hain.
- WCSS high → points generally apne centroids se zyada spread out hain.

## 2. Formula ko simple language mein samjho

`WCSS = sum of squared distances of every point from its assigned centroid`

Yaani:

1. Har point aur uske centroid ke beech distance nikalo.
2. Distance ka square karo.
3. Ek cluster ke sabhi squared distances add karo.
4. Sabhi clusters ke totals add kar do.

## 3. Numerical example

Suppose hamare paas 4 data points hain aur K = 2 hai.

| Point | Value | Assigned centroid |
| ----- | ----- | ----------------- |
| A     | 2     | 3                 |
| B     | 4     | 3                 |
| C     | 10    | 11                |
| D     | 12    | 11                |

Cluster 1 ke points hain `{2, 4}` aur centroid `3` hai.

Cluster 2 ke points hain `{10, 12}` aur centroid `11` hai.

### Step 1: Cluster 1 ka WCSS

Point A:

`(2 - 3)² = (-1)² = 1`

Point B:

`(4 - 3)² = (1)² = 1`

Cluster 1 WCSS = 1 + 1 = 2

### Step 2: Cluster 2 ka WCSS

Point C:

`(10 - 11)² = (-1)² = 1`

Point D:

`(12 - 11)² = (1)² = 1`

Cluster 2 WCSS = 1 + 1 = 2

### Step 3: Total WCSS

`Total WCSS = Cluster 1 WCSS + Cluster 2 WCSS`

`Total WCSS = 2 + 2 = 4`

Final answer

# WCSS = 4

## 4. Visual intuition

[8. Unsupervised Machine Learning: K-means Clustering — SCMA248 Introduction to Data Science](https://images.openai.com/static-rsc-4/qlfU-mWhd8iy85N-g99X0sj8ifXH1PcVllhkv9Eo4BF0o3Xz5JWHU-sYLUlJb8tUCFiRyFWcsh1rmxVXxe4gHsEzkq5mEr2PAur5x29TwHtUKLh0_CbWvPxTisZ-sMmsqENF9Lmg61pBdHtPI1oSUcnP_jpQX1cDLp191N3Kofw?purpose=inline)

[pairote-sat.github.io](https://pairote-sat.github.io/SCMA248/Chapter8_Unsupervised_Learning.html?utm_source=chatgpt.com)

Har point ka distance centroid se calculate hota hai. WCSS mein in distances ko square karke add kiya jata hai.

## 5. Elbow Method mein WCSS ka use kaise hota hai?

Same dataset par different K values ke liye K-Means run karte hain aur WCSS compare karte hain.

| K | WCSS (illustrative) |
| - | ------------------- |
| 1 | 100                 |
| 2 | 50                  |
| 3 | 20                  |
| 4 | 15                  |
| 5 | 12                  |

Yahan K = 1 se 3 tak WCSS mein substantial reduction hai. Uske baad improvement comparatively chhoti ho jaati hai. Isliye K = 3 ek possible elbow candidate ho sakta hai.

Ye numbers sirf illustration ke liye hain, kisi actual dataset ke results nahi.

Important: WCSS ko directly different K values ke beech minimize karna sahi nahi hai, kyunki K badhane par WCSS generally kam hota hai. Isi liye Elbow Method diminishing returns dekhta hai.

### Quick self-check

Agar ek point ka value `8` hai aur uske assigned centroid ka value `5` hai, toh us point ka WCSS mein contribution kitna hoga?

3

6

9

25

Correct! Distance = |8 − 5| = 3, and squared distance = 3² = 9.
