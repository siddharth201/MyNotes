
 > **Q. Given N array elements, count number of elements which have atleast one element greater than itself**  
 
 **Example**  
 
 ```swift
arr = [3, 1, 2]  


3 → ❌ no greater element

1 → ✅ (3 is greater)

2 → ✅ (3 is greater)

✅ Answer = 2  
```    
---  

**Solution :**


```swift

public enum Mode {
    case BruteForce
    case Optimize
}

```
---

**Brute Force**
```swift
func find_Atleast_OneElement_GreaterThan_Itself_BruteForce(arr: [Int]) -> Int {
    let n = arr.count
    if n == 0 { return 0 }
    
    var count = 0
    
    for i in 0..<n {
        for j in 0..<n {
            if i != j && arr[j] > arr[i] {
                count += 1
                break
            }
        }
    }

    return count
}

```
**Time Complexity**

Worst case: every i scans almost entire array  

Nested loops → O(n²)



**Space Complexity**
O(1)  

---

**Optimize**
```swift

func find_Atleast_OneElement_GreaterThan_Itself_Optimize(arr: [Int]) -> Int {
    guard !arr.isEmpty else { return 0 }
    
    var maxValue = arr[0]
    var maxCount = 1
    
    for i in 1..<arr.count {
        if arr[i] > maxValue {
            maxValue = arr[i]
            maxCount = 1
        } else if arr[i] == maxValue {
            maxCount += 1
        }
    }
    
    return arr.count - maxCount
}

```
**Time Complexity**

**Step**                 **TC**
Find max                  O(n)
Count max                 O(n)
Total                     O(n)


**Space Complexity**
O(1)

---

**Helper**
```swift

public func test_find_Atleast_OneElement_GreaterThan_Itself(arr: [Int], mode: Mode, completion: ((Int) -> Void)) {
    
    switch mode {
        
    case .BruteForce:
        let result = find_Atleast_OneElement_GreaterThan_Itself_BruteForce(arr: arr)
        completion(result)
        
    case .Optimize:
        let result = find_Atleast_OneElement_GreaterThan_Itself_Optimize(arr: arr)
        completion(result)
    }
    
}

```
---

**How to call**
```swift

test_find_Atleast_OneElement_GreaterThan_Itself(arr: [2, 3, 5, -1, 7, 3, 9, 9], mode: .BruteForce) { count in
    print("count_brute: \(count)")
}

test_find_Atleast_OneElement_GreaterThan_Itself(arr: [2, 3, 5, -1, 7, 3, 9, 9], mode: .Optimize) { count in
    print("count_optimize: \(count)")
}

```
