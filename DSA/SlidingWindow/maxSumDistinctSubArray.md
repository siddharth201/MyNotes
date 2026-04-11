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

### Solution:

```swift
func maxSumDistinctSubArray(_ nums: [Int], _ k: Int) -> Int {
    guard nums.count >= k else { return 0 }
    
    var maxSum = 0
    var windowSum = 0
    var left = 0
    var freq = [Int: Int]()
    
    for right in 0..<nums.count {
        windowSum += nums[right]
        freq[nums[right], default: 0] += 1
        
        if right - left + 1 == k {
            
            if freq.count == k {
                maxSum = max(maxSum, windowSum)
            }
            
            // remove left element
            let leftVal = nums[left]
            windowSum -= leftVal
            
            freq[leftVal]! -= 1
            if freq[leftVal] == 0 {
                freq.removeValue(forKey: leftVal)
            }
            
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



