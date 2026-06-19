
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
