
### Q.1 You are given a list of (X,Y) coordinates, check whether the coordinates lie on a straight line or not. If they lie on a straight line return the `slope` and `intercept` else return `−1`.  

#### Input Format

```text
coordinates (list of tuples)
```  

#### Output Format

```text
if straight line exists :
(M, B)
tuple of M and B, consisting of float values rounded upto one decimal place

else:
-1  
```  

#### Example 1 Input

```text
[(1.0, 5.0), (-3.0, -3.0), (2.5, 8.0)]
```  

#### Example 1 Output

```text
(2.0, 3.0)
``` 

#### Example 2 Input

```text
[(5.0, 5.0), (-2.0, -3.0), (0.0, 0.0), (14.0, 6.7), (-3.0, -6.3)]  
```  

#### Example 2 Output

```text
-1
```  

<details>

<summary>$\color{black}{\huge{\textbf{Solution}}}$</summary>
  
```text
  import math

def solve(coordinates):

    if len(coordinates) < 2:
        return -1

    x1, y1 = coordinates[0]
    x2, y2 = coordinates[1]

    if x1 == x2:
        return -1

    slope = (y2 - y1) / (x2 - x1)

    for x, y in coordinates[2:]:
        if x == x1:
            return -1

        current_slope = (y - y1) / (x - x1)

        if not math.isclose(current_slope, slope):
            return -1

    intercept = y1 - slope * x1

    return (round(slope, 1), round(intercept, 1))
```  

[**Explanation**](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/ML/LA-2/LA_2_Q_1.md)
</details>  

</details>

---  

### Q.2 Given a matrix, D = [[1, 5, 2]]of dimension 1 x 3. Suppose we take the transpose of it, i.e. $D^T$ ,now what will be the resultant matrix and dimension of $D^T$ ?   

<details>
<summary>$\color{black}{\huge{\textbf{Options:}}}$</summary>  


1. dimension = 3 x 1 , $D^T$ = [[1],[5],[2]]   

2. dimension = 3 x 1 , $D^T$ = [[2],[5],[1]]   

3. dimension = 1 x 3 , $D^T$ = [1,5,2]  
 
4. dimension = 1 x 3 , $D^T$ = [2,5,1]  
  
   

<details>
<summary>$\color{black}{\huge{\textbf{Answer}}}$</summary>
  1. dimension = 3 x 1 , $D^T$ = [[1],[5],[2]] 

[**Explanation**](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/ML/LA-2/LA_2_Q_2.md)
</details>  

</details>

---  

### Q.3 The incomplete code snippet given below will be used to find out the angle between two vectors.  

```text
import math

def dotProduct(vl, v2):
    return sum ((a*b) for a, b in zip(v1, v2))

def magnitude(v):
    return ______(dotProduct(v, v))            #---(i)

def angleBtnTwoVectors(vl, v2):
    if ______:                                #---(ii)
        return "Error"
    else : 
        return math.acos(dotProduct(v1, v2) / (magnitude(v1) * magnitude (v2)))
```   

What should be the code in the missing places i.e. marked with (i) and (ii) to compute the angle correctly?

**Note:** Here v1 and v2 are lists.  

<details>
<summary>$\color{black}{\huge{\textbf{Options:}}}$</summary>  

```text
a.  (i) => math.log , (ii) => len(v1) == len(v2)

b.  (i) => math.sqrt , (ii) => len(v1) == len(v2)

c.  (i) => math.log , (ii) => len(v1) != len(v2)

d.  (i) => math.sqrt , (ii) => len(v1) != len(v2)
  
```   
   
<details>
<summary>$\color{black}{\huge{\textbf{Answer}}}$</summary>
  d.  (i) => math.sqrt , (ii) => len(v1) != len(v2)

[**Explanation**](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/ML/LA-2/LA_2_Q_3.md)
</details>  

</details>

---   

### Q.4 Let a and b be two unit vectors. If the vectors c = a + 2b and d = 5a − 4b are perpendicular to each other, then the angle (in radians) between a and b is :  

<details>
<summary>$\color{black}{\huge{\textbf{Options:}}}$</summary>  

```text
1. π/4

2. π/2

3. 2π/3

4. π/3 
```   
   

<details>
<summary>$\color{black}{\huge{\textbf{Answer}}}$</summary>

4. π/3   

[**Explanation-1**](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/ML/LA-2/LA_2_Q.4.md)  
[**Explanation-2**](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/ML/LA-2/LA_2_Q.4_1.md)
</details>  

</details>

---  

### Q.5 Given a row vector w = [4,2,3]. What is the magnitude of this vector w ? 

<details>
<summary>$\color{black}{\huge{\textbf{Options:}}}$</summary>  

1.  $$\sqrt{29}$$  

2.  $$\sqrt{9}$$  

3.  6  

4. None of the above    
   
<details>
<summary>$\color{black}{\huge{\textbf{Answer}}}$</summary>
  1.  $$\sqrt{29}$$ 

[**Explanation**](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/ML/LA-2/LA_2_Q.5.md)
</details>  

</details>

---   

### Q.6 Given two d-dimensional vectors $x ∈ R^d$ and $y ∈ R^d$ , we perform a dot product operation on these two vectors $z= x.y$ 
### What will be the dimension for the resultant output?  

<details>
<summary>$\color{black}{\huge{\textbf{Options:}}}$</summary>  


1. $z ∈ R^d$  

2. $z ∈ R^{2d}$  

3. $z ∈ R^1$  

4. $z ∈ R^2$  
   
   
<details>
<summary>$\color{black}{\huge{\textbf{Answer}}}$</summary>

 3. $z ∈ R^1$  

[**Explanation**](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/ML/LA-2/LA_2_Q.6.md)
</details>  

</details>

---   

### Q.7 What is the angle(in degrees) between two vectors $a$ and $b$ with magnitudes 1 and 2 respectively and when $a.b$=1 ?  

<details>
<summary>$\color{black}{\huge{\textbf{Options:}}}$</summary>  

 1.  $45^\circ$ 
 
 2.  $30^\circ$  
 
 3.  $60^\circ$ 
 
 4.  $0^\circ$ 
   
   
<details>
<summary>$\color{black}{\huge{\textbf{Answer}}}$</summary>

3.  $60^\circ$ 

[**Explanation**](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/ML/LA-2/LA_2_Q.7.md)
</details>  

</details>

---  

### Q.8 What is the value of p such that the vectors $a=[2,6,8]$ and $b=[p,3,4]$ are perpendicular to each other ?   

<details>
<summary>$\color{black}{\huge{\textbf{Options:}}}$</summary>  

```text
 1. -10  
 
 2. -25  
 
 3. 10  
 
 4. None of the above 
```   
   

<details>
<summary>$\color{black}{\huge{\textbf{Answer}}}$</summary>
 2. -25  
 
[**Explanation**](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/ML/LA-2/LA_2_Q.8.md)
</details>  

</details>

---  

### Consider two vectors x = [2, 3] and y = [3, -2].
### What is the dot product?
### What is the angle between them?
  
