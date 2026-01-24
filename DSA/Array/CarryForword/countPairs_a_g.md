
> **Q. Count number of pairs `(i, j)` such that:**
* `i < j`
* `s[i] == 'a'`
* `s[j] == 'g'`  

**Example**
```swift
s = ['a','g','a','g']

Valid pairs:

(0,1)
(0,3)
(2,3)

✅ Answer = 3
```
---  

**Solution**  

**BruteForce**
```swift
func countPairs_a_g_BruteForce(s: [Character]) -> Int {
    let n = s.count
    if n < 2 { return 0}
    
    var count = 0
    
    for i in 0..<n {
        if s[i] == "a" {
            for j in i+1..<n {
                if s[j] == "g" {
                    count += 1
                }
            }
        }
    }
    
    return count
}
```  
**Time Complexity**

Worst case: nested loops

O(n²)

** Space Complexity**
O(1)  

---  

**Optimize (Carry-Forword)**
```swift
func countPairs_a_g_Optimize_Carry_Forword(s: [Character]) -> Int {
    let n = s.count
    if n < 2 { return 0}
    
    var count = 0
    
    var countG = 0
    for i in stride(from: n-1, through: 0, by: -1) {
        if s[i] == "g" {
            countG += 1
        } else if s[i] == "a" {
            count += countG
        }
    }
    
    return count
}
```  

**Time Complexity**
O(n)

**Space Complexity**
O(1)  

**Optimize (Prefix Sum)**
```swift
func countPairs_a_g_Optimize_PrefixSum(s: [Character]) -> Int {
    let n = s.count
    if n < 2 { return 0}
    
    // Step 1: build prefix sum for 'g'
    var prefixG = Array(repeating:0, count: n)
    prefixG[0] = (s[0] == "g" ? 1 : 0)
    
    for i in 1..<n {
        prefixG[i] = prefixG[i-1] + (s[i] == "g" ? 1 : 0)
    }
    
    // Step 2: count pairs
    var count = 0
    for i in 0..<n {
        if (s[i] == "a") {
            count += prefixG[n-1] - prefixG[i]
        }
    }
    
    return count
}  
```  
**Time Complexity**
O(n)

**Space Complexity**
O(n)   

---   

**Space and Time Complexity in One go**   

| Approach                 | Time  | Space  |
| ------------------------ | ----- | ------ |
| Brute Force              | O(n²) | O(1)   |
| Prefix Sum               | O(n)  | O(n)   |
| Carry Forword            | O(n)  | O(1)   |  


**Helper**  

```swift
public func test_countPairs_a_g(s: [Character], mode: Mode, completion: (Int) -> Void) {
    
    switch mode {
        
    case .BruteForce:
        let result = countPairs_a_g_BruteForce(s: s)
        completion(result)
        
    case .Optimize1:
        let result = countPairs_a_g_Optimize_Carry_Forword(s: s)
        completion(result)
        
    case .Optimize2:
        let result = countPairs_a_g_Optimize_PrefixSum(s: s)
        completion(result)
    }
}
```

**How to Call**
```swift
test_countPairs_a_g(s: ["b", "a", "a", "g", "x", "d", "c", "a", "g", "a", "g"], mode: .BruteForce) { result in
    print(result)
}

test_countPairs_a_g(s: ["b", "a", "a", "g", "x", "d", "c", "a", "g", "a", "g"], mode: .Optimize1) { result in
    print(result)
}

test_countPairs_a_g(s: ["b", "a", "a", "g", "x", "d", "c", "a", "g", "a", "g"], mode: .Optimize2) { result in
    print(result)
}
```

