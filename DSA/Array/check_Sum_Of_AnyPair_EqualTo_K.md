
>  ** Q. Given an array, check if sum of any pair of different elements is equal to k**

**Example**  

```swift

arr = [3, 5, 1, 2]
k = 6


Pairs:

(5,1) → return true  

```  

---  

**Solution :**  

```swift  

public enum Mode {
    case BruteForce
    case Optimize1
    case Optimize2
}  

```


**Brute Force**  
```swift

func check_Sum_Of_AnyPair_EqualTo_K_BruteForce(arr: [Int], k: Int) -> Bool {
    let n = arr.count
    if n < 2 { return false }
    
    for i in 0..<n {
        for j in i+1..<n {
            if arr[i]+arr[j] == k {
                return true
            }
        }
    }
    
    return false
}

```  

**Time Complexity**

Worst case (no valid pair):

n(n−1)​/2 => O(n2)

**Space Complexity**
O(1)  

---  


**Optimize (HashSet)**
```swift

func check_Sum_Of_AnyPair_EqualTo_K_Optimize_HashSet(arr: [Int], k: Int) -> Bool {
    let n = arr.count
    if n < 2 { return false }
    
    var seen = Set<Int>()
    
    for element in arr {
        let complement = k - element
        
        if seen.contains(complement){
            return true
        }
        
        seen.insert(element)
    }

    return false
}

```  

**Time Complexity**
O(n)

**Space Complexity**
O(n)  

---  


**Optimize (Sorted - TwoPointer)**
```swift

func check_Sum_Of_AnyPair_EqualTo_K_Optimize_Sorted_TwoPointer(arr: [Int], k: Int) -> Bool {
    let n = arr.count
    if n < 2 { return false }
    
    let sortedArr = arr.sorted()
    
    var left = 0
    var right = n-1
    
    while (left < right) {
        let sum = sortedArr[left] + sortedArr[right]
        
        if sum == k {
            return true
        } else if sum < k {
            left += 1
        } else {
            right -= 1
        }
    }
    
    return false
}

```  

**Time Complexity**
O(n log n)  // sorting

**Space Complexity**
O(1) or O(n) depending on sort implementation  

---  

**Helper**
```swift

public func test_check_Sum_Of_AnyPair_EqualTo_K(arr: [Int], k: Int, mode: Mode, completion: (Bool) -> Void) {
    
    switch mode {
        
    case .BruteForce:
        let result = check_Sum_Of_AnyPair_EqualTo_K_BruteForce(arr: arr, k: k)
        completion(result)
        
    case .Optimize1:
        let result = check_Sum_Of_AnyPair_EqualTo_K_Optimize_HashSet(arr: arr, k: k)
        completion(result)
        
    case .Optimize2:
        let result = check_Sum_Of_AnyPair_EqualTo_K_Optimize_Sorted_TwoPointer(arr: arr, k: k)
        completion(result)
        
    }

}

```  

---  

**How to call**
```swift  

test_check_Sum_Of_AnyPair_EqualTo_K(arr: [3, -2, 5, 7, 2, -1], k: 12, mode: .BruteForce) { result in
    print("check_brute: \(result)")
}

test_check_Sum_Of_AnyPair_EqualTo_K(arr: [3, -2, 5, 7, 2, -1], k: 12, mode: .Optimize1) { result in
    print("check_optimize_hash_set: \(result)")
}

test_check_Sum_Of_AnyPair_EqualTo_K(arr: [3, -2, 5, 7, 2, -1], k: 12, mode: .Optimize2) { result in
    print("check_optimize_sorted_two_pointer: \(result)")
}  

```

