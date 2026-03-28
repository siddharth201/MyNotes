
### Protocols

**Q.1 Protocol Extension Dispatch Trap**
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
<details>
<summary>Output</summary>  

```swift  

Hello from Person      
Hello from Person  

```   
 
[Concept](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/static_vs_dynamic_dispatch_exp.md)  

</details>  
  

**Q.2 Protocol Extension Dispatch Trap**  

```swift
protocol Test {

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
<details>
<summary>Output</summary>  

```swift  

Hello from Person      
Hello from protocol  

```   
 
[Concept](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/static_vs_dynamic_dispatch_exp.md)  

</details>   


**Q.3 Protocol Requirement vs Extension**  

```swift   
protocol Test {
    func sayHello()
}

extension Test {
    func sayHello() {
        print("Default")
    }
}

struct Person: Test {}

let p: Test = Person()
p.sayHello()
```   

<details>
<summary>Output</summary>  

```swift  

Default  

```   
 
[Concept](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/protocols_snippet_exp2.md)  

</details>  

### Q.4 Associated Type Problem 

```swift
protocol Container {
    associatedtype Item
    func get() -> Item
}

struct IntContainer: Container {
    func get() -> Int { 10 }
}

let c: Container = IntContainer()

❓ What happens?
```  

<details>
<summary>Output</summary>  

```swift  

before swift 5.7 out put: compiler error 
after swift 5.7 out put: 10  

```   
 
[Concept](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/protocols_snippet_exp2.md)  

</details>
   

