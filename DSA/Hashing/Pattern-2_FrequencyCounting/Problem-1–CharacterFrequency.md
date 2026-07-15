> Given a string, count the frequency of every character.

### Example

#### Input

```swift
"banana"
```

#### Output

```swift
b → 1

a → 3

n → 2
```

### Solution

#### Brute-Force
```swift
func characterFrequencyBruteForce(_ str: String) {

    let chars = Array(str)
    var processed = Set<Character>()

    for ch in chars {

        if processed.contains(ch) {
            continue
        }

        var count = 0

        for current in chars {

            if current == ch {
                count += 1
            }
        }

        print("\(ch) -> \(count)")
        processed.insert(ch)
    }
}
```

#### Complexity

```swift
Time: `O(n²)`

Space: O(k)

where `k` is the number of unique characters.
```  

---  

#### Optimize
```swift
func frequencyCount(_ str: String) -> [Character: Int] {
    var frequencies = [Character: Int]()
    
    for char in str {
        
        if let count = frequencies[char] {
            frequencies[char] = count + 1
        } else {
            frequencies[char] = 1
        }
    }
    
    return frequencies
} 
``` 

#### Complexity

```swift
Time: `O(n)`

Space: `O(k)`
```

---  

#### Better - Optimize 

```swift
func characterFrequency(_ str: String) -> [Character: Int] {

    var frequency: [Character: Int] = [:]

    for ch in str {

        frequency[ch, default: 0] += 1

    }

    return frequency
}
```  

#### Complexity

```swift
Time: `O(n)`

Space: `O(k)`
```  


