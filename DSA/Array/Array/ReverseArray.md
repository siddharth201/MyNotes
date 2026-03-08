 > **Q. Given an array reverse the element**  
 
 **Example**  
 
 ```swift
[1, 2, 3, 4] → [4, 3, 2, 1]  
```    
---  

**Solution :**

```swift

func reverseArray(arr: [Int]) -> [Int] {
    let n = arr.count
    if n == 0 { return [] }
    
    var arr = arr
    var left = 0
    var right = n-1
    
    while(left<right) {
        let temp = arr[left]
        arr[left] = arr[right]
        arr[right] = temp
        
        left += 1
        right -= 1
    }
    
    return arr
}

```  

**Time Complexity**
O(n)

**Space Complexity**
O(n)   // because a new array is returned  

---  

**Helper**
```swift

public func test_reverseArray(arr: [Int], completion: (([Int]) -> Void)) {
    let result = reverseArray(arr: arr)
    completion(result)
}

```  

**How to call**
```swift  

test_reverseArray(arr: [3, 4, 7, 10, -1]) { result in
    print("reversed array: \(result)")
}

```
