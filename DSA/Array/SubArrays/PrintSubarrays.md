> Given an array and indices s and e, print all subarrays between s and e.

func printSubarrays(_ arr: [Int], _ s: Int, _ e: Int) {
    for start in s...e {
        for end in start...e {
            
            var subarrays: [Int] = []
            
            for k in start...end {
                subarrays.append(arr[k])
            }
            
            print(subarrays)
        }
    }
}

public func testPrintSubarrays(_ arr: [Int], _ s: Int, _ e: Int) {
    printSubarrays(arr, s, e)
}

testPrintSubarrays([1,2,5,6,-1], 2, 3)
