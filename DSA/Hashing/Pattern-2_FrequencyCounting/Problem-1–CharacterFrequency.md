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
