> **Q. Find first non repeating element.**  

```swift
public func firstNonRepeating(_ arr: [Int]) -> Int {
    var frequency = [Int: Int]()
    
    for item in arr {
        frequency[item, default: 0] += 1
    }
    
    for item in arr {
        if frequency[item] == 1 {
            return item
        }
    }
    
    return -1
}
```

### Complexity

**Time →** `O(n)`  
**Space →** `O(n)`  

```swift
public func testFirstNonRepeating(_ arr: [Int], completion: (Int) -> Void) {
    let result = firstNonRepeating(arr)
    completion(result)
}
```  

### How to Call
```swift
testFirstNonRepeating([1, 2, 1, 3, 2, 1]) { result in
    print(result)
}
```
