# 1. Difference Between `class` and `struct` in Swift + `weak` and `unowned`

## Struct

* **Value Type**
* Stored in stack (conceptually)
* Copied when passed/assigned
* No inheritance
* Safer for multithreading

```swift
struct Person {
    var name: String
}

var p1 = Person(name: "Sid")
var p2 = p1

p2.name = "Rahul"

print(p1.name) // Sid
print(p2.name) // Rahul
```

`p1` and `p2` are different copies.

---

## Class

* **Reference Type**
* Stored in heap
* Shared reference
* Supports inheritance
* Used when shared mutable state is needed

```swift
class Person {
    var name: String

    init(name: String) {
        self.name = name
    }
}

var p1 = Person(name: "Sid")
var p2 = p1

p2.name = "Rahul"

print(p1.name) // Rahul
print(p2.name) // Rahul
```

Both point to same memory object.

---

## When to Use Struct?

Apple recommends:

* Use `struct` by default
* Use `class` when:

  * Need inheritance
  * Shared mutable state
  * Identity comparison (`===`)
  * Objective-C interoperability

---

# weak vs unowned

Used to avoid retain cycles.

## weak

* Optional reference
* Automatically becomes `nil`
* Used when referenced object may become nil

```swift
class Person {
    var name: String

    init(name: String) {
        self.name = name
    }
}

class Apartment {
    weak var tenant: Person?
}
```

---

## unowned

* Non-optional
* Assumes object always exists
* Crash if accessed after deallocation

```swift
class Customer {
    var card: CreditCard?

    deinit {
        print("Customer deallocated")
    }
}

class CreditCard {
    unowned let customer: Customer

    init(customer: Customer) {
        self.customer = customer
    }
}
```

---

## Interview Line

* `weak` = safe optional reference
* `unowned` = unsafe non-optional reference

Use `weak` when lifecycle can end independently.
Use `unowned` when both objects should exist together.

---

# 2. What is a Retain Cycle?

A retain cycle happens when two objects strongly reference each other, preventing deallocation.

---

## Example

```swift
class A {
    var b: B?
}

class B {
    var a: A?
}
```

Both hold strong references → memory leak.

---

## Solution

Use `weak` or `unowned`.

```swift
class B {
    weak var a: A?
}
```

---

## Closure Retain Cycle

Very common in iOS.

```swift
class ViewModel {

    var completion: (() -> Void)?

    func fetch() {
        completion = {
            self.doSomething()
        }
    }

    func doSomething() {}
}
```

Closure strongly captures `self`.

---

## Fix

```swift
completion = { [weak self] in
    self?.doSomething()
}
```

---

## Tools to Detect

* Instruments → Leaks
* Memory Graph Debugger
* Xcode Debug Memory Graph

---

# 3. Closures vs Delegate Pattern

## Use Closures When

* Single callback
* Lightweight communication
* Async completion handlers

Example:

```swift
api.fetchUser { result in
    print(result)
}
```

---

## Use Delegates When

* Multiple callbacks/events
* Long-term communication
* Reusable component communication

Example:

```swift
protocol PlayerDelegate: AnyObject {
    func didPlay()
    func didPause()
}
```

---

## Interview Answer

| Closures             | Delegates        |
| -------------------- | ---------------- |
| Simple callbacks     | Multiple events  |
| Functional style     | OOP style        |
| Less boilerplate     | Better structure |
| Risk of retain cycle | Usually safer    |

---

# 4. Large MVC Screen Modularization

Massive View Controller problem.

---

## Approaches

### Extract Custom Views

```swift
class ProfileHeaderView: UIView {

}
```

---

### Move Business Logic to ViewModel/Manager

```swift
class UserService {
    func fetchUser() {}
}
```

---

### Use Extensions

```swift
extension HomeVC: UITableViewDelegate {

}
```

---

### Use Coordinators

Move navigation logic out.

---

### Break Data Source

```swift
class HomeTableDataSource: NSObject, UITableViewDataSource {

}
```

---

## Interview-Friendly Architecture Improvement

* MVC → MVVM
* MVC + Coordinator
* Clean Architecture

---

# 5. Passing Data Back from SwiftUI to UIKit

Common in `UIHostingController`.

---

## Using Binding

SwiftUI updates shared state.

---

## Using Closure

### SwiftUI

```swift
struct ProfileView: View {

    var onSave: ((String) -> Void)?

    var body: some View {
        Button("Save") {
            onSave?("Sid")
        }
    }
}
```

---

### UIKit

```swift
let vc = UIHostingController(
    rootView: ProfileView { value in
        print(value)
    }
)
```

---

## Using ObservableObject

Useful for shared state.

---

# 6. Where Should JSON Parsing Reside?

Best practice:

* Networking layer fetches raw data
* Parsing should be separated

---

## Good Design

```swift
protocol NetworkService {
    func request<T: Decodable>(
        endpoint: Endpoint
    ) async throws -> T
}
```

---

## Responsibility Separation

| Layer                | Responsibility   |
| -------------------- | ---------------- |
| Network Layer        | Request/Response |
| Decoder Layer        | JSON parsing     |
| Repository/ViewModel | Business logic   |

---

## Avoid

```swift
ViewController -> URLSession -> JSONSerialization
```

Too tightly coupled.

---

# 7. Actor vs Serial Queue

## Serial Queue (GCD)

```swift
let queue = DispatchQueue(label: "serial")

queue.async {
    print("Thread safe")
}
```

Old concurrency model.

---

## Actor

```swift
actor Counter {

    var value = 0

    func increment() {
        value += 1
    }
}
```

Actors provide:

* Automatic data isolation
* Compiler safety
* Modern Swift concurrency

---

## Difference

| Actor                    | Serial Queue     |
| ------------------------ | ---------------- |
| Swift concurrency        | GCD              |
| Compiler enforced safety | Manual           |
| Easier async/await       | Callback-based   |
| Safer                    | More error-prone |

---

## When to Use?

* New Swift concurrency → Actor
* Legacy code/GCD interop → Serial Queue

---

# 8. What is `@MainActor`?

Ensures code runs on main thread.

Used for:

* UI updates
* UIKit/SwiftUI state changes

---

## Example

```swift
@MainActor
class HomeViewModel: ObservableObject {

    @Published var users: [String] = []

    func updateUI() {
        users.append("Sid")
    }
}
```

---

## Why Important?

UIKit and SwiftUI are NOT thread-safe.

UI updates must happen on main thread.

---

# 9. Which Parts Should Run on MainActor?

## Should Run on MainActor

* UI updates
* Published state updates
* UIKit interactions

```swift
await MainActor.run {
    self.label.text = "Done"
}
```

---

## Should NOT Run on MainActor

* Networking
* JSON parsing
* Image processing
* Database operations

Bad:

```swift
@MainActor
func fetchData() async {
    // network call here
}
```

This blocks UI thread unnecessarily.

---

## Ideal Flow

```swift
func fetchUsers() async {

    let users = try await api.fetch()

    await MainActor.run {
        self.users = users
    }
}
```

---

# 10. Debugging Memory Jank

Memory jank:

* UI stutter
* Frame drops
* High memory usage

---

## Tools

### Instruments

* Allocations
* Time Profiler
* Leaks

---

### Memory Graph Debugger

Detect retained objects.

---

### FPS Monitoring

Look for dropped frames.

---

## Common Causes

* Large images
* Heavy work on main thread
* Retain cycles
* Excessive AutoLayout
* Too many views

---

## Optimization

* Background processing
* Image caching
* Lazy loading
* Reduce view hierarchy

---

# 11. Debugging Memory Leaks

## Symptoms

* Increasing memory usage
* ViewControllers not deallocated

---

## Add `deinit`

```swift
deinit {
    print("HomeVC deallocated")
}
```

If not called → leak.

---

## Use Memory Graph

Xcode:

* Debug Navigator
* Memory Graph

Shows retain cycles visually.

---

## Use Instruments → Leaks

Detect leaked objects.

---

## Common Causes

* Closures capturing self
* Delegates not weak
* Timers
* NotificationCenter observers

---

# 12. WebSocket Real-Time Updates

Usually:

* Chat apps
* Live stock prices
* Multiplayer apps

---

## Basic Architecture

```swift
URLSessionWebSocketTask
```

---

## Features Needed

### Connection Manager

```swift
class SocketManager {

}
```

---

### Auto Reconnect

```swift
func reconnect() {
    DispatchQueue.global().asyncAfter(
        deadline: .now() + 3
    ) {
        self.connect()
    }
}
```

Use:

* Exponential backoff
* Retry limits

---

## Heartbeat / Ping

Keep socket alive.

```swift
socket.sendPing()
```

---

## Message Recovery

Store:

* Last message ID
* Sequence number
* Timestamp

After reconnect:

* Request missed messages

---

## Interview-Level Points

Mention:

* Reconnection strategy
* Offline handling
* State synchronization
* Queue pending messages

---

# 13. Retry Functionality using URLSession

## Simple Retry

```swift
func request(retryCount: Int = 3) {

    URLSession.shared.dataTask(with: url) {
        data, response, error in

        if error != nil && retryCount > 0 {
            self.request(retryCount: retryCount - 1)
        }

    }.resume()
}
```

---

## Better Production Retry

Use:

* Exponential backoff
* Retry only retryable errors

---

## Retryable Errors

* Timeout
* No internet
* 5xx server errors

Do NOT retry:

* 400
* 401
* Validation failures

---

## Exponential Backoff

```swift
let delay = pow(2.0, Double(attempt))
```

---

# 14. Networking Design in MVC

## Structure

```text
ViewController
    ↓
Service Layer
    ↓
Network Manager
    ↓
API
```

---

## Example

## Endpoint

```swift
enum Endpoint {
    case users
}
```

---

## Network Manager

```swift
protocol Networkable {
    func request<T: Decodable>(
        endpoint: Endpoint
    ) async throws -> T
}
```

---

## Service Layer

```swift
class UserService {

    let network: Networkable

    init(network: Networkable) {
        self.network = network
    }

    func fetchUsers() async throws -> [User] {
        try await network.request(endpoint: .users)
    }
}
```

---

## ViewController

```swift
class HomeVC: UIViewController {

    let service = UserService()

    func fetch() {

        Task {
            do {
                let users = try await service.fetchUsers()

                DispatchQueue.main.async {
                    print(users)
                }

            } catch {
                print(error)
            }
        }
    }
}
```

---

# Interview Summary Tips

Interviewers usually check:

* Architecture thinking
* Memory management understanding
* Concurrency knowledge
* Practical production experience
* Separation of concerns
* Scalability thinking

While answering:

1. Start with definition
2. Explain problem
3. Provide practical example
4. Mention tradeoffs
5. Mention production considerations

