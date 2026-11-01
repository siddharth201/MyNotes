Error handling in Swift allows your program to gracefully deal with unexpected situations or failures, rather than just crashing. Swift uses a very readable `do-try-catch` syntax for this.

Here is a small, step-by-step tutorial on how it works.

### Step 1: Representing Errors
In Swift, errors are represented by values of types that conform to the `Error` protocol. The most common and clearest way to define your own errors is by using an `enum`.

Let's imagine we are building a simple Bank Account system. We want to represent the errors that can happen when someone tries to withdraw money.

```swift
enum BankError: Error {
    case insufficientFunds(amountNeeded: Double)
    case negativeWithdrawal
    case accountLocked
}
```

### Step 2: Throwing Errors
To indicate that a function can fail and might throw an error, you write the `throws` keyword in the function's declaration, right before the return type. Inside the function, you use the `throw` keyword to actually toss the error.

```swift
class BankAccount {
    var balance: Double
    var isLocked: Bool = false
    
    init(balance: Double) {
        self.balance = balance
    }
    
    // The 'throws' keyword tells Swift this function might fail
    func withdraw(amount: Double) throws {
        if isLocked {
            throw BankError.accountLocked
        }
        
        if amount <= 0 {
            throw BankError.negativeWithdrawal
        }
        
        if amount > balance {
            throw BankError.insufficientFunds(amountNeeded: amount - balance)
        }
        
        // If no errors are thrown, the withdrawal succeeds
        balance -= amount
        print("Successfully withdrew $\(amount). New balance: $\(balance)")
    }
}
```

### Step 3: Handling Errors (`do-catch`)
Because the `withdraw` function throws, you can't just call it normally. You must call it using the `try` keyword. To actually handle the potential errors, you wrap the `try` call in a `do` block and add `catch` blocks to handle specific issues.

```swift
let myAccount = BankAccount(balance: 100.0)

do {
    // We 'try' to call the throwing function
    try myAccount.withdraw(amount: 150.0)
    print("Transaction complete!")
    
} catch BankError.insufficientFunds(let shortage) {
    // Catching a specific error and extracting its associated value
    print("Declined: You need $\(shortage) more to complete this transaction.")
    
} catch BankError.negativeWithdrawal {
    print("Declined: You cannot withdraw a negative amount.")
    
} catch BankError.accountLocked {
    print("Declined: Your account is currently locked.")
    
} catch {
    // A generic catch-all for any other errors we didn't specify
    print("An unknown error occurred: \(error).")
}
```
*In this specific case, the output will be: `Declined: You need $50.0 more to complete this transaction.`*

### Step 4: Alternative Ways to Handle Errors
Sometimes you don't care *why* an error happened; you only care *if* it happened. Swift provides two alternative ways to use `try`:

**1. Optional Try (`try?`)**
Converts the result into an Optional. If the function throws an error, the error is discarded, and the result becomes `nil`.
```swift
// If it fails, newBalance is just nil. The app doesn't crash.
let newBalance = try? myAccount.withdraw(amount: 500) 
```

**2. Forced Try (`try!`)**
This completely disables error propagation. You use this *only* when you are 100% absolutely certain the function will not throw an error at runtime. If it does throw, **your app will crash**.
```swift
// Use with extreme caution! 
try! myAccount.withdraw(amount: 10) 
```  

## Q. What is the role of Error protocol in above example. What if we not use this and keep example same?  

That is a fantastic question. Because the `Error` protocol in Swift doesn't force you to implement any specific methods or variables, it can seem like it isn't actually doing anything. 

Here is exactly what the `Error` protocol does and what would happen if you removed it.

### 1. The Role of the `Error` Protocol
In Swift, the `Error` protocol is what is known as a **marker protocol**. It is completely empty. 

Its only job is to act as a definitive tag for the Swift compiler. When you add `: Error` to your enum (or struct, or class), you are making a strict contract with the compiler: *"I intend to use this specific type to represent failure states that can be thrown."*

It exists strictly for **type safety**. It prevents you from accidentally throwing random data types (like an `Int` or a `String`) as errors, which keeps your error handling predictable and structured.

### 2. What happens if you don't use it?
If you keep the exact same example but remove `: Error` from the enum declaration, **your code will refuse to compile.** Here is what your code would look like:

```swift
// We removed ': Error'
enum BankError { 
    case insufficientFunds(amountNeeded: Double)
    case negativeWithdrawal
    case accountLocked
}

class BankAccount {
    // ...
    func withdraw(amount: Double) throws {
        if isLocked {
            // COMPILER ERROR HAPPENS HERE
            throw BankError.accountLocked 
        }
        // ...
    }
}
```

If you try to build this, Xcode (and the Swift compiler) will immediately throw a red error flag with this exact message:

> 🛑 `Thrown expression type 'BankError' does not conform to 'Error'`

**The Bottom Line:** The `throw` keyword in Swift has a hardcoded rule: whatever comes immediately after the word `throw` **must** conform to the `Error` protocol. If it doesn't, Swift will not let your app run.  

---

## Q. In below code we have not use do-catch to handle `try await URLSession.shared.data(from: url)` and `try JSONDecoder().decode([User].self, from: data)` , why?
```swift
func fetchUsers() async throws -> [User] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode([User].self, from: data)
    }
```

You do not need a `do-catch` block inside `fetchUsers()` because the function itself is marked with the **`throws`** keyword.

In Swift, when a function is marked as `throws`, it delegates error handling to the caller. Instead of catching and resolving errors internally, the function propagates any errors up the call stack.

### How Error Propagation Works Here

1. **`try await URLSession.shared.data(from: url)`**
If the network request fails (e.g., no internet connection, DNS failure, timeout), `URLSession` throws an error. Because there is no `do-catch`, that error immediately exits `fetchUsers()` and is thrown directly to whichever function called it.
2. **`try JSONDecoder().decode([User].self, from: data)`**
If the network request succeeds but the JSON does not match your `User` model (e.g., missing keys, type mismatches), `decode` throws a `DecodingError`. That error also immediately bubbles up to the caller.
3. **`throw URLError(.badURL)`**
Your manual guard failure uses the same propagation mechanism, throwing a `URLError` directly out of the function.

---

### Where Does `do-catch` Go?

The error must eventually be handled wherever `fetchUsers()` is invoked (typically in a ViewModel, Controller, or Swift Task):

```swift
Task {
    do {
        let users = try await fetchUsers()
        print("Fetched \(users.count) users")
    } catch let decodingError as DecodingError {
        // Handle JSON mismatch specifically
        print("Failed to decode users: \(decodingError)")
    } catch {
        // Handle network or bad URL errors
        print("Failed to fetch users: \(error.localizedDescription)")
    }
}

```

### When Would You Use `do-catch` Inside `fetchUsers`?

You only need `do-catch` inside this function if you want to **intercept**, **transform**, or **recover** from the error before it reaches the caller. For example:

* **Wrapping errors into a custom domain type:**
```swift
do {
    let (data, _) = try await URLSession.shared.data(from: url)
    return try JSONDecoder().decode([User].self, from: data)
} catch {
    throw CustomAppError.userFetchFailed(underlying: error)
}

```


* **Providing a fallback or default value:**
```swift
do {
    return try JSONDecoder().decode([User].self, from: data)
} catch {
    return [] // Return empty list instead of failing
}

```



If you do not need to alter the error or recover from it internally, letting `throws` bubble the error up keeps your network code clean and concise.

---

## Q. So just `try` will work , no need of `try?` or `try!`

Yes, standard **`try`** is the correct choice here, and you should **not** use `try?` or `try!`.

Each variant changes how errors are treated:

### 1. Plain `try` (The Right Choice)

* **What it does:** Executes the throwing operation and passes any thrown error directly up to the caller because the function has `throws` in its signature.
* **Why it fits:** The caller gets full visibility into *why* something failed (e.g., distinguishing between a network timeout vs. an invalid JSON key).

---

### 2. Why not `try?`

* **What it does:** Converts the result into an `Optional` and **discards the error** if one occurs, turning failures into `nil`.
* **The issue in your code:**
* For `URLSession`:
```swift
let (data, _) = try? await URLSession.shared.data(from: url) // Error!

```


`try?` returns an optional tuple `(Data, URLResponse)?`. You cannot directly decompose it into `(data, _)` without unwrapping it first.
* For `JSONDecoder`:
```swift
return try? JSONDecoder().decode([User].self, from: data) // Type mismatch!

```


This returns `[User]?`, but the function's return type is non-optional `[User]`. It will fail to compile unless you change the function return type to `[User]?` or provide a default fallback (`?? []`).
* **Lost context:** Even if compiled, `try?` hides whether a failure was caused by a bad connection, an HTTP error, or corrupted JSON.



---

### 3. Why not `try!`

* **What it does:** Force-unwraps the call and asserts that an error will **never** happen.
* **The issue in your code:**
* If the device loses internet connection, the server is down, or the API response schema changes, your app will **instantly crash** at runtime (`Fatal error`).
* Only use `try!` when a failure is logically impossible (like decoding a hardcoded local JSON string that you have already verified). Network requests and JSON decoding from remote servers are never guaranteed to succeed.



---

### Comparison

| Keyword | What Happens on Error | Return Type | Best For |
| --- | --- | --- | --- |
| **`try`** | Throws error up to caller | Standard type (`T`) | Throwing functions where callers handle errors |
| **`try?`** | Swallows error, returns `nil` | Optional (`T?`) | Non-critical operations where failure reason doesn't matter |
| **`try!`** | **Crashes the app** | Standard type (`T`) | Operations guaranteed never to fail |

---  


