This is a very good Swift question—and interviewers sometimes ask it because it reveals whether you understand **Swift initializer synthesis**.

Short answer:

> A struct loses its automatic memberwise initializer when you define your own custom initializer **inside the struct declaration**, because Swift assumes **you now want full control over initialization**.

But let’s unpack *why*.

---

## First: What is memberwise initializer?

Given:

```swift id="jvxzzs"
struct User {
    var name: String
    var age: Int
}
```

Swift automatically creates:

```swift id="j4upmj"
init(name: String, age: Int)
```

So this works:

```swift id="89m45h"
let user = User(name: "Sid", age: 28)
```

Even though you didn’t write `init`.

This is called:

## Memberwise Initializer

because each member/property becomes a parameter.

---

## Now add custom init

Example:

```swift id="t6y8z0"
struct User {
    var name: String
    var age: Int

    init() {
        self.name = "Guest"
        self.age = 18
    }
}
```

Now:

```swift id="smy26n"
User()
```

✅ Works

But:

```swift id="i4ubgg"
User(name: "Sid", age: 28)
```

❌ Error

---

## Why does Swift remove it?

Because Swift says:

> “You wrote your own initializer, so I assume you want to define initialization behavior yourself.”

If Swift kept auto-generating `init(name:age:)`, it could conflict with your custom logic.

---

## Imagine this confusion

Suppose:

```swift id="i4xll5"
struct User {
    var name: String
    var age: Int

    init() {
        print("Analytics event fired")
        self.name = "Guest"
        self.age = 18
    }
}
```

If Swift also generated:

```swift id="ymwd7s"
init(name: String, age: Int)
```

Then now there are two initialization paths:

### Path 1

```swift id="7akvyl"
User()
```

runs custom logic

---

### Path 2

```swift id="2yv3e9"
User(name: "Sid", age: 28)
```

bypasses that logic

That can be unexpected.

So Swift avoids ambiguity.

---

## Important nuance

It only disappears if custom init is written **inside** struct definition.

---

### Example

```swift id="zx5wsn"
struct User {
    var name: String
    var age: Int
}
```

---

Then extension:

```swift id="54n5yr"
extension User {
    init() {
        self.name = "Guest"
        self.age = 18
    }
}
```

Now BOTH work:

```swift id="cic6ao"
User()
```

and

```swift id="bq0a8r"
User(name: "Sid", age: 28)
```

---

## Why?

Because Swift keeps synthesized memberwise initializer when custom init is added in extension.

This is intentional.

---

## Rule to remember

### Inside struct declaration

```swift id="ypx2go"
struct User {
    ...
    init() { }
}
```

Result:

❌ memberwise initializer removed

---

### Inside extension

```swift id="c0d0nz"
extension User {
    init() { }
}
```

Result:

✅ memberwise initializer preserved

---

## Why extension behaves differently?

Because original struct definition remains untouched.

Swift first creates:

```swift id="jlwmjf"
init(name:age:)
```

Then extension adds:

```swift id="nghn6z"
init()
```

So both coexist.

---

## Real practical example

Very common pattern:

```swift id="zkry2j"
struct User {
    var name: String
    var age: Int
}
```

---

Then:

```swift id="uqgzp3"
extension User {
    static var guest: User {
        User(name: "Guest", age: 18)
    }
}
```

or:

```swift id="hnnob4"
extension User {
    init() {
        self.init(name: "Guest", age: 18)
    }
}
```

This keeps memberwise init available.

---

## Interview answer

If asked:

**“Why does struct lose memberwise initializer when custom init is added?”**

You can say:

> Swift automatically synthesizes a memberwise initializer for structs only when no custom initializer is defined in the primary declaration.
>
> Once we add a custom initializer there, Swift assumes we want explicit control over initialization and stops generating the memberwise initializer to avoid ambiguity.
>
> If we want both, we can move the custom initializer into an extension.

That’s a strong senior-level answer.

---

## Tiny memory trick

```text id="4t6q5q"
Custom init inside struct
→ memberwise init gone

Custom init inside extension
→ memberwise init stays
```

That’s the easiest way to remember it.

