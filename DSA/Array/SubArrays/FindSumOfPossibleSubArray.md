
 > Find sum of all possible subarray of an array?
 

func findSumOfPossibleSubArrays(arr: [Int]) -> Int {
    var sum = 0
    let n = arr.count
    
    for i in 0..<n {
        let possibleSubArrayForI = (i+1)*(n-i)
        sum += arr[i]*possibleSubArrayForI
    }
    
    return sum
}

public func testFindSumOfPossibleSubArrays(arr: [Int], completion: (Int)->Void) {
    let result = findSumOfPossibleSubArrays(arr: arr)
    completion(result)
}
