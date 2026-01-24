
> Given N array elements, count number of equilibrium index.
> An index `i` is an **equilibrium index** if
> **sum of elements before `i` == sum of elements after `i`**

Important:

* `arr[i]` itself is **excluded** from both sides
* We need to **count** all such indices

---  

**Solution**
```swift
func countIquilibriumIndex(arr: [Int]) -> Int {
    let n = arr.count
    if n == 0 { return  0 }
    
    var count = 0
    
    var prefixSum = Array(repeating: 0, count: n)
    prefixSum[0] = arr[0]
    
    for i in 1..<n {
        prefixSum[i] = prefixSum[i-1] + arr[i]
    }
    
    for i in 0..<n {
        var ls = 0
        var rs = 0
        
        if i == 0 {
            rs = prefixSum[n-1] - prefixSum[i]
        } else if i == n-1 {
            ls = prefixSum[i-1]
        } else {
            ls = prefixSum[i-1]
            rs = prefixSum[n-1] - prefixSum[i]
        }
        
        if ls == rs {
            count += 1
        }
        
    }
    
    return count
}
```  
**Time & Space Complexity**
| Metric | Value  |
| ------ | ------ |
| Time   | `O(n)` |
| Space  | `O(n)` |


**Helper**
```swift
public func test_countIquilibriumIndex(arr: [Int], completion: (Int) -> Void) {
    let result = countIquilibriumIndex(arr: arr)
    completion(result)
}
```

  
**How to Call**
```swift
test_countIquilibriumIndex(arr: [-3, 2, 4, -1]) { result in
    print(result)
}

test_countIquilibriumIndex(arr: [ -7, 1, 5, 2, -4, 3, 0 ]) { result in
    print(result)
}
```  




## 3️⃣ Minor Issues / Improvements

### 🔸 Issue 1: Too many condition checks (can be simplified)

This block:

```swift
if i == 0 {
    rs = prefixSum[n-1] - prefixSum[i]
} else if i == n-1 {
    ls = prefixSum[i-1]
} else {
    ls = prefixSum[i-1]
    rs = prefixSum[n-1] - prefixSum[i]
}
```

Can be simplified into **one uniform formula**.

---

### 🔸 Issue 2: Extra space not required

You **don’t actually need** a prefix array.

This problem can be solved in:

```
O(n) time
O(1) extra space
```

This is often expected in interviews.

---

## 4️⃣ Key Optimization Insight (VERY IMPORTANT)

Let:

```
totalSum = sum of all elements
leftSum  = sum of elements before index i
```

Then:

```
rightSum = totalSum - leftSum - arr[i]
```

Equilibrium condition:

```
leftSum == rightSum
```

---

## 5️⃣ Optimized Version (O(1) Space) ⭐

### ✅ Best solution

```swift
func countEquilibriumIndex(arr: [Int]) -> Int {
    let n = arr.count
    if n == 0 { return 0 }

    let totalSum = arr.reduce(0, +)
    var leftSum = 0
    var count = 0

    for i in 0..<n {
        let rightSum = totalSum - leftSum - arr[i]
        if leftSum == rightSum {
            count += 1
        }
        leftSum += arr[i]
    }

    return count
}
```

---

## 6️⃣ Walkthrough Example (Layman)

```swift
arr = [ -7, 1, 5, 2, -4, 3, 0 ]
totalSum = 0
```

| i | leftSum | arr[i] | rightSum | equilibrium |
| - | ------- | ------ | -------- | ----------- |
| 0 | 0       | -7     | 7        | ❌           |
| 1 | -7      | 1      | 6        | ❌           |
| 2 | -6      | 5      | 1        | ❌           |
| 3 | -1      | 2      | -1       | ✅           |
| 4 | 1       | -4     | 3        | ❌           |
| 5 | -3      | 3      | 0        | ❌           |
| 6 | 0       | 0      | 0        | ✅           |

Answer = **2**

---

## 7️⃣ Prefix Sum vs Optimized Approach

| Approach        | Time | Space | Notes                    |
| --------------- | ---- | ----- | ------------------------ |
| Your Prefix Sum | O(n) | O(n)  | Clear, beginner-friendly |
| Optimized       | O(n) | O(1)  | Interview-preferred ⭐    |

Both are **correct** — optimized is just cleaner.

---

## 8️⃣ Interview-Ready Explanation (Memorize)

> “At each index, I maintain the sum of elements to the left.
> The sum on the right is total sum minus left sum minus current element.
> If both are equal, the index is an equilibrium index.”

---

## 9️⃣ Final Verdict

### ✅ What you did RIGHT

✔ Correct prefix sum usage
✔ Correct edge handling
✔ Clean and readable logic
✔ Correct complexity

### 🔧 What you can improve

* Reduce conditions
* Eliminate extra space

---



