>Q. Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.

>Each letter in magazine can only be used once in ransomNote.

 

### Example 1:

```text
Input: ransomNote = "a", magazine = "b"
Output: false
```

### Example 2:

```text
Input: ransomNote = "aa", magazine = "ab"
Output: false
```

### Example 3:

```text
Input: ransomNote = "aa", magazine = "aab"
Output: true
```

### Solution

```swift
func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {

    guard ransomNote.count <= magazine.count else {
        return false
    }

    var frequency: [Character: Int] = [:]

    for char in magazine {
        frequency[char, default: 0] += 1
    }

    for char in ransomNote {

        guard let count = frequency[char] else {
            return false
        }

        frequency[char] = count - 1

        if frequency[char]! < 0 {
            return false
        }
    }

    return true
}
```
