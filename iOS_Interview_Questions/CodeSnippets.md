
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

Hello from Person      
Hello from protocol  

```   
 
[Concept](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/static_vs_dynamic_dispatch_exp.md)  

</details> 

   

