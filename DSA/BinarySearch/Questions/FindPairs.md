> **Q. Given a sorted array and an integer k find a pair (i, j) such that A[i]+A[j] = k using binary search.**  

```swift
func findPairUsingBinarySearch(_ nums: [Int], _ k: Int) -> (Int, Int)? {
    let n = nums.count-1
    if n == 0 { return nil}
    
    for i in 0..<n {
        let target = k - nums[i]
        var left = i+1
        var right = n
        
        while left <= right {
            let mid = left + (right-left) / 2
            
            if nums[mid] == target {
                return(i,mid)
            }
            
            if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
    }
     
    return nil
}

public func testFindPairUsingBinarySearch(
    _ nums: [Int],
    _ k: Int,
    completion: (((Int,Int)?) -> Void)
) {
    let result = findPairUsingBinarySearch(nums, k)
    completion(result)
}

testFindPairUsingBinarySearch([1,3,5,10,20,23,30], 23) { result in
    print(result!.0)
    print(result!.1)
}  
``` 


**Time Complexity:** `O(nlogn)`  
**Space Complexity :** `O(1)`
