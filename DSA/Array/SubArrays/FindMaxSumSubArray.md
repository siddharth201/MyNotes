> **Given an array, find max sum subarray.** 

func findmaxSumSubArray(arr: [Int]) -> Int {
    var maxSum = Int.min
    let n = arr.count
    
    for i in 0..<n {
        var sum = 0
        for j in i..<n {
            sum += arr[j]
            
            if maxSum < sum {
                maxSum = sum
            }
        }
    }
    return maxSum
}

public func testFindmaxSumSubArray(arr: [Int], completion: (Int)->Void) {
    let result = findmaxSumSubArray(arr: arr)
    completion(result)
}
