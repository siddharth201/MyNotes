
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
```
  
**Maximum sum:**
```swift
9
```

**Output:**
```swift
9
```  

**Solution:1**

```swift
func maxSum(_ arr: [Int], _ k: Int) -> Int {
    guard arr.count >= k else { return 0}
    
    var maxSum = Int.min
    var windowSum = 0
    var left = 0
    
    for right in 0..<arr.count {
        windowSum = windowSum + arr[right] //expand
        
        if right-left+1 == k {
            maxSum = max(maxSum, windowSum) //process
            
            // Shrink
            windowSum -= arr[left]
            left += 1 
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

**Solution:2**    

```swift
func buildPrefixArr(_ arr: [Int]) -> [Int] {
    var prefix = [0]
    
    for num in arr {
        prefix.append(prefix.last! + num)
    }
    
    return prefix
}

func maxSum_Prefix(_ arr: [Int], _ k: Int) -> Int {
    let prefix = buildPrefixArr(arr)
    var maxSum = Int.min
    
    for i in 0...arr.count - k {
        let sum = prefix[i + k] - prefix[i]
        maxSum = max(maxSum, sum)
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
    print("=== SlidingWindow ===")
    let result = maxSum(arr, k)
    print(result)
    //completion(result)
    
    print("=== Prifix Sum ===")
    let result1 = maxSum_Prefix(arr, k)
    print(result1)
}
```

### How to Call
```swift
testMaxSum([2,1,5,1,3,2], 3) { result in
    print(result)
}
``` 

