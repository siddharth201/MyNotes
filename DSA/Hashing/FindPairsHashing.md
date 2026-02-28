>> **Q. Given N array elements, check if there exist a pair (i, j) such that, arr[i] + arr[j] = k & i != j**  

### HashSet
```swift
func findPairs(_ arr: [Int], _ k: Int) -> Bool {
    var set = Set<Int>()
    
    for item in arr {
        if set.contains(k-item) {
            return true
        }
        set.insert(item)
    }
    
    return false
}
```  
### Complexity

**Time:** `O(n)`  
**Space:** `O(n)`  

### HashMap
```swift
func findPairsHashMap(_ arr: [Int], _ k: Int) -> (Int, Int)? {
    var map = [Int: Int]()
    
    for (i, element) in arr.enumerated() {
        
        if let j = map[k-element] {
            return (i, j)
        }
        
       map[element] = i
    }
    
    return nil
}
```  

### Complexity

**Time:** `O(n)`  
**Space:** `O(n)`   

```swift
public func testFindPairsHashSet(_ arr: [Int], _ k: Int, completion: (Bool)->Void) {
    let result_set = findPairsHashSet(arr, k)
    completion(result_set)
}

public func testFindPairsHashMap(_ arr: [Int], _ k: Int, completion: ((Int, Int)?)->Void) {
    let result_map = findPairsHashMap(arr, k)
    completion(result_map)
}
```  
  
**How to Call**
```swift  
testFindPairsHashSet([1,3,5,10,20,23,30], 23) { result in
   print(result)
}

testFindPairsHashMap([1,3,5,10,20,23,30], 23) { result in
    print(result!.0)
    print(result!.1)
}  
```
