> **Given an array rotate the array k times from right to left.**  

**Example:**

```swift
arr = [1,2,3,4,5], k = 2
→ [3,4,5,1,2]
```  

**Solution :**  

```swift
func rotateArray(arr: [Int], k: Int) -> [Int] {
    guard !arr.isEmpty else { return [] }
    
    var arr = arr
    let n = arr.count
    let k = k % n
    if k == 0 { return arr }
    
    reverse(&arr, 0, n - k - 1)
    reverse(&arr, n - k, n - 1)
    reverse(&arr, 0, n - 1)
    
    return arr
}

func reverse(_ arr: inout [Int], _ left: Int, _ right: Int) {
    var i = left
    var j = right
    
    while i < j {
        arr.swapAt(i, j)
        i += 1
        j -= 1
    }
}
```    

**Time Complexity**
O(n)

(Each element is swapped at most once per reversal)

**Space Complexity**
O(1) extra space

(Only a few variables used)

**Helper**  
```swift
public func test_RotateArray(arr: [Int], k: Int, completion: ([Int]) -> Void) {
    let result = rotateArray(arr: arr, k: k)
    completion(result)
}  
```  
  
**How to Call**  
```swift
test_RotateArray(arr: [2, 3, 4, 5, 6], k: 2) { result in
    print("Rotated Array: \(result)")
}
test_RotateArray(arr: [2, 3, 4, 5, 6], k: 1) { result in
    print("Rotated Array: \(result)")
}
test_RotateArray(arr: [2, 3, 4, 5, 6], k: 0) { result in
    print("Rotated Array: \(result)")
}
test_RotateArray(arr: [2, 3, 4, 5, 6], k: 4) { result in
    print("Rotated Array: \(result)")
}
test_RotateArray(arr: [2, 3, 4, 5, 6], k: 6) { result in
    print("Rotated Array: \(result)")
}
```
