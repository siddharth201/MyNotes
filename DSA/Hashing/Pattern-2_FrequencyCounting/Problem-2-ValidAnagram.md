>Q. Given two strings s and t, return true if t is an anagram of s, and false otherwise.

 

### Example 1:

```swift
Input: s = "anagram", t = "nagaram"
 
Output: true
```  

### Example 2:
```swift
Input: s = "rat", t = "car"

Output: false
```  

### Solution  

#### Brute Force 
```swift
func validAnagram(_ s: String, _ t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    
    for char in s {
        var count1 = 0
        
        for char1 in s {
            if char1 == char {
                count1 += 1
            }
        }
        
        var count2 = 0
        
        for char2 in t {
            if char2 == char {
                count2 += 1
            }
        }
        
        if count1 != count2 {
            return false
        }
    }
    
    return true
}
``` 

#### Complexity
```swift
Time: O(n²)
Space: O(k) 
```

#### Brute Force Improved 
[Explanation](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/Problem-2%E2%80%93ValidAnagram_Improved.md)  

```swift
func validAnagramBruteForce(_ s: String, _ t: String) -> Bool {

    guard s.count == t.count else {
        return false
    }

    var processed = Set<Character>()

    for char in s {

        if processed.contains(char) {
            continue
        }

        var count1 = 0
        var count2 = 0

        for current in s {
            if current == char {
                count1 += 1
            }
        }

        for current in t {
            if current == char {
                count2 += 1
            }
        }

        if count1 != count2 {
            return false
        }

        processed.insert(char)
    }

    return true
}
```  

#### Complexity
```swift
Time: O(n²)
Space: O(k) 
```

#### Optimize
```swift
func isAnagram(_ s: String, _ t: String) -> Bool {

    if s.count != t.count {
        return false
    }

    var freqS: [Character: Int] = [:]
    var freqT: [Character: Int] = [:]

    for ch in s {
        freqS[ch, default: 0] += 1
    }

    for ch in t {
        freqT[ch, default: 0] += 1
    }

    return freqS == freqT
}
```

#### Complexity
```swift
Time: O(n)
Space: O(k) 
```  

#### Optimize Improved
```swift
func isAnagram(_ s: String, _ t: String) -> Bool {

    if s.count != t.count {
        return false
    }

    var frequency: [Character: Int] = [:]

    for ch in s {
        frequency[ch, default: 0] += 1
    }

    for ch in t {

        guard let count = frequency[ch], count > 0 else {
            return false
        }

        frequency[ch] = count - 1
    }

    return true
}
```

#### Complexity
```swift
Time: O(n)
Space: O(k) 
```
