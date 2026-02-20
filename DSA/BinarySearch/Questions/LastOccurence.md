> **Given a sorted array of integers. Search for a target value and return its last index, if not present return -1**  

### Approch-1
```swift 
func lastOccurrence_approch1(_ nums: [Int], _ target: Int) -> Int {
    //Define search space
    var left = 0
    var right = nums.count-1
    
    while left <= right {
        let mid = left + (right-left) / 2
        
        //check if mid is answer
        if nums[mid] == target && (mid == nums.count-1 || nums[mid+1] > target) {
            return mid
        }
        
        //Decide going left and right
        if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    return -1
}
```  

### Approch-2

```swift
func lastOccurrence_approch2(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count-1
    var result = -1
    
    while left <= right {
        let mid = left + (right-left) / 2
        
        if nums[mid] == target {
            result = mid
            left = mid + 1
        } else if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    return result
}
```

### Test  
```swift
public func testLastOccurrence(_ nums: [Int], _ target: Int, completion: ((Int, Int)) -> Void) {
    let result1 = lastOccurrence_approch1(nums, target)
    let result2 = lastOccurrence_approch2(nums, target)
    
    completion((result1, result2))
}  
```  

### How to call
```swift
testLastOccurrence([2,2,5,5,5,5,5,8,10,10,13,13,13], 5) { result in
    print("approch one: \(result.0)")
    print("approch two: \(result.1)")
}
```
