Good topic—this comes up often because `struct` and `class` behave a little differently with default values.

---

## Default Values in Struct and Class

Default value means:

> giving a property an initial value at declaration time.

Example:

```swift
var name: String = "Sid"
```

Here `"Sid"` is the default value.

---

## Struct Default Values

### Example

```swift
struct User {
    var name: String = "Guest"
    var age: Int = 18
}
```

Now:

```swift
let user = User()

print(user.name) // Guest
print(user.age)  // 18
```

Swift automatically uses those values.

---

### Memberwise Initializer Still Works

Struct gets a **memberwise initializer** automatically.

```swift
let user = User(name: "Rahul", age: 25)
```

or

```swift
let user = User()
```

or even:

```swift
let user = User(name: "Rahul")
```

if every remaining property has defaults.

Example:

```swift
struct User {
    var name: String
    var age: Int = 18
}

let user = User(name: "Sid")
```

`age` becomes `18`.

---

### Why this is nice

Because Swift synthesizes init for you.

Very little code needed.

---

## Class Default Values

Class can also have default values.

Example:

```swift
class User {
    var name: String = "Guest"
    var age: Int = 18
}
```

Then:

```swift
let user = User()

print(user.name)
```

Output:

```swift
Guest
```

---

## Important Difference

With class:

Even if properties have defaults…

Swift **does not give memberwise initializer automatically**

This does NOT work:

```swift
let user = User(name: "Sid", age: 28)
```

❌ Error

unless you write your own initializer.

---

### Need custom init

```swift
class User {
    var name: String = "Guest"
    var age: Int = 18

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
```

Now:

```swift
let user = User(name: "Sid", age: 28)
```

works.

---

## Struct vs Class Difference

---

### Struct

```swift
struct User {
    var name: String = "Guest"
}
```

Swift gives:

```swift
User()
User(name: "Sid")
```

automatically.

---

### Class

```swift
class User {
    var name: String = "Guest"
}
```

Swift gives:

```swift
User()
```

but NOT:

```swift
User(name: "Sid")
```

unless you write init manually.

---

## Why?

Because struct gets:

### Memberwise Initializer

Swift auto-generates:

```swift
init(name: String)
```

---

Class does not because classes have:

* inheritance  
* designated initializers  
* convenience initializers  
* required initializers  

Initializer rules are more complex.

So Swift avoids generating memberwise init automatically.

---

## Default Values + Optional Properties

Sometimes no default value is needed if property is optional.

Example:

```swift
struct User {
    var name: String?
}
```

Swift automatically gives:

```swift
nil
```

as default.

Same for class.

---

Example:

```swift
let user = User()
print(user.name)
```

Output:

```swift
nil
```

---

## Mutable Default Values (Important Interview Question)

This is where confusion happens.

Example:

```swift
struct Cart {
    var items: [String] = []
}
```

Every new struct gets its own array.

---

```swift
var c1 = Cart()
var c2 = Cart()

c1.items.append("iPhone")
```

Now:

```swift
c1.items → ["iPhone"]
c2.items → []
```

Independent.

---

## Class example

```swift
class Cart {
    var items: [String] = []
}
```

Each instance still gets its own array property.

But because class is reference type:

```swift
let c1 = Cart()
let c2 = c1
```

Now both share same `items`.

---

## Default Value with Closures

Very common in iOS.

Example:

```swift
class MyViewController: UIViewController {

    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        return table
    }()
}
```

This is default value initialized using closure.

Same possible in struct too.

---

Example:

```swift
struct Config {
    var formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .medium
        return f
    }()
}
```

---

## Rules to Remember

---

### Struct

✅ can have default values  
✅ gets memberwise initializer automatically  
✅ can call `User()` if all properties have defaults  

---

### Class

✅ can have default values  
✅ can call `User()` if everything initialized  
❌ no automatic memberwise initializer  

---

# Quick Comparison

| Feature                        |        Struct |                Class |
| ------------------------------ | ------------: | -------------------: |
| Property default values        |             ✅ |                    ✅ |
| `init()` auto-generated        | ✅ if possible | ✅ if all initialized |
| Memberwise init auto-generated |         ✅ Yes |                 ❌ No |
| Can override with custom init  |             ✅ |                    ✅ |

---

## Interview-friendly answer

If asked:

**“How do default values differ between struct and class?”**

You can say:

> Both struct and class support default property values.
>
> The main difference is that structs receive a synthesized memberwise initializer automatically, so those default values integrate nicely with partial initialization.
>
> Classes can also have default values, but Swift does not generate a memberwise initializer for classes, so we usually write `init` manually if custom initialization is needed.

That’s a strong answer.

---


