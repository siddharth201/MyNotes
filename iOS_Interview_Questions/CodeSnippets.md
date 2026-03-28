
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
<details>
<summary>Output</summary>  

```swift  

Hello from Person      
Hello from Person  

```   
 
[Concept](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/static_vs_dynamic_dispatch_exp.md)  

</details>  
  

**Q.2**  

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

