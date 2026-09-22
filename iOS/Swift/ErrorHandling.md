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
