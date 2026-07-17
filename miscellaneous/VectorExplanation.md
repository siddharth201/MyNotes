
> y Vector 

Targets 
6 
8 
11 

Written as
 
y = 
6 
8 
11 

Notice Only one column. Therefore Vector. 

My Question: Expalin Notice Only one column. Therefore Vector  

#### Answer

In linear algebra and computer science, a vector is simply a sequence of numbers ordered in a single row or a single column. [1, 2] 
Here is the breakdown of why having only one column makes it a vector.
## Grid vs. Line

* Matrix (Grid): Has multiple rows and multiple columns (e.g., a 3x3 table).
* Vector (Line): Has a dimension of exactly one in either width or height.

## Column Vectors
When data is written stacked vertically, it forms a column vector. Your target $y$ looks like this: [3] 
$$y = \begin{bmatrix} 6 \\ 8 \\ 11 \end{bmatrix}$$ 

* It has 3 rows.
* It has 1 column.
* Because the column count is exactly 1, it represents a single path or list of values, which defines a vector. [4] 

## Why This Matters in Machine Learning
In predictive modeling, $y$ usually represents your "target" or the labels you want to predict.

* Each row (6, 8, 11) belongs to a different data sample.
* Since you are only predicting one specific feature per sample (like house prices), all the answers fit into a single column.

---  

### Q. 


