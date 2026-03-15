
> Q. Given:  </br>  An integer array `arr`
          </br>     An integer `k`</br></br> 
Find the **maximum sum of any contiguous subarray of size `k`**.   

**Example**  
```swift
arr = [2,1,5,1,3,2]
k = 3
```  
**Subarrays of size 3:**
```swift
[2,1,5] → sum = 8
[1,5,1] → sum = 7
[5,1,3] → sum = 9
[1,3,2] → sum = 6  
  
**Maximum sum:**
```swift
9
```

**Output:**
```swift
9
```  

**Solution:**

```swift
func maxSum(_ arr: [Int], _ k: Int) -> Int {
    guard arr.count >= k else { return 0}
    var maxSum = Int.min
    var windowSum = 0
    
    for right in 0..<arr.count-1 {
        windowSum = windowSum + arr[right] //expand
        
        if right >= k-1 {
            maxSum = max(maxSum, windowSum) //process
            windowSum = windowSum - arr[right - k + 1]
        }
    }
    return maxSum
}
```  

### Complexity

| Metric | Value    |
| ------ | -------- |
| Time   | **O(n)** |
| Space  | **O(1)** |  

```swift
public func testMaxSum(_ arr: [Int], _ k: Int, completion: (Int) -> Void) {
    let result = maxSum(arr, k)
    completion(result)
}
```

### How to Call
```swift
testMaxSum([2,1,5,1,3,2], 3) { result in
    print(result)
}
``` 

