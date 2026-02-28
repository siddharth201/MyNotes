> **Given a sorted array and an integer k find a pair (i, j) such that A[j]-A[i] = k  where j>i**  

```swift
func findPairWithDifference(_ nums: [Int], _ k: Int) -> (Int, Int)? {
    var i = 0
    var j = 1
    
    while j < nums.count {
        
        if i == j {
            j += 1
            continue
        }
        
        let diff = nums[j] - nums[i]
        
        if diff == k {
            return (i, j)
        } else if diff < k {
            j += 1
        } else {
            i += 1
        }
    }
    
    return nil
}
```  

### Complexity

**Time:** `O(n)`  
**Space:** `O(1)`  

```swift
public func testFindPairWithDifference(_ nums: [Int], _ k: Int, completion: ((Int,Int)?)->Void) {
    let result = findPairWithDifference(nums, k)
    completion(result)
}
```

### How to Call
```swift
testFindPairsHashSet([1,3,5,10,20,23,30], 23) { result in
   print(result)
}
testFindPairsHashMap([1,3,5,10,20,23,30], 23) { result in
    print(result!.0)
    print(result!.1)
}
```
