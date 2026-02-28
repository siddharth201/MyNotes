> **Given an array and q queries, return frequency of each element for every given query?**    

```swift
public func frequencyQueries(_ arr: [Int], _ queries: [Int]) -> [Int] {
    var frequency = [Int: Int]()
    
    for item in arr {
        frequency[item, default: 0] += 1
    }
    
    var result: [Int] = []
    
    for q in queries {
        result.append(frequency[q, default: 0])
    }
    
    return result
}
```  

### Complexity

**Preprocessing →** `O(n)`  
**Queries →** `O(q)`  
**Total →** `O(n + q)`  

**Space →** `O(n)`  

```swift
public func testFrequencyQueries(_ arr: [Int], _ queries: [Int], completion: ([Int]) -> Void) {
    let result = frequencyQueries(arr, queries)
    completion(result)
}
```

###How to Call
```swift
testFrequencyQueries([1, 2, 1, 3, 2, 1], [1, 2, 5]) { result in
    print(result)
}
```
