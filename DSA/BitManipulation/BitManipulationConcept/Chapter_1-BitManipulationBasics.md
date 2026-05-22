
## Bit Manipulation: Complete Beginner-to-Foundation Tutorial

Bit manipulation means solving problems by working directly with the **binary representation** of numbers.

A number in memory is ultimately stored as **bits**:

* `0`
* `1`

These bits can be combined, checked, turned on/off, shifted, and compared using bitwise operators.

Bit manipulation is useful because it is:

* fast,
* memory efficient,
* and often reveals elegant patterns in DSA problems.

---

## 1) Why bit manipulation matters

Bit manipulation is useful when a problem has one or more of these traits:

### A. Binary property of a number

Examples:

* odd/even
* power of 2
* count number of set bits
* reverse bits

These are natural because numbers are already stored in binary.

### B. Repetition / cancellation patterns

Examples:

* every element appears twice except one
* every element appears thrice except one
* find unique numbers

These often use XOR.

### C. Subsets and combinations

If a set has `n` elements, there are `2^n` possible subsets.

A bit can represent:

* `0` = not chosen
* `1` = chosen

So bitmasking becomes a very natural way to represent subsets.

### D. Yes/No flags or states

Examples:

* permissions
* visited states
* feature flags
* toggles

A bit is perfect for storing binary state.

### E. Need for space or speed optimization

Sometimes a hashmap or array is possible, but bitwise operations give a cleaner and faster solution.

---

## 2) Binary basics

Humans usually use **base 10**.

Example:

* `345 = 3×100 + 4×10 + 5×1`

Computers use **base 2**.

That means every digit position is a power of 2:

* `1`
* `2`
* `4`
* `8`
* `16`
* `32`
* `64`
* ...

So binary is just a sum of powers of 2.

### Example: 13

`13 = 8 + 4 + 1`

So the binary representation is:

`1101`

Meaning:

* `8` → `1`
* `4` → `1`
* `2` → `0`
* `1` → `1`

So:

`13 = 1101₂`

### Example: 10

`10 = 8 + 2`

Binary:

`1010`

Meaning:

* `8` → `1`
* `4` → `0`
* `2` → `1`
* `1` → `0`

---

## 3) Important binary terminology

### Least Significant Bit (LSB)

The **rightmost bit**.

It represents the smallest value, `1`.

### Most Significant Bit (MSB)

The **leftmost bit**.

It represents the largest active power of 2 in that number.

### Bit indexing

In bit manipulation, we usually index bits from right to left starting at `0`.

Example:

`1010`

Indexes:

* bit 3 = `1`
* bit 2 = `0`
* bit 1 = `1`
* bit 0 = `0`

So the rightmost bit is index `0`.

This indexing is very important in problems like “check ith bit”, “set ith bit”, etc.

---

## 4) Bitwise operators: what they actually do

These operators work **bit by bit**.

The main operators we learned are:

* `&` AND
* `|` OR
* `^` XOR
* `<<` left shift
* `>>` right shift

---

### 4.1 AND (`&`)

AND returns `1` only when **both bits are 1**.

Truth idea:

* `0 & 0 = 0`
* `0 & 1 = 0`
* `1 & 0 = 0`
* `1 & 1 = 1`

#### Meaning

AND is not addition.

It is a **filter**.

It keeps only the positions where both sides have `1`.

#### Example

`5 = 0101`
`3 = 0011`

Bit by bit:

`0101`
`0011`
`0001`

So:

`5 & 3 = 1`

#### How to think about AND

Think:

* “keep only common 1s”
* “intersection of bits”
* “filter using a mask”

This is the key mental model.

#### Where AND is useful

* checking whether a bit is set
* masking
* power of 2 check
* clearing bits indirectly with a NOT mask

---

### 4.2 OR (`|`)

OR returns `1` if **any one** of the bits is `1`.

Truth idea:

* `0 | 0 = 0`
* `0 | 1 = 1`
* `1 | 0 = 1`
* `1 | 1 = 1`

#### Meaning

OR combines bits.

It is used when you want to **turn a bit on**.

#### Example

`5 = 0101`
`3 = 0011`

Result:

`0111`

So:

`5 | 3 = 7`

#### Where OR is useful

* setting a bit to 1
* combining flags
* turning on features

---

### 4.3 XOR (`^`)

XOR means **exclusive OR**.

It returns `1` only when the bits are **different**.

Truth idea:

* `0 ^ 0 = 0`
* `0 ^ 1 = 1`
* `1 ^ 0 = 1`
* `1 ^ 1 = 0`

#### Meaning

XOR is a **difference detector**.

It keeps only the bits where the two numbers differ.

#### Example

`5 = 0101`
`3 = 0011`

Result:

`0110`

So:

`5 ^ 3 = 6`

#### The most important XOR properties

These are the real reason XOR is powerful in DSA:

#### 1. Self-canceling

`a ^ a = 0`

Any number XORed with itself disappears.

#### 2. Identity

`a ^ 0 = a`

XOR with zero does nothing.

#### 3. Order does not matter

`a ^ b ^ a = b`

The repeated `a`s cancel out.

#### 4. Reversible

If `a ^ b = c`, then `c ^ b = a`

That is why XOR is useful in many problems.

### Very important intuition

XOR is often thought of as:

* “addition without carry”
* “difference keeper”
* “duplicate canceller”

That is why it is so useful in problems involving unique elements.

---

## 5) Shift operators: `<<` and `>>`

These move bits left or right.

---

## 5.1 Left shift (`<<`)

Left shift moves bits to the left.

Example:

`5 = 0101`
`5 << 1 = 1010`

That is `10`.

### Meaning

Left shift is equivalent to multiplying by powers of 2:

* `n << 1 = n × 2`
* `n << 2 = n × 4`
* `n << 3 = n × 8`

So in general:

`n << k = n × 2^k`

### Why?

Because shifting left moves each bit to a position with double value.

### Use of left shift

* fast multiplication by powers of 2
* creating masks: `1 << i`

---

## 5.2 Right shift (`>>`)

Right shift moves bits to the right.

Example:

`10 = 1010`
`10 >> 1 = 0101`

That is `5`.

### Meaning

Right shift is approximately dividing by powers of 2.

* `n >> 1 = floor(n / 2)`
* `n >> 2 = floor(n / 4)`
* `n >> 3 = floor(n / 8)`

In general:

`n >> k = floor(n / 2^k)`

### Why floor?

Because when you shift right, any remainder is dropped.

Example:

* `15 / 2 = 7.5`
* `15 >> 1 = 7`

### Use of right shift

* fast division by powers of 2
* checking bits by moving them to the rightmost position

---

## 6) The mask idea: `1 << i`

This is one of the most important patterns in bit manipulation.

`1 << i` means:

* start with binary `0001`
* shift it left by `i` positions

The result is a number with **only the ith bit set to 1**.

Examples:

* `1 << 0 = 0001`
* `1 << 1 = 0010`
* `1 << 2 = 0100`
* `1 << 3 = 1000`

This is called a **mask**.

## Why mask is important

A mask is like a spotlight that highlights one bit position.

It lets you isolate, set, clear, or toggle a particular bit.

---

## 7) Check ith bit

Goal: determine whether the `i`th bit of `n` is ON or OFF.

## Formula

`n & (1 << i)`

## Why it works

* `1 << i` creates a mask with only the ith bit on.
* `&` keeps only the bits common to both.
* So after AND, only that bit can survive.

If the result is non-zero, the bit was ON.

If the result is zero, the bit was OFF.

## Example

Check bit `1` in `10`.

`10 = 1010`
`1 << 1 = 0010`

Now AND:

`1010`
`0010`
`0010`

Non-zero → bit is ON.

## Another example

Check bit `2` in `10`.

`10 = 1010`
`1 << 2 = 0100`

AND:

`1010`
`0100`
`0000`

Zero → bit is OFF.

## Code

```swift
func isBitSet(_ n: Int, _ i: Int) -> Bool {
    return (n & (1 << i)) != 0
}
```

## Another way to think

You can also write:

`(n >> i) & 1`

This means:

* move the ith bit to the rightmost side,
* then check if the last bit is 1.

Both methods are correct.

---

## 8) Set ith bit

Goal: make the ith bit `1`.

## Formula

`n | (1 << i)`

## Why it works

* `1 << i` creates a mask with the ith bit as 1.
* OR with 1 always gives 1.
* So that bit becomes ON.
* Other bits remain unchanged.

## Example

Set bit `0` in `10`.

`10 = 1010`
`1 << 0 = 0001`

OR:

`1010`
`0001`
`1011`

So result is `11`.

## Meaning

* If the bit was already `1`, it stays `1`.
* If the bit was `0`, it becomes `1`.

## Code

```swift
let result = 10 | (1 << 0)
```

---

## 9) Clear ith bit

Goal: make the ith bit `0`.

## Formula

`n & ~(1 << i)`

## Why it works

* `1 << i` gives a mask with one bit on.
* `~` flips it, so that position becomes `0` and all others become `1`.
* AND with that mask clears only that bit.

## Example

Clear bit `1` in `10`.

`10 = 1010`
`1 << 1 = 0010`
`~0010 = 1101`

AND:

`1010`
`1101`
`1000`

Result = `8`

## Meaning

* That target bit becomes `0`.
* Other bits stay unchanged.

## Code

```swift
let result = 10 & ~(1 << 1)
```

---

## 10) Toggle ith bit

Goal: flip the ith bit.

* `0 → 1`
* `1 → 0`

## Formula

`n ^ (1 << i)`

## Why it works

XOR flips bits when the mask bit is `1`.

* if current bit is `0`, `0 ^ 1 = 1`
* if current bit is `1`, `1 ^ 1 = 0`

So XOR is perfect for toggling.

## Example

Toggle bit `1` in `10`.

`10 = 1010`
`1 << 1 = 0010`

XOR:

`1010`
`0010`
`1000`

Result = `8`

If you toggle the same bit again, it returns to original value.

## Code

```swift
let result = 10 ^ (1 << 1)
```

---

## 11) Summary of the four basic bit actions

This is one of the most useful memory rules in bit manipulation:

## Check bit

Use `&`

## Set bit

Use `|`

## Clear bit

Use `&` with NOT mask

## Toggle bit

Use `^`

A simple way to remember:

* **Check** → AND
* **Set** → OR
* **Clear** → AND + NOT
* **Toggle** → XOR

---

## 12) Count set bits

Set bits are the number of `1`s in the binary representation.

Example:

`13 = 1101`

Number of set bits = `3`

This is also called:

* popcount
* Hamming weight
* number of 1 bits

---

## 12.1 Brute force method

Check the last bit repeatedly.

### Logic

* If `(n & 1) == 1`, increase count.
* Then do `n >> 1`.
* Repeat until number becomes zero.

### Example

`13 = 1101`

Steps:

* last bit = 1 → count = 1
* shift → `110`
* last bit = 0
* shift → `11`
* last bit = 1 → count = 2
* shift → `1`
* last bit = 1 → count = 3

### Code

```swift
func countBits(_ n: Int) -> Int {
    var num = n
    var count = 0

    while num > 0 {
        if (num & 1) == 1 {
            count += 1
        }
        num >>= 1
    }

    return count
}
```

---

## 12.2 Optimized method: Brian Kernighan’s algorithm

This is the classic optimization.

### Key idea

`n & (n - 1)` removes the **rightmost set bit**.

### Example

`13 = 1101`

* `13 & 12 = 1101 & 1100 = 1100`
* `12 & 11 = 1100 & 1011 = 1000`
* `8 & 7 = 1000 & 0111 = 0000`

Each operation removes one set bit.

So if the number has `k` set bits, the loop runs `k` times.

### Code

```swift
func countBitsOptimized(_ n: Int) -> Int {
    var num = n
    var count = 0

    while num > 0 {
        num = num & (num - 1)
        count += 1
    }

    return count
}
```

### Why this is good

It is very efficient when the number has few set bits.

---

## 13) Power of 2 pattern

A number is a power of 2 if and only if it has **exactly one set bit**.

Examples:

* `1 = 0001`
* `2 = 0010`
* `4 = 0100`
* `8 = 1000`
* `16 = 10000`

Each has exactly one `1`.

## Core trick

`n & (n - 1) == 0`

But this only works properly if `n > 0`.

So the full condition is:

`n > 0 && (n & (n - 1)) == 0`

## Why this works

When a power of 2 has one bit set, subtracting 1 turns that bit into `0` and all smaller bits into `1`.

Example:

`8 = 1000`
`7 = 0111`

AND:

`1000 & 0111 = 0000`

So the result becomes zero.

For a non-power-of-2, multiple bits exist, so the result will not be zero.

## Example

`10 = 1010`
`9 = 1001`

AND:

`1010 & 1001 = 1000`

Not zero → not power of 2.

## Code

```swift
func isPowerOfTwo(_ n: Int) -> Bool {
    return n > 0 && (n & (n - 1)) == 0
}
```

---

## 14) XOR in depth

XOR was one of the most important ideas in this chat, so let’s summarize it fully.

## What XOR does exactly

XOR means:

* same bits → `0`
* different bits → `1`

So it is like a **difference detector**.

## What purpose XOR serves

XOR is useful when you want to:

* cancel duplicates,
* detect differences,
* toggle bits,
* and recover missing/unique values.

## Why XOR is so powerful

Because of its special rules:

### `a ^ a = 0`

A number cancels itself.

### `a ^ 0 = a`

XOR with zero changes nothing.

### `a ^ b ^ a = b`

The same values cancel in pairs.

### Order does not matter

So you can XOR all elements in any order.

## Intuition

Think of XOR as a machine that:

* removes matched pairs,
* keeps what is unmatched,
* and remembers only the difference.

---

## 15) When should you think of XOR?

Think XOR when the problem has one of these clues:

## A. Every element appears twice except one

Example:

* `[2, 3, 2, 4, 4]`

XOR all numbers:

* paired numbers disappear
* unique number remains

## B. Find missing number

XOR can combine indices and values to reveal the missing value.

## C. Two unique numbers

XOR helps separate the two unique values.

## D. Toggle a bit

XOR with a mask flips the bit.

## E. Cancel duplicates without extra space

XOR is often the cleanest solution.

---

## 16) What `x & y` really means

You asked this explicitly, so here is the deep meaning.

`x & y` is **not addition**.

It does not combine values arithmetically.

It compares each bit position and keeps only the positions where both are `1`.

So `x & y` means:

* “what bits do x and y share?”
* “what survives if y is used as a mask?”
* “what is the intersection of the two bit patterns?”

## Example

`10 = 1010`
`6 = 0110`

AND:

`1010`
`0110`
`0010`

Result = `2`

So the purpose of `&` is **filtering / masking / intersection**, not addition.

---

## 17) How to recognize bit manipulation problems

This is the practical decision skill.

Use bit manipulation when you see:

## Words like

* bit
* binary
* odd/even
* power of 2
* set bits
* toggle
* mask
* flags

## Pattern like

* every element repeats except one
* small `n` and all subsets are needed
* yes/no state tracking
* compact representation of choices

## Performance clue

* O(1) extra space
* fast boolean checks
* many small binary states

## Good rule of thumb

If the problem naturally maps to:

* on/off,
* true/false,
* choose/not choose,
* duplicate/unique,

then think bit manipulation.

---

## 18) Common mistakes to avoid

## Mistake 1: Thinking `&` means addition

It does not. It is filtering.

## Mistake 2: Forgetting indexing starts from 0

Bit positions are usually counted from the rightmost bit starting at `0`.

## Mistake 3: Forgetting `n > 0` in power of 2

`0 & (-1) == 0`, but 0 is not a power of 2.

## Mistake 4: Confusing set and toggle

* set uses OR
* toggle uses XOR

## Mistake 5: Memorizing without understanding masks

The mask idea is central. `1 << i` is not just syntax; it creates a targeted bit position.

---

## 19) One-line cheat sheet

This is the compact revision summary:

* **Binary**: numbers stored in bits
* **LSB**: rightmost bit
* **`&`**: keep common 1s
* **`|`**: keep any 1s
* **`^`**: keep different bits
* **`<<`**: multiply by powers of 2
* **`>>`**: divide by powers of 2
* **`1 << i`**: create mask with only ith bit on
* **Check ith bit**: `n & (1 << i)`
* **Set ith bit**: `n | (1 << i)`
* **Clear ith bit**: `n & ~(1 << i)`
* **Toggle ith bit**: `n ^ (1 << i)`
* **Count set bits**: shift or use `n & (n - 1)`
* **Power of 2**: `n > 0 && (n & (n - 1)) == 0`
* **XOR special rule**: duplicates cancel

---

## 20) What you should now be able to do

After this foundation, you should be able to:

* read binary comfortably,
* understand bit positions,
* know what each operator means,
* check/set/clear/toggle bits,
* count set bits,
* test power of 2,
* and recognize when XOR is the right tool.

That is the entire base layer of bit manipulation.

---  

## Bit Manipulation MindMap
![Bit Manipulation Mind Map](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/Images/BitManipulation.png ) 

[Bit Manipulation Visualize](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/Images/Bitwise_Mastery_Visualized.pdf)  

[Bit Manipulation Podcast](https://archive.org/details/20260522_20260522_0422)







