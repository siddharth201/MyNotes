> **Given an array rotate the array k times from right to left.**  

**Example:**

```swift
arr = [1,2,3,4,5], k = 2
→ [3,4,5,1,2]
```  

**Solution :**  

```swift
func rotateArray(arr: [Int], k: Int) -> [Int] {
    
    guard !arr.isEmpty else { return []}
    
    var arr = arr
    let n = arr.count
    let k = k % n
    let partitionPos = n-k
    reverseArray(left: 0, right: partitionPos-1)
    reverseArray(left: partitionPos, right: n-1)
    reverseArray(left: 0, right: n-1)
    
    func reverseArray(left: Int, right: Int) {
        var i = left
        var j = right
        
        while(i < j) {
            let temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp
            
            i += 1
            j -= 1
        }
    }
    
    
    return arr
}
```  

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
