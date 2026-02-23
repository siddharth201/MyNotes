> **Q. Given a sorted array and an integer k find a pair (i, j) such that A[i]+A[j] = k .** 

```swift
func findPairTwoPointers(_ nums: [Int], _ k: Int) -> (Int, Int)? {
    var left = 0
    var right = nums.count-1
    
    while left < right {
        let sum = nums[left] + nums[right]
        
        if sum == k {
            return (left, right)
        }
        
        if sum > k {
            right -= 1
        } else {
            left += 1
        }
    }
    
    return nil
}

public func testFindPairTwoPointers(_ nums: [Int], _ k: Int, completion: (((Int,Int)?)-> Void)) {
    let result = findPairTwoPointers(nums, k)
    completion(result)
}

testFindPairTwoPointers([1,3,5,10,20,23,30], 23) { result in
    print(result!.0)
    print(result!.1)
}
```

**Time Complexity:** `O(n)`  
**Space Complexity:** `O(1)` 
