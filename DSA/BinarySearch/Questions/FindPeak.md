
> **Find peak element in increasing-decreasing array.**  

```swift
func findPeak(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count-1
    
    while left <= right {
        let mid = left + (right-left) / 2
        
        if  (mid == 0 || nums[mid] > nums[mid-1]) &&
                (mid == nums.count-1 || nums[mid] > nums[mid+1]) {
            return nums[mid]
        }
        
        if mid == 0 || nums[mid] > nums[mid-1] {
            left = mid + 1
        } else {
            right = mid-1
        }
    }
    
    return -1
}

public func testFindPeak(_ nums: [Int], completion: (Int) -> Void) {
    let result = findPeak(nums)
    completion(result)
}  

testFindPeak([1,3,8,10,15,20,22,19,16,9]) { result in
    print(result)
}
```  

### Time & Space Complexity  
Time: O(log n)  
Space: O(1)
