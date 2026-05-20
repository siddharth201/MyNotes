# Swift Enums Practice Programs (Xcode Ready)

These are small runnable programs.
You can paste each one into:

* Xcode Playground
* `main.swift`
* Swift Playgrounds

and run them independently.

---

# 1. Basic Enum

Concept:

* enum creation
* accessing cases

```swift
enum Direction {
    case north
    case south
    case east
    case west
}

// Calling enum
let move = Direction.north

print(move)
```

Output:

```text
north
```

---

# 2. Enum with Switch

Concept:

* exhaustive switch
* pattern matching

```swift
enum TrafficLight {
    case red
    case yellow
    case green
}

let signal = TrafficLight.green

switch signal {

case .red:
    print("STOP")

case .yellow:
    print("READY")

case .green:
    print("GO")
}
```

Output:

```text
GO
```

---

# 3. Enum with Raw Values

Concept:

* raw values
* automatic increment

```swift
enum Weekday: Int {
    case monday = 1
    case tuesday
    case wednesday
}

print(Weekday.monday.rawValue)
print(Weekday.tuesday.rawValue)
print(Weekday.wednesday.rawValue)
```

Output:

```text
1
2
3
```

---

# 4. String Raw Values

Concept:

* string raw values

```swift
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

print(HTTPMethod.get.rawValue)
print(HTTPMethod.post.rawValue)
```

Output:

```text
GET
POST
```

---

# 5. Initialize Enum from Raw Value

Concept:

* failable initialization
* optional enum

```swift
enum Month: Int {
    case january = 1
    case february
    case march
}

let month = Month(rawValue: 2)

print(month)
```

Output:

```text
Optional(__lldb_expr_1.Month.february)
```

Better version:

```swift
if let month = Month(rawValue: 2) {
    print(month)
}
```

Output:

```text
february
```

---

# 6. Associated Values

MOST IMPORTANT.

```swift
enum Result {
    case success(String)
    case failure(String)
}

let response = Result.success("Data Loaded")

switch response {

case .success(let message):
    print("SUCCESS:", message)

case .failure(let error):
    print("ERROR:", error)
}
```

Output:

```text
SUCCESS: Data Loaded
```

---

# 7. Multiple Associated Values

```swift
enum User {

    case profile(name: String, age: Int)
}

let user = User.profile(name: "Siddharth", age: 25)

switch user {

case .profile(let name, let age):
    print(name)
    print(age)
}
```

Output:

```text
Siddharth
25
```

---

# 8. Enum Methods

Concept:

* methods inside enum

```swift
enum Calculator {

    case add

    func calculate(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
}

let result = Calculator.add.calculate(10, 20)

print(result)
```

Output:

```text
30
```

---

# 9. Computed Property in Enum

```swift
enum Planet {

    case earth
    case mars

    var gravity: Double {

        switch self {

        case .earth:
            return 9.8

        case .mars:
            return 3.7
        }
    }
}

print(Planet.earth.gravity)
print(Planet.mars.gravity)
```

Output:

```text
9.8
3.7
```

---

# 10. CaseIterable

Concept:

* iterate all enum cases

```swift
enum Direction: CaseIterable {
    case north
    case south
    case east
    case west
}

for direction in Direction.allCases {
    print(direction)
}
```

Output:

```text
north
south
east
west
```

---

# 11. Enum with Mutating Function

VERY IMPORTANT.

```swift
enum TrafficLight {

    case red
    case green

    mutating func change() {

        switch self {

        case .red:
            self = .green

        case .green:
            self = .red
        }
    }
}

var light = TrafficLight.red

print(light)

light.change()

print(light)
```

Output:

```text
red
green
```

---

# 12. Nested Enum

```swift
enum Payment {

    enum Status {
        case success
        case failure
    }
}

let paymentStatus = Payment.Status.success

print(paymentStatus)
```

Output:

```text
success
```

---

# 13. if case Pattern Matching

VERY COMMON INTERVIEW QUESTION.

```swift
enum APIResult {
    case success(String)
    case failure
}

let response = APIResult.success("User Loaded")

if case .success(let value) = response {
    print(value)
}
```

Output:

```text
User Loaded
```

---

# 14. Enum Conforming to Protocol

```swift
protocol Printable {
    func printValue()
}

enum Status: Printable {

    case active
    case inactive

    func printValue() {

        switch self {

        case .active:
            print("User Active")

        case .inactive:
            print("User Inactive")
        }
    }
}

let user = Status.active

user.printValue()
```

Output:

```text
User Active
```

---

# 15. Equatable Enum

```swift
enum LoginState: Equatable {
    case loggedIn
    case loggedOut
}

let a = LoginState.loggedIn
let b = LoginState.loggedIn

print(a == b)
```

Output:

```text
true
```

---

# 16. Generic Enum

ADVANCED.

```swift
enum APIResponse<T> {

    case success(T)
    case failure(String)
}

let response = APIResponse<Int>.success(100)

switch response {

case .success(let value):
    print(value)

case .failure(let error):
    print(error)
}
```

Output:

```text
100
```

---

# 17. Recursive Enum

ADVANCED.

```swift
indirect enum FileSystem {

    case file(String)
    case folder(String, [FileSystem])
}

let file1 = FileSystem.file("photo.jpg")
let file2 = FileSystem.file("video.mp4")

let documents = FileSystem.folder(
    "Documents",
    [file1, file2]
)

print(documents)
```

Output:
(Large debug output)

Main goal:
understand recursive storage.

---

# 18. Real Production Example

VERY IMPORTANT.

```swift
enum ViewState {

    case idle
    case loading
    case success(String)
    case error(String)
}

let state = ViewState.success("Profile Loaded")

switch state {

case .idle:
    print("Idle")

case .loading:
    print("Loading...")

case .success(let data):
    print(data)

case .error(let message):
    print(message)
}
```

Output:

```text
Profile Loaded
```

---

# 19. Enum + Array

```swift
enum Direction {
    case north
    case south
}

let directions: [Direction] = [.north, .south]

print(directions)
```

Output:

```text
[north, south]
```

---

# 20. Real App Navigation Example

```swift
enum Screen {
    case home
    case profile
    case settings
}

func navigate(to screen: Screen) {

    switch screen {

    case .home:
        print("Home Screen")

    case .profile:
        print("Profile Screen")

    case .settings:
        print("Settings Screen")
    }
}

navigate(to: .profile)
```

Output:

```text
Profile Screen
```

---

# SUPER IMPORTANT PRACTICE TASKS

Try building these yourself now:

---

# Task 1 — Bank Account State

Create enum:

* active
* blocked
* closed

Print message using switch.

---

# Task 2 — Food Order State

```text
placed
preparing
outForDelivery
delivered
```

---

# Task 3 — Network State

```text
loading
success(data)
failure(error)
```

---

# Task 4 — Traffic Signal

Add mutating function:

* red → green
* green → yellow
* yellow → red

---

# Task 5 — Music Player

```text
playing
paused
stopped
```

Add method:

* print current status

---

# MOST IMPORTANT THINGS TO PRACTICE

You should become very comfortable with:

* switch on enum
* associated values
* raw values
* mutating methods
* CaseIterable
* if case
* enum state modeling

These are heavily used in:

* SwiftUI
* MVVM
* async state handling
* production apps
* interviews

