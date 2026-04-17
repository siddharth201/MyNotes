
> **Given an array and Q queries [L, R], return the sum of elements at EVEN INDICES within each range.**  

### Example
```swift
arr = [2, 5, 1, 3, 6]
index:  0  1  2  3  4
```

#### Even indices:  

```swift
0, 2, 4 → values = 2, 1, 6
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

#### Even indices inside range:  

```swift
index 2 → 1
index 4 → 6
```

#### Answer:  

```swift
1 + 6 = 7
```  

### Solution  
  
#### Approch-1
```swift
func evenPrefix(prefix: [Int],queries: [(Int, Int)]) -> [Int] {
    var result: [Int] = []
    
    for (l, r) in queries {
        
        guard l >= 0, r < prefix.count, l <= r else {
            result.append(0)
            continue
        }
        
        var sum = 0
        if l == 0 {
            sum = prefix[r]
        } else {
            sum = prefix[r] - prefix[l-1]
        }
        result.append(sum)
    }
    
    return result
}
```  

```swift
func buildEvenPrefixSum(arr: [Int]) -> [Int] {
    
    guard !arr.isEmpty else { return [] }
    
    var prefixEvenSum = Array(repeating: 0, count: arr.count)
    
    prefixEvenSum[0] = arr[0]
    
    for i in  1..<arr.count {
        if i % 2 == 0 {
            prefixEvenSum[i] = prefixEvenSum[i-1] + arr[i]
        } else {
            prefixEvenSum[i] = prefixEvenSum[i-1]
        }
    }
    
    return prefixEvenSum
}
```  

#### Approch-2  

```swift
func evenPrefix(prefix: [Int],queries: [(Int, Int)]) -> [Int] {

    var result:[Int] = []
    
    for (l, r) in queries {
        guard l >= 0, r < prefix.count, l <= r else {
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
func buildEvenPrefix(arr: [Int]) -> [Int] {
    
    guard !arr.isEmpty else { return [] }
    
    var pea = [0]
    
    for i in 0..<arr.count {
        let val = (i % 2 == 0) ? arr[i] : 0
        pea.append(pea.last! + val)
    }
    
    return pea
} 
``` 
  
### Time and Space Complexity 

**Preprocessing:** O(n)  

**Each query:** O(Q)

**Total:** O(n + Q)

**Space:** O(n)  

  
  
### Helper  
 
```swift
public func test_rangeSumAllEvenIndex(arr: [Int],queries: [(Int, Int)], completion: (([Int]) -> Void)) {
    //Approch-1
    let result1 = rangeSumAllEvenIndex(prefix: buildEvenPrefixSum(arr: arr), queries: queries)
    print("Approch-1 result: \(result1)")
    
    //Approch-2
    let result2 = evenPrefix(prefix: buildEvenPrefix(arr: arr), queries: queries)
    print("Approch-2 result: \(result2)")
    //completion(result)
}
```  

### How To Call
```swift
test_rangeSumAllEvenIndex(arr: [2, 3, 4, -1, -2, 6], queries: [(0,2), (1,5)]) { result in
    print(result)
}
```
