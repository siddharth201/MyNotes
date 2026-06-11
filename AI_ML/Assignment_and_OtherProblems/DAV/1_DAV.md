
### Q1. Matrix elements 

### What will be the outcome of the following code snippet ?

```text
x = np.ones((5,5))
x[1:-1,1:-1] = 0 
```   

<details>
<summary>$\color{black}{\huge{\textbf{Options:}}}$</summary>  

```text
1. All the elements except those at the border are equated to zero.

2. All the elements at the border are equated to zero.

3. All the elements in the first and last columns are equated to zero.

4. All the elements in the first and last rows are equated to zero.  
```   
   

<details>
<summary>$\color{black}{\huge{\textbf{Answer}}}$</summary>
1. All the elements except those at the border are equated to zero.  
  
  
[**Explanation**](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/ML/DAV-1/DAV_1_Q_1.md)
</details>  

</details>  
  
  
---
  
  
### Q.2 Inter dimension  

### Given a 3D array of shape (2, 3, 3)  

```text  
array([[[ 0, 1, 2],
        [ 3, 4, 5], 
        [ 6, 7, 8]], 

        [[ 9, 10, 11], 
         [12, 13, 14], 
         [15, 16, 17]]])  
```  

### What will be the output of arr[1, :, :] ?  

<details>
<summary>$\color{black}{\huge{\textbf{Options:}}}$</summary>  

```text  
A.

array([[ 3, 4, 5], 
       [12, 13, 14]])

B.

array([[ 9, 10, 11], 
       [12, 13, 14], 
       [15, 16, 17]])

C.

array([[ 1, 4, 7], 
       [10, 13, 16]])

D.

array([[0, 1, 2], 
       [3, 4, 5], 
       [6, 7, 8]])

```   
   

<details>
<summary>$\color{black}{\huge{\textbf{Answer}}}$</summary>
  B.

    array([[ 9, 10, 11], 
       [12, 13, 14], 
       [15, 16, 17]])
[**Explanation**](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/ML/DAV-1/DAV_1_Q_2.md)
</details>  

</details>  


---  

### Q3. Cast a type  

### Raghu has created a numpy array arr using the following code:

```text
import numpy as np
arr = np.array([10, 20, 30, 40, 50])
```  

### He wants to change the data type from integer to float.Which of the following is the correct approach to do so?
  
<details>
<summary>$\color{black}{\huge{\textbf{Options:}}}$</summary>  

```text  
1. float(arr)

2. arr.to_float()

3. arr.astype('float64')

4. type(arr, dtype='float64')
  
```   
   

<details>
<summary>$\color{black}{\huge{\textbf{Answer}}}$</summary>
  3. arr.astype('float64')

[**Explanation**](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/ML/DAV-1/DAV_1_Q_3.md)
</details>  

</details>

---  


### Q4. Index of Pokédex  

### Problem Statement: 
Given a 1D array, return the first and last elements from the array.  
#### Input Format: 
```text
A 1D numpy array
```  

#### Output Format:  
```text
A tuple (first_element, last_element)
```  

#### Sample Input:  
```text
[0, 1, 2, 3, 4, 5]
```  

#### Sample Output:  
```text
(0, 5)
```
  
<details>
<summary>$\color{black}{\huge{\textbf{Solution:}}}$</summary>  

```text
  import numpy as np

def get_elements(arr):
    
    first_element = arr[0]
    
    last_element = arr[-1]
    
    return (first_element, last_element)
```     

</details>  

</details>

---  

### Q5. Vectorization
  
<details>
<summary>$\color{black}{\huge{\textbf{Options:}}}$</summary>  

```text
  
```   
   

<details>
<summary>$\color{black}{\huge{\textbf{Answer}}}$</summary>
  

[**Explanation**]()
</details>  

</details>

---               

