
> **Given an array `arr` of size N, construct a prefix-even array such that:**

```
prefixEvenArray[i] = sum of elements at EVEN indices from 0 to i
```

Important:

* Index-based (0-based indexing)
* Only **even indices** contribute
* Odd indices just carry forward the previous sum

---

### Input

```swift
arr = [5, 10, 15, 20, 25]
```

### Even indices: `0, 2, 4`

### PrefixEvenArray

| i | arr[i] | prefixEvenArray[i] |
| - | ------ | ------------------ |
| 0 | 5      | 5                  |
| 1 | 10     | 5                  |
| 2 | 15     | 20                 |
| 3 | 20     | 20                 |
| 4 | 25     | 45                 |

Output:

```swift
[5, 5, 20, 20, 45]
```

---  

**Solution**  

```swift
func buildPrefixEvenArray(arr: [Int]) -> [Int] {
    let n = arr.count
    if n == 0 { return []}
    
    var prefixEvenArray = Array(repeating: 0, count: n)
    prefixEvenArray[0] = arr[0]
    
    for i in 1..<n {
        if i % 2 == 0 {
            prefixEvenArray[i] = prefixEvenArray[i-1] + arr[i]
        } else  {
            prefixEvenArray[i] = prefixEvenArray[i-1]
        }
    }
    
    return prefixEvenArray
    
}
```  

**Time Complexity**
O(n)  

**Space Complexity**  
O(n)  

(output array)

This is optimal, since output itself is size n.  

**Helper**  

public func test_buildPrefixEvenArray(arr: [Int], completion: ([Int]) -> Void) {
    let result = buildPrefixEvenArray(arr: arr)
    completion(result)
}  
  
**How To Call**
test_buildPrefixEvenArray(arr: [-1, 5, 4, 6, 8, 9, 11, 0]) { result in
    print(result)
}
