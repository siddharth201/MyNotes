
## Q. Given an array find the length of smallest sub-array which contains Min and Max of array  

**Example**
```swift
arr = [1, 2, 3, 1, 3, 4, 6, 4, 6, 3]
min = 1
max = 6

Smallest subarray containing both = [1, 3, 4, 6]
Length = 4
```  

**Solution**  

```swift
func smallestSubarrayMinMaxBruteForce(arr: [Int]) -> Int {
    let n = arr.count
    if n == 0 { return 0 }
    
    let (_min, _max) = findMinMax(arr: arr)
    
    var length = n
    
    for i in 0..<n {
        if arr[i] == _min {
            for j in i+1..<n {
                if arr[j] == _max {
                    length = min(length, j-i+1)
                }
            }
        } else if arr[i] == _max {
            for j in i+1..<n {
                if arr[j] == _min {
                    length = min(length, j-i+1)
                }
            }
        }
    }
    
    return length
}
```

**Time Complexity**

Finding min & max → O(n)<br/>
Nested loops → O(n²)<br/>

Overall:<br/>  
O(n²)<br/>


```swift
func smallestSubarrayMinMaxOptimize(arr: [Int]) -> Int {
    let n = arr.count
    if n == 0 { return 0 }

    let (minVal, maxVal) = findMinMax(arr: arr)
    if minVal == maxVal { return 1 }

    var minIndex = -1
    var maxIndex = -1
    var ans = n

    for i in 0..<n {
        if arr[i] == minVal {
            minIndex = i
            if maxIndex != -1 {
                ans = min(ans, i - maxIndex + 1)
            }
        }

        if arr[i] == maxVal {
            maxIndex = i
            if minIndex != -1 {
                ans = min(ans, i - minIndex + 1)
            }
        }
    }

    return ans
}
```  

**Time Complexity**  
O(n)

**Space Complexity**  
O(1)  

**Helper**  
  
```swift
func findMinMax(arr: [Int]) -> (min: Int, max: Int) {
    var min: Int = arr[0]
    var max: Int = arr[0]
    
    for i in 1..<arr.count {
        if arr[i] < min {
            min = arr[i]
        }
        if arr[i] > max {
            max = arr[i]
        }
    }
    
    return (min, max)
}
```

```swift
public func test_smallestSubarrayMinMax() {
    let arr1 = [1, 2, 3, 1, 3, 4, 6, 4, 6, 3]
    //expected = 4
    
   let result_bruteforce = smallestSubarrayMinMaxBruteForce(arr: arr1)
    
    let result_optimize = smallestSubarrayMinMaxOptimize(arr: arr1)
    
    print(result_bruteforce)
    print(result_optimize)
}
```

