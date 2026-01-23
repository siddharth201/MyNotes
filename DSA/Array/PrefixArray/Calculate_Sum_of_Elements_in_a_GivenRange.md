
> **Q. Given N array elements and Q queries on the same array. For each query  calculate sum of elements in a given range [L-R]**

 
 
**BruteForce**  
```swift
func rangeSumBruteForce(arr: [Int], queries: [(Int, Int)]) -> [Int] {
    var result: [Int] = []
    
    for (l, r) in queries {
        var sum = 0
        for i in l...r {
            sum += arr[i]
        }
        result.append(sum)
    }
    
    return result
}
```  
| Metric | Value    |
| ------ | -------- |
| Time   | O(Q × N) |
| Space  | O(1)     |
  
---  

**Optimize**  
```swift  
func rangeSumOptimized(prefix: [Int],queries: [(Int, Int)]) -> [Int] {
    
    var result: [Int] = []
    
    for (l, r) in queries {
        if l == 0 {
            result.append(prefix[r])
        } else {
            result.append(prefix[r] - prefix[l - 1])
        }
    }
    
    return result
}

func buildPrefixSum(_ arr: [Int]) -> [Int] {
    guard !arr.isEmpty else { return [] }
    
    var prefix = arr
    for i in 1..<prefix.count {
        prefix[i] += prefix[i - 1]
    }
    return prefix
}
```  

| Metric        | Value    |
| ------------- | -------- |
| Preprocessing | O(N)     |
| Each Query    | O(1)     |
| Total         | O(N + Q) |
| Space         | O(N)     |
  
---  

**Helper**  

public func test_calculate_Sum_In_Given_Range_for_Each_Query(arr: [Int], queries: [(Int,Int)], mode: Mode, completion: ([Int]) -> Void) {
    
    switch mode {
        
    case .BruteForce:
        let result = rangeSumBruteForce(arr: arr, queries: queries)
        completion(result)
        
    case .Optimize1:
        let result = rangeSumOptimized(prefix: buildPrefixSum(arr), queries: queries)
        completion(result)
        
    case .Optimize2:
        break
    }
    
}  

---  

**How to Call**  

```swift
test_calculate_Sum_In_Given_Range_for_Each_Query(arr: [1, 2, 3, 4, 5], queries: [(0,2), (1,3), (2,4)], mode: .BruteForce) { result in
    print(result)
}
test_calculate_Sum_In_Given_Range_for_Each_Query(arr: [1, 2, 3, 4, 5], queries: [(0,2), (1,3), (2,4)], mode: .Optimize1) { result in
    print(result)
}  
```  



