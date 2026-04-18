> **Given N array elements and Q queries, for each query calculate sum of all odd index elements in a given range**  

### Example  

```swift
arr = [2, 5, 1, 3, 6]
index:  0  1  2  3  4
```  

#### Odd indices:
```swift
1, 3 → values = 5, 3  
```

### Example Query
```swift
Query: [1, 4]
```  

#### Subarray:
```swift
[5, 1, 3, 6]
 index: 1  2  3  4
 ```
 
#### Odd indices inside range:
```swift
index 1 → 5
index 3 → 3 
```

### Answer:
```swift
5 + 3 = 8  
```

### Solution
```swift
func rangeSumOdd(prefix: [Int], queries: [(Int, Int)]) -> [Int] {
    var result: [Int] = []
    
    for (l, r) in queries {
        guard l >= 0, r < prefix.count - 1, l <= r else {
            result.append(0)
            continue
        }
        
        let sum = prefix[r+1] - prefix[l]
        result.append(sum)
    }
    
    return result
}
```

```swift
func buildOddPrefix(_ arr: [Int]) -> [Int] {
    var prefix = [0]
    
    for index in 0..<arr.count {
        let val = (index % 2 == 1) ? arr[index] : 0
        prefix.append(prefix.last! + val)
    }
    
    return prefix
}
```    

### Time and Space Complexity
**Preprocessing:** O(n)  

**Each query:** O(Q)  

**Total:** O(n + Q)  

**Space:** O(n)  

### How To Test:
```swift
public func test_OddPrefix(arr: [Int], queries: [(Int, Int)]) {
    let result = rangeSumOdd(prefix: buildOddPrefix(arr), queries: queries)
    print("Odd Prefix Sum: \(result)")
}
```
