
### Protocols

**Q.1**
```swift
protocol Test {
    func sayHello()
}

extension Test {
    func sayHello() {
        print("Hello from protocol")
    }
}

struct Person: Test {
    func sayHello() {
        print("Hello from Person")
    }
}

let p1 = Person()
p1.sayHello()

let p2: Test = Person()
p2.sayHello()
```

**Output**
```swift
Hello from Person
Hello from Person
```
**Concept**
