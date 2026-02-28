> **Q. Given an sorted array, find three indices i,j,k such that Ai+Aj+Ak = target.**  

```swift
func tripletSum(_ nums: [Int], _ target: Int) -> [[Int]]? {
    for i in 0..<nums.count-2 {
        var j = i+1
        var k = nums.count-1
        
        while j < k {
            if nums[j] + nums[k] == target - nums[i] {
                return [[i,j,k]]
            }
            
            if nums[j] + nums[k] < target - nums[i] {
                j += 1
            } else {
                k -= 1
            }
        }
    }
    return nil
}
```

**Time Complexity:** `O(n²)`  
**Space Complexity:** `O(1)`
  
```swift
public func testTripletSum(_ nums: [Int], _ target: Int, completion: ([[Int]]?)->Void) {
    let result = tripletSum(nums, target)
    completion(result)
}
```  

### How to Call
```swift  
testTripletSum([1,3,5,10,20,23,30], 38){ result in
    print(result ?? [[]])
}
```
