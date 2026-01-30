

 ## Q. Given an array, find leaders. Leader is defined as if an element is greater than all the elements on the right of it. <br/>arr[N-1] will always be a leader  
 
 **Example:**
```swift
[16, 17, 4, 3, 5, 2]
→ Leaders = [17, 5, 2]
```  
**Solution:**  

```swift
func findLeaders(arr: [Int]) -> [Int] {
    let n = arr.count
    if n == 0 { return []}
    
    var result: [Int] = []
    
    var currentLeader = Int.min
   
    for i in stride(from: n-1, through: 0, by: -1) {
        if arr[i] > currentLeader {
            currentLeader = arr[i]
            result.append(currentLeader)
        }
    }
    return result
}
```

```swift
public func testFindLeaders() {
    let arr1 = [16, 17, 4, 3, 5, 2]
    let expected1 = [17, 5, 2]
    
    let result = findLeaders(arr: arr1)
    
    print(result)
    
    // Output: [2, 5, 17]
}
```


## Time & Space Complexity
**Time**
O(n)  

**Space**
O(k)  

where k = number of leaders  
(inevitable, since output itself needs space)
