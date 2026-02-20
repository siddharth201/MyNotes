> **Given a sorted array of integers. Search for a target value and return its index, if not present return -1**    

```swift
func binarySearch(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count-1
    
    while left <= right {
        let mid = left + (right-left) / 2
        
        if nums[mid] == target {
            return mid
        }
        
        if nums[mid] < target {
            left = mid+1
        } else {
            right = mid-1
        }
    }
    
    return -1
}

public func testBinarySearch(_ nums: [Int], _ target: Int, completion: (Int) -> Void) {
        let result  = binarySearch(nums, target)
        completion(result)
}

testBinarySearch([1,3,5,7,9,10,11,13,15,17,19,30,35,40], 17) { result in
    print("Result Index: \(result)")
}
```  

###Time & Space Complexity
Time: O(log n)
Space: O(1)

