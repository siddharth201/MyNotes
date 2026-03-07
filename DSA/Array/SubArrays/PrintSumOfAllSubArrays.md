> Given an array print sum of all subarrays individually.**

```swift
func printSumOfAllSubArrays_BruteForce(arr: [Int]) {
    let n = arr.count-1
    
    for start in 0...n {
        for end in start...n {
            
            var sum = 0
            for k in start...end {
                sum += arr[k]
            }
            
            print(sum)
        }
    }
}
```



func printSumOfAllSubArrays_PrefixSum(arr: [Int]) {
    let n = arr.count
    
    var prefixArr = Array(repeating:0, count: n)
    prefixArr[0] = arr[0]
    
    for i in 1..<n {
        prefixArr[i] = prefixArr[i-1] + arr[i]
    }
    
    for start in 0..<n {
        for end in start..<n {
            
            var sum = 0
            if start == 0 {
                sum = prefixArr[end]
            } else {
                sum = prefixArr[end] - prefixArr[start-1]
            }
            
            print(sum)
        }
    }
}

func printSumOfAllSubArrays_CarryForword(arr: [Int]) {
    let n = arr.count
    
    for i in 0..<n {
        var sum = 0
        for j in i..<n {
            sum += arr[j]
            print(sum)
        }
    }
}

public func testPrintSumOfAllSubArrays(arr: [Int]) {
    printSumOfAllSubArrays_BruteForce(arr: arr)
    print("\n")
    printSumOfAllSubArrays_PrefixSum(arr: arr)
    print("\n")
    printSumOfAllSubArrays_CarryForword(arr: arr)
}

testPrintSumOfAllSubArrays(arr: [3,4,5,-1])
