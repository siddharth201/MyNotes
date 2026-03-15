> Q. Given:  </br>  An integer array `arr`
          </br>     An integer `k`</br></br> 
Find the **average of every contiguous subarray of size `k`.**.  

**Example**  

```swift
arr = [1,3,2,6,-1,4,1,8,2]
k = 5  
```

**Subarrays of size 5:**  

```swift
[1,3,2,6,-1] → avg = (11 / 5) = 2.2
[3,2,6,-1,4] → avg = (14 / 5) = 2.8
[2,6,-1,4,1] → avg = (12 / 5) = 2.4
[6,-1,4,1,8] → avg = (18 / 5) = 3.6
[-1,4,1,8,2] → avg = (14 / 5) = 2.8
```  

**Output:** 
 
```swift
[2.2, 2.8, 2.4, 3.6, 2.8]  
```

**Solution:**
```swift
func averageSubarray(_ arr: [Int], _ k: Int) -> [Double] {
    guard arr.count >= k else { return [] }
    
    var result: [Double] = []
    var windowSum = 0
    
    for right in 0..<arr.count {
        windowSum += arr[right]
        
        if right >= k-1 {
            let avg = Double(windowSum) / Double(k)
            result.append(avg)
            
            windowSum -= arr[right-k+1]
        }
    }
    
    return result
}
```  

**Complexity**  
**Time =** `O(n*k)`  
**Space =** `O(1)`

```swift
public func testAverageSubarray(_ arr: [Int], _ k: Int, completion: ([Double])-> Void) {
    let result = averageSubarray(arr, k)
    completion(result)
}  
```
**How to Call**
```swift
testAverageSubarray([1,3,2,6,-1,4,1,8,2], 5) { result in
    print(result)
}
```

