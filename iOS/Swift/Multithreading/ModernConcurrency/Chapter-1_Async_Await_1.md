In Swift, **`async/await`** is a pattern for writing asynchronous code that reads like synchronous code. It allows you to pause the execution of a function while it waits for a long-running task to complete, without blocking the main thread.

Before this pattern was introduced, Swift relied heavily on completion handlers (closures), which often led to "callback hell" and difficult error handling.

---

## 1. The Core Keywords

### `async`
Marking a function as `async` tells the compiler that the function can suspend its execution.
* **Location:** It goes before the return arrow (`->`) in a function signature.
* **Effect:** It allows the function to call other asynchronous functions.

### `await`
The `await` keyword identifies a **suspension point**.
* **Location:** It is used right before calling an `async` function.
* **Effect:** The current thread is "yielded" to the system. The system can then use that thread for other work until the awaited task finishes.

---

## 2. Basic Syntax Example

Here is how you define and call an asynchronous function:

```swift
// 1. Defining an async function
func fetchUserData() async -> String {
    // Simulate a network delay
    try? await Task.sleep(nanoseconds: 2 * 1_000_000_000) 
    return "User: Alex"
}

// 2. Calling the function
func processRequest() async {
    print("Fetching...")
    
    // Execution pauses here until fetchUserData returns
    let username = await fetchUserData() 
    
    print("Finished: \(username)")
}
```

---

## 3. How the Lifecycle Works
When an `await` is reached, the function "gives up" its thread. This is a massive improvement over traditional "blocking" code.



| Feature | Description |
| :--- | :--- |
| **Non-blocking** | The thread is free to do other work (like UI updates) while waiting. |
| **Sequential Flow** | You can read the code from top to bottom without jumping into nested closures. |
| **Error Handling** | Works seamlessly with `try/catch`. You use `async throws` to handle errors. |

---

## 4. Handling Errors (`async throws`)
If a task might fail (like a network request), you combine `async` with `throws`. Note that `async` always comes before `throws`.

```swift
func downloadImage(url: String) async throws -> UIImage {
    let (data, response) = try await URLSession.shared.data(from: URL(string: url)!)
    
    guard let image = UIImage(data: data) else {
        throw ImageError.badData
    }
    
    return image
}

// Usage
Task {
    do {
        let profilePic = try await downloadImage(url: "https://example.com/pic.jpg")
        self.imageView.image = profilePic
    } catch {
        print("Failed to download: \(error)")
    }
}
```

---

## 5. Important Rules
1.  **Async Context:** You cannot call an `async` function from a synchronous environment (like `viewDidLoad`) directly. You must wrap it in a **`Task { ... }`** block.
2.  **Order of Keywords:** The order is always `func name() async throws -> ReturnType`.
3.  **Testing:** XCTest supports `async` test methods, so you no longer need to use `XCTestExpectation` for simple async checks.


