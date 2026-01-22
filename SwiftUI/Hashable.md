## **Explain Codable & Hashable**  

These two (`Codable` and `Hashable`) are super common in Swift, especially when working with **data**, **APIs**, and **collections**.
Let’s break them down in **simple, everyday language** with easy examples 👇

---

## 🧩 1️⃣ Codable — “Can be converted to and from JSON (or other formats)”

### 💬 Simple idea:

Imagine you want to **send data** (like a user profile) over the internet or **save it** to a file.
Swift can’t directly send your custom structs — it needs to **encode** them (convert to JSON), and later **decode** them back.

That’s where `Codable` helps.

### 🧠 Meaning:

`Codable` = both `Encodable` + `Decodable`

It means:

* **Encodable** → can turn into JSON
* **Decodable** → can be made *from* JSON

---

### 💡 Example:

```swift
struct User: Codable {
    let name: String
    let age: Int
}
```

Now you can easily encode or decode it:

```swift
let user = User(name: "Siddharth", age: 28)

// ✅ Convert to JSON
if let jsonData = try? JSONEncoder().encode(user) {
    print(String(data: jsonData, encoding: .utf8)!)
    // Output: {"name":"Siddharth","age":28}
}

// ✅ Convert back to Swift object
if let decodedUser = try? JSONDecoder().decode(User.self, from: jsonData) {
    print(decodedUser.name) // Siddharth
}
```

🧠 **Why it’s useful:**
When you call an API (like a weather API or login), the data you get is in JSON.
`Codable` helps you easily convert between JSON ↔ Swift structs.

---

## 🧩 2️⃣ Hashable — “Can be compared quickly (has a unique hash code)”

### 💬 Simple idea:

When you put something in a **Set** or use it as a **key in a Dictionary**, Swift needs a way to check if two things are the same.

`Hashable` gives each item a unique “fingerprint” (a hash value), so Swift can compare things fast.

---

### 💡 Example:

```swift
struct Car: Hashable {
    let brand: String
    let model: String
}
```

Now you can use it in a `Set` or `Dictionary`:

```swift
let car1 = Car(brand: "Tesla", model: "Model 3")
let car2 = Car(brand: "Tesla", model: "Model 3")
let car3 = Car(brand: "BMW", model: "i4")

let cars: Set = [car1, car2, car3]

print(cars.count) // Output: 2 (because car1 and car2 are the same)
```

💡 **Why?**
Because `Hashable` lets Swift check that `car1` and `car2` have the same “hash fingerprint”.

---

## ⚙️ Summary Table

| Concept    | Simple Meaning                             | Used For                        | Example Use                   |
| ---------- | ------------------------------------------ | ------------------------------- | ----------------------------- |
| `Codable`  | Can be converted to/from JSON or files     | Working with APIs, saving data  | API responses, saving to disk |
| `Hashable` | Can be compared quickly with a unique hash | Sets, Dictionaries, comparisons | Avoid duplicates in a Set     |

---


