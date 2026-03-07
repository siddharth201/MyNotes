
> **Given an array check if any subarray has sum k.**

```swift
func checkSubArrayWithSumK_carryforword(arr: [Int], _ k: Int) -> Bool {
    let n = arr.count
    
    for i in 0..<n {
        var sum = 0
        for j in i..<n {
            sum += arr[j]
            
            if sum == k {
                return true
            }
        }
    }
    
    return false
}
```  

**Time & Space Complexity**
**Time:** O(n²)  
**Space:** O(1)  


```swift
func checkSubArrayWithSumK_prefixsum_hashing(_ nums: [Int], _ k: Int) -> Bool {
    
    var seenPrefixSums = Set<Int>()
    var currentPrefixSum = 0
    
    for num in nums {
        currentPrefixSum += num
        
        if currentPrefixSum == k || seenPrefixSums.contains(currentPrefixSum - k) {
            return true
        }
        
        seenPrefixSums.insert(currentPrefixSum)
    }
    
    return false
}
```
**Time & Space Complexity**
**Time:** O(n)  
**Space:** O(1)  

```swift
public func testCheckSubArrayWithSumK_CarryForwod(_ nums: [Int], _ k: Int, completion: (Bool) -> Void) {
    let result = checkSubArrayWithSumK_carryforword(arr: nums, k)
    completion(result)
}

public func testCheckSubArrayWithSumK_PrefixSum_Hashing(_ nums: [Int], _ k: Int, completion: (Bool) -> Void) {
    let result = checkSubArrayWithSumK_prefixsum_hashing(nums, k)
    completion(result)
}
```  

**How to Call**
```swift
testCheckSubArrayWithSumK_CarryForwod([3,4,-7,1,3,3,1,-4], 7) { result in
    print(result)
}
testCheckSubArrayWithSumK_PrefixSum_Hashing([3,4,-7,1,3,3,1,-4], 7) { result in
    print(result)
}
```
