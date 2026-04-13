## Q. loop on string in swift with index  

In Swift, you cannot use an integer (like 0, 1, 2) to directly index a string because characters can vary in size due to Unicode. Depending on whether you need a simple integer counter or the actual string index for slicing, you have three main options: [1, 2, 3] 
### 1. Using .enumerated() for an Integer Offset [4, 5] 
This is the easiest way if you just need a zero-based integer counter alongside each character.

let greeting = "Hello!"
for (offset, char) in greeting.enumerated() {
    print("Character at offset \(offset) is \(char)")
}


* Key Detail: offset is a plain Int, not a String.Index. You cannot use this offset directly to subscript the string (e.g., greeting[offset] will fail). [6, 7, 8, 9] 

### 2. Using .indices for Actual String Indices
Use this if you need the specific String.Index type required for operations like slicing or inserting.

let greeting = "Hello!"
for index in greeting.indices {
    let char = greeting[index]
    print("Found \(char) at index \(index)")
}


* Best For: Accessing specific parts of the string within the loop or performing range-based operations. [2, 10] 

### 3. Using zip for Both Index and Character
If you need both the actual String.Index and the character at the same time without doing a manual lookup, zip is the most efficient "Swift-y" way. [11] 

let greeting = "Hello!"
for (index, char) in zip(greeting.indices, greeting) {
    print("\(char) is at \(index)")
}


* Efficiency: This avoids the cost of repeatedly looking up characters by index within the loop. [6, 10] 

### Comparison Table

| Method [12, 13, 14, 15] | Index Type | Best Use Case |
|---|---|---|
| enumerated() | Int | Simple counting or identifying the "nth" character. |
| indices | String.Index | When you need to subscript or slice the string later. |
| zip() | String.Index | Most efficient way to get both the index and character. |


## Q. Now suppose I want to loop from index 3 to

