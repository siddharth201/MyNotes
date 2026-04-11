> Given an array, find the maximum sum of a subarray of size k such that all elements in the subarray are distinct.  

### Example
```swift
arr = [1,5,4,2,9,9,9]
k = 3
```  

#### All subarrays of size 3:  
```swift
[1,5,4] → distinct ✅ sum = 10
[5,4,2] → distinct ✅ sum = 11
[4,2,9] → distinct ✅ sum = 15
[2,9,9] → NOT distinct ❌
[9,9,9] → NOT distinct ❌  
```  

#### Answer:
```swift
15
```
