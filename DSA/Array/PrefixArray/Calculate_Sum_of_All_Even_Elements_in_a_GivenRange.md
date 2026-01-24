
> **Given an array and Q queries [L, R], return the sum of elements at EVEN INDICES within each range.**  

**Solution**
```swift
func rangeSumAllEvenIndex(prefix: [Int],queries: [(Int, Int)]) -> [Int] {
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
**Time and Space Complexity**
**Preprocessing**
O(n)

**Each query**
O(1)

**Total**
O(n + Q)

**Space**
O(n)  


**Helper**  
```swift
public func test_rangeSumAllEvenIndex(arr: [Int],queries: [(Int, Int)], completion: (([Int]) -> Void)) {
    let result = rangeSumAllEvenIndex(prefix: buildEvenPrefixSum(arr: arr), queries: queries)
    completion(result)
}
```  

**How To Call**
```swift
test_rangeSumAllEvenIndex(arr: [2, 3, 4, -1, -2, 6], queries: [(0,2), (1,5)]) { result in
    print(result)
}
```
