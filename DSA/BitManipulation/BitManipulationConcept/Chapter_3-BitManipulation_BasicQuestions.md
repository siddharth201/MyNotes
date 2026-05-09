## Bit Manipulation Practice-First Revision Sheet

Progressive practice from absolute basics → interview foundation.

Each problem contains:

* Goal
* Thinking pattern
* Solution
* Reasoning

---

## Level 1 — Binary & Basic Operators

---

## Problem 1 — Odd or Even

## Problem

Check if a number is odd or even.

---

## Core Idea

In binary:

Even numbers end with:

```text id="8shfcu"
0
```

Odd numbers end with:

```text id="f5b5mz"
1
```

So check last bit using AND.

---

## Solution

```swift id="9xz8sy"
func isOdd(_ n: Int) -> Bool {
    return (n & 1) == 1
}
```

---

## Reasoning

`1 = 0001`

So:

```text id="46jlwm"
n & 1
```

keeps only last bit.

If last bit is 1 → odd.

---

## Problem 2 — Multiply by 2

## Problem

Multiply number by 2 using bit manipulation.

---

## Solution

```swift id="x8a7cx"
let result = n << 1
```

---

## Reasoning

Left shift moves bits left.

Each shift doubles place value.

```text id="2rby79"
5 = 0101
10 = 1010
```

---

## Problem 3 — Divide by 2

## Problem

Divide by 2 using bits.

---

## Solution

```swift id="dhzcux"
let result = n >> 1
```

---

## Reasoning

Right shift removes last bit.

Equivalent to floor division by 2.

---

## Problem 4 — Check ith Bit

## Problem

Check if ith bit is ON.

---

## Solution

```swift id="f2l7ny"
func isBitSet(_ n: Int, _ i: Int) -> Bool {
    return (n & (1 << i)) != 0
}
```

---

## Reasoning

```text id="1zom0o"
1 << i
```

creates mask with only ith bit ON.

AND isolates that bit.

---

## Problem 5 — Set ith Bit

## Problem

Turn ith bit ON.

---

## Solution

```swift id="92pmwp"
func setBit(_ n: Int, _ i: Int) -> Int {
    return n | (1 << i)
}
```

---

## Reasoning

OR with 1 forces bit to become 1.

---

## Problem 6 — Clear ith Bit

## Problem

Turn ith bit OFF.

---

## Solution

```swift id="rz5mfr"
func clearBit(_ n: Int, _ i: Int) -> Int {
    return n & ~(1 << i)
}
```

---

## Reasoning

Mask contains 0 only at ith position.

AND clears that bit.

---

## Problem 7 — Toggle ith Bit

## Problem

Flip ith bit.

---

## Solution

```swift id="clh3fy"
func toggleBit(_ n: Int, _ i: Int) -> Int {
    return n ^ (1 << i)
}
```

---

## Reasoning

XOR with 1 flips bit.

```text id="r4yb3v"
0 ^ 1 = 1
1 ^ 1 = 0
```

---

## Level 2 — Set Bits & Power Patterns

---

## Problem 8 — Count Set Bits (Brute Force)

## Problem

Count number of 1s in binary.

---

## Solution

```swift id="jztpn9"
func countBits(_ n: Int) -> Int {
    var num = n
    var count = 0
    
    while num > 0 {
        count += num & 1
        num >>= 1
    }
    
    return count
}
```

---

## Reasoning

Check last bit repeatedly.

---

## Problem 9 — Count Set Bits (Optimized)

## Problem

Optimize previous solution.

---

## Solution

```swift id="6h3p6v"
func countBitsOptimized(_ n: Int) -> Int {
    var num = n
    var count = 0
    
    while num > 0 {
        num &= (num - 1)
        count += 1
    }
    
    return count
}
```

---

## Reasoning

n & (n-1)

removes rightmost set bit.

Loop runs only for set bits.

---

## Problem 10 — Power of 2

## Problem

Check if number is power of 2.

---

## Solution

```swift id="1l5x4z"
func isPowerOfTwo(_ n: Int) -> Bool {
    return n > 0 && (n & (n - 1)) == 0
}
```

---

## Reasoning

Power of 2 has exactly one set bit.

Example:

```text id="lyib2u"
8  = 1000
7  = 0111
```

AND becomes zero.

---

## Problem 11 — Remove Rightmost Set Bit

## Problem

Remove lowest set bit.

---

## Solution

```swift id="s6w4yb"
let result = n & (n - 1)
```

---

## Reasoning

Classic bit trick.

Example:

```text id="qovkt6"
1100 -> 1000
1010 -> 1000
```

---

## Problem 12 — Extract Rightmost Set Bit

## Problem

Get lowest set bit only.

---

## Solution

```swift id="a5uc74"
let result = n & -n
```

---

## Reasoning

Keeps only lowest active 1.

Example:

```text id="n7o4fi"
12 = 1100
result = 0100
```

---

## Level 3 — XOR Foundation Problems

---

# Problem 13 — Single Number

## Problem

Every element appears twice except one.

Find unique element.

Example:

```text id="w3cqis"
[2,1,2,4,1]
```

Answer = 4

---

## Solution

```swift id="01tt2q"
func singleNumber(_ nums: [Int]) -> Int {
    var result = 0
    
    for num in nums {
        result ^= num
    }
    
    return result
}
```

---

## Reasoning

Duplicates cancel:

a \oplus a = 0

Only unique survives.

---

## Problem 14 — Missing Number

## Problem

Array contains numbers from 0...n with one missing.

Find missing number.

Example:

```text id="kkqj6z"
[3,0,1]
```

Missing = 2

---

## Solution

```swift id="2g8hyn"
func missingNumber(_ nums: [Int]) -> Int {
    var xor = nums.count
    
    for i in 0..<nums.count {
        xor ^= i ^ nums[i]
    }
    
    return xor
}
```

---

## Reasoning

All matching numbers cancel.

Missing number remains.

---

## Problem 15 — Find Two Unique Numbers

## Problem

Every element appears twice except two numbers.

Example:

```text id="4j03ma"
[1,2,1,3,2,5]
```

Answer = [3,5]

---

## Core Idea

1. XOR all numbers.
2. Result = XOR of two unique numbers.
3. Find differing bit.
4. Split into groups.

---

## Solution

```swift id="r9zlgm"
func singleNumberIII(_ nums: [Int]) -> [Int] {
    var xor = 0
    
    for num in nums {
        xor ^= num
    }
    
    let diffBit = xor & -xor
    
    var a = 0
    var b = 0
    
    for num in nums {
        if (num & diffBit) == 0 {
            a ^= num
        } else {
            b ^= num
        }
    }
    
    return [a, b]
}
```

---

## Reasoning

Different bit separates two unique numbers.

---

## Level 4 — Bitmask & Subsets

---

## Problem 16 — Generate All Subsets

## Problem

Generate all subsets.

Example:

```text id="14u4k7"
[1,2]
```

Subsets:

```text id="3pl1y7"
[]
[1]
[2]
[1,2]
```

---

## Core Idea

For n elements:

```text id="xy97up"
2^n subsets
```

Each bit decides:

* take element
* or not

---

## Solution

```swift id="dbpc17"
func subsets(_ nums: [Int]) -> [[Int]] {
    let n = nums.count
    var result: [[Int]] = []
    
    for mask in 0..<(1 << n) {
        var subset: [Int] = []
        
        for i in 0..<n {
            if (mask & (1 << i)) != 0 {
                subset.append(nums[i])
            }
        }
        
        result.append(subset)
    }
    
    return result
}
```

---

## Reasoning

Binary mask represents subset.

Example:

```text id="71gpr0"
00 -> []
01 -> [1]
10 -> [2]
11 -> [1,2]
```

---

## Problem 17 — Check if Exactly One Bit Set

## Problem

Check if integer contains only one set bit.

---

## Solution

Same as power of 2.

```swift id="kv2nn4"
n > 0 && (n & (n - 1)) == 0
```

---

## Reasoning

Only one bit survives.

---

## Problem 18 — Swap Without Temp

## Problem

Swap two numbers without temp variable.

---

## Solution

```swift id="f2b3ly"
a ^= b
b ^= a
a ^= b
```

---

## Reasoning

XOR reversibility:

```text id="4wp4v6"
a ^ b ^ b = a
```

---

## Problem 19 — Check if Number is Even Using XOR/AND Understanding

## Problem

Determine parity.

---

## Solution

```swift id="lwx0xm"
(n & 1) == 0
```

---

## Reasoning

Last bit:

* 0 => even
* 1 => odd

---

## Problem 20 — Find Binary Representation

## Problem

Convert integer to binary manually.

---

## Solution

```swift id="mjlwm2"
func binary(_ n: Int) -> String {
    var num = n
    var result = ""
    
    while num > 0 {
        result = "\(num & 1)" + result
        num >>= 1
    }
    
    return result
}
```

---

## Reasoning

Repeatedly extract last bit.

---

## Most Important Patterns Learned

---

## Pattern 1 — Mask Creation

1 \ll i

Creates mask with only ith bit ON.

---

## Pattern 2 — Check Bit

n & (1 \ll i)

---

## Pattern 3 — Remove Rightmost Set Bit

n & (n-1)

---

## Pattern 4 — XOR Cancellation

a \oplus a = 0

---

## Pattern 5 — Extract Lowest Set Bit

n & -n

---

## Recognition Guide

Think Bit Manipulation When You See:

| Signal         | Likely Pattern  |
| -------------- | --------------- |
| odd/even       | AND             |
| unique element | XOR             |
| subsets        | bitmask         |
| flags/states   | masks           |
| power of 2     | `n&(n-1)`       |
| count bits     | Brian Kernighan |
| toggle         | XOR             |

---

## Recommended Practice Order

Do in this exact order:

1. Odd/even
2. Check ith bit
3. Set/Clear/Toggle bit
4. Count set bits
5. Power of 2
6. Single number
7. Missing number
8. Subsets
9. Two unique numbers

---

## Final Goal

After mastering these 20 problems, you should comfortably:

* read binary,
* understand masks,
* use XOR naturally,
* recognize bit patterns in interviews,
* and solve foundational bit-manipulation DSA problems confidently.

