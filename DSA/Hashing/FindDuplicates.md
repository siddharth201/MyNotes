> **Check if there are any duplicate in the array.**   

```swift
func containsDuplicate(_ nums: [Int]) -> Bool {
    var seen = Set<Int>()
    
    for num in nums {
        if seen.contains(num) {
            return true
        }
        
        seen.insert(num)
    }
    
    return false
}  
```  

**Complexity**  
**Time:** `O(n)`  
**Space:** `O(n)`  

```swift
public func testContainsDuplicate(_ nums: [Int], completion: (Bool) -> Void) {
    let result = containsDuplicate(nums)
    completion(result)
}  
``` 

**How to Test**
```swift
testContainsDuplicate([1,2,3,1]) { result in
    print(result)
}

testContainsDuplicate([1,2,3,4]) { result in
    print(result)
}
```

