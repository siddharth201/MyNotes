> Q. Given an array, print **start and end indices** of all subarrays of size `k`  

### Example:  
```swift
arr = [1,2,3,4,5]
k = 3
```    

### Output  
```swift
(0,2)
(1,3)
(2,4)
```  

### Solution:  

#### BruteForce  
```swift
func printIndicesOfSubArrays(array arr: [Int], size k: Int) {
    let n = arr.count
    
    if n < k {
        return
    }
    
    for i in 0...n-k {
        let s = i
        var e = i
        for j in i..<i+k {
            e = j
        }
        print("\(s), \(e)")
    }
}
``` 
#### Complexity
```swift
Time = O(n*k)  
Space = O(1)
``` 

#### Simplified Brute Force  
```swift
func printIndicesOfSubArrays(array arr: [Int], size k: Int) {
    let n = arr.count
    
    if n < k { return }
    
    for i in 0...n-k {
        let s = i
        let e = i + k - 1
        print("\(s), \(e)")
    }
}
```  

#### Complexity
```swift
Time = O(n)  
Space = O(1)
```  

#### Optimize
```swift
func printSubarrayIndices(_ arr: [Int], _ k: Int) {
    var left = 0
    
    for right in 0..<arr.count {
        
        // expand happens automatically by moving right
        
        if right-left+1 == k {
            print("\(left), \(right)")
            
            // shrink
            left += 1
        }
    }
}
```   

#### Complexity
```swift
Time = O(n)  
Space = O(1)
``` 

#### Helping Method
```swift
public func testPrintIndicesOfSubArrays(array arr: [Int], size k: Int) {
    print("====BruteForce====")
    printIndicesOfSubArrays(array: arr, size: k)
    print("\n")
    print("====Optimize====")
    printSubarrayIndices(arr, k)
}
```  

#### How To Call  
```swift
testPrintIndicesOfSubArrays(array: [5, 6, -1, 0, 3, 2, 7, 4, 1], size: 3)
```

