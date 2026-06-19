
### Q.1 You are given a list of (X,Y) coordinates, check whether the coordinates lie on a straight line or not. If they lie on a straight line return the slope and intercept else return −1.  

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

[**Explanation**]()
</details>  

</details>

--- 
