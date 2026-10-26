Distances ko samajhna K-Means ke liye bahut important hai, kyunki K-Means decide karta hai ki koi point kis cluster mein jayega, based on its distance from the centroids.

Hum teen distances samjhenge:

1. Euclidean Distance
2. Manhattan Distance
3. Cosine Similarity and Cosine Distance

Har ek ko visual, numerical example aur real-world intuition se samjhenge.

# 1. Euclidean Distance — Straight-line distance

Euclidean Distance ka matlab hai do points ke beech ki seedhi line ki distance.

Imagine karo tum ek park mein ho. Tumhari current position A hai aur tumhe point B tak jaana hai. Agar tum directly seedhi line mein ja sakte ho, toh jo shortest straight-line distance hogi, woh Euclidean Distance hai.

### Visualize it

<a href="https://github.com/siddharth201/MyNotes/blob/main/AI_ML/Modules/Module-5-UnsupervisedLearning/Misc/Images/euclidien.jpeg" target="_blank">
  <img src="https://github.com/siddharth201/MyNotes/blob/main/AI_ML/Modules/Module-5-UnsupervisedLearning/Misc/Images/euclidien.jpeg" width="250" alt="Click to enlarge">
</a>

Horizontal difference = 3 units; vertical difference = 4 units.

---

**Suppose do points hain:**  

$A=(1,2),\qquad B=(4,6)\$
  
**A se B tak:** 

• X-axis par difference: $4-1=3\$  
• Y-axis par difference: $6-2=4\$  

**Pythagoras theorem use karenge:**

$d_{E}(A,B)=\sqrt{(x_{2}-x_{1})^{2}+(y_{2}-y_{1})^{2}}$  

**Values put karo:**  

$d_{E}(A,B)=\sqrt{3^{2}+4^{2}}$  

$=\sqrt{9+16}$  

$=\sqrt{25}$  

$=\boxed{5}$  

Isliye Euclidean Distance 5 units hai.


### General formula for multiple features

Agar har point mein $d$ features hain, toh:

$$\
d_E(x,y)=\sqrt^(x_j-y_j)^2}\
$$

Matlab har feature ka difference lo, uska square karo, sabko add karo aur square root le lo.

### K-Means mein iska use

Maan lo ek customer point do centroids ke beech mein hai:

- Centroid A se distance = 3
- Centroid B se distance = 8

Standard K-Means mein woh point Centroid A wale cluster mein assign hoga, kyunki A nearest hai.

Ek technical detail: squared Euclidean distance use karke bhi nearest centroid wahi milega, kyunki square root distance ki ordering change nahi karta.

# 2. Manhattan Distance — City-block distance

Manhattan Distance mein hum seedha diagonal travel nahi karte. Hum horizontal aur vertical directions mein move karte hain, jaise city ke road blocks par travel karte waqt.

Suppose tumhe point A se point B tak jaana hai. Agar roads sirf horizontal aur vertical hain, toh tumhe kitne total units travel karne padenge? Wahi Manhattan Distance hai.

### Visualize it

[What is Manhattan Distance? A Deep Dive | DataCamp](https://images.openai.com/static-rsc-4/Uw3waLAzdOpHAY6jbC-V4-CR7M33nbXVZYjY01c-2EEwSmUfZN9gCdHIsk9AClQJPrdl5KPwYvgHzPHaNmABap2DO0CScT3yBhp9JfpTyqZeDi7K9YSUlFiOF-_V-Ou7hL3bxxUEAZ3ocilIyFfPhqPp11JwGIUywL3KQ_ljliQ?purpose=inline)

[datacamp.com](https://www.datacamp.com/tutorial/manhattan-distance?utm_source=chatgpt.com)

Horizontal movement = 3 units; vertical movement = 4 units. Route order can vary, but total distance stays the same.

Same points lete hain:

$$\
A=(1,2),\qquad B=(4,6)\
$$

Formula:

$$\
d_M(A,B)=|x_2-x_1|+|y_2-y_1|\
$$

Values put karte hain:

$$\
d_M=|4-1|+|6-2|\
$$

$$\
\=3+4=\boxed7\
$$

Euclidean Distance 5 thi, lekin Manhattan Distance 7 hai.

Aisa kyun? Euclidean distance seedha diagonal route leti hai, jabki Manhattan distance horizontal aur vertical movements ko add karti hai.

### General formula

$$\
d_M(x,y)=\sum\_^|x_j-y_j|\
$$

Yaani har feature ka absolute difference calculate karo aur unhe add kar do.

### Ek important comparison

| Distance  | Result for A = (1,2), B = (4,6) |
| --------- | ------------------------------- |
| Euclidean | 5                               |
| Manhattan | 7                               |

Dono distances same points ke liye different answers de sakti hain, kyunki dono difference ko measure karne ka tareeka alag rakhti hain.

### ML mein iska use

Manhattan distance tab useful ho sakti hai jab differences ko dimensions ke along separately measure karna meaningful ho.

Lekin yaad rakho: standard K-Means Euclidean distance use karta hai. Agar Manhattan distance ke basis par clustering karni hai, toh K-medians jaise related algorithms consider kiye ja sakte hain.

# 3. Cosine Similarity — Direction kitni similar hai?

Ab tak humne dekha ki points ek-doosre se kitni door hain. Cosine Similarity ek different question poochti hai:

Kya do vectors same direction mein point kar rahe hain?

Yahan vector ki direction important hai, aur magnitude (length) directly similarity ko determine nahi karti.

Imagine karo do students ne do subjects mein marks score kiye:

$$\
A=(2,4),\qquad B=(4,8)\
$$

B ke values A se double hain, lekin dono vectors same direction mein point karte hain.

### Visualize vector direction

[Векторы - Задания ЕГЭ по математике 2027 с ответами и решением](https://images.openai.com/static-rsc-4/bl5u8_SX7VATnQPqV8kxdpg8s7IOd8EvpsMpkhRjEilvN1BBLe6S-lV5pm5UYy5O0Q-H_NJBKnZg5ijW5lxJ5HStlYKp8cZyZRacMcg2RvPcDSxsGWHozne3vfep0Mc5Ls_x6AEKhGGbsGlrEcKDBDjOO4SkHopqe0XzaKcLEhA?purpose=inline)

[ege-hub.ru](https://ege-hub.ru/testing/ege/matematika/vektory-po-ege?utm_source=chatgpt.com)

Both vectors point in the same direction, even though B is longer.

Isliye in vectors ki Cosine Similarity 1 hogi.

### Formula

$$\
\operatorname(A,B)=\
\frac
