
> Q. Given:  </br>  An integer array `arr`
          </br>     An integer `k`</br></br> 
Find the **maximum sum of any contiguous subarray of size `k`**.  

func maxSum(_ arr: [Int], _ k: Int) -> Int {
    guard arr.count >= k else { return 0}
    var maxSum = Int.min
    var windowSum = 0
    
    for right in 0..<arr.count-1 {
        windowSum = windowSum + arr[right] //expand
        
        if right >= k-1 {
            maxSum = max(maxSum, windowSum) //process
            windowSum = windowSum - arr[right - k + 1]
        }
    }
    return maxSum
}

public func testMaxSum(_ arr: [Int], _ k: Int, completion: (Int) -> Void) {
    let result = maxSum(arr, k)
    completion(result)
} 

