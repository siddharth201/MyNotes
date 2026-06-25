
Excellent. This is exactly how I teach senior engineers. Instead of just saying **"Clean Architecture is better"**, let's **build the same feature twice**:

1. ❌ Messy Architecture (what many projects accidentally become)
2. ✅ Clean Architecture

We'll compare them line by line.

---

# The Feature

Let's build a simple screen.

```
--------------------------
        Products

iPhone      ₹80,000
MacBook     ₹1,50,000
iPad        ₹50,000
--------------------------
```

When screen opens:

```
API
 ↓
JSON
 ↓
Products
 ↓
Save in DB
 ↓
Display
```

Seems simple.

---

# Version 1 — Messy Architecture

## Folder Structure

```
ProductView.swift
ProductViewModel.swift
Product.swift
```

Looks clean.

But let's see inside.

---

## ProductView

```swift
struct ProductView: View {

    @StateObject var vm = ProductViewModel()

    var body: some View {

        List(vm.products) {
            Text($0.name)
        }
        .task {
            await vm.loadProducts()
        }
    }
}
```

Nothing wrong here.

---

## ProductViewModel

Now starts the real story.

```swift
@MainActor
class ProductViewModel: ObservableObject {

    @Published var products: [Product] = []

    func loadProducts() async {

        // Network

        let url = URL(string: "...")!

        let (data, _) = try! await URLSession.shared.data(from: url)

        // Decode

        let response = try! JSONDecoder().decode(ProductResponse.self,
                                                 from: data)

        // Mapping

        let products = response.products.map {

            Product(
                id: $0.id,
                name: $0.title,
                price: $0.price
            )
        }

        // Business Logic

        let filteredProducts = products.filter {

            $0.price > 100
        }

        // Save CoreData

        saveProducts(filteredProducts)

        // UI

        self.products = filteredProducts
    }
}
```

Looks fine?

Many projects look exactly like this.

---

# Let's Analyze

## Responsibility 1

```swift
URLSession
```

Question:

Whose responsibility is networking?

Certainly **not ViewModel**.

---

## Responsibility 2

```swift
JSONDecoder
```

Whose responsibility?

Again

Not ViewModel.

---

## Responsibility 3

```swift
DTO → Product
```

Mapping.

Again

Not ViewModel.

---

## Responsibility 4

```swift
filter {
    price > 100
}
```

Business rule.

Again

Not ViewModel.

---

## Responsibility 5

```swift
CoreData
```

Database.

Again

Not ViewModel.

---

## Responsibility 6

```swift
Published products
```

UI State.

THIS is actually ViewModel's job.

---

Now count.

ViewModel has

```
Networking

Parsing

Business Logic

Database

Mapping

UI State
```

**6 responsibilities.**

A ViewModel should ideally have **1 primary responsibility: manage UI state and coordinate UI interactions.**

---

# Problem 1

Suppose backend changes.

Old response

```json
{
   "title":"iPhone"
}
```

New response

```json
{
   "product_name":"iPhone"
}
```

Where do you modify?

Inside ViewModel.

---

Now imagine

50 screens.

Every ViewModel has decoding.

Good luck.

---

# Problem 2

Manager says

> We are moving from REST to GraphQL.

Where do you modify?

Every ViewModel.

---

# Problem 3

Manager says

> We are replacing CoreData with SwiftData.

Again

Every ViewModel.

---

# Problem 4

Manager says

> Products should come from cache first.

Again

Every ViewModel.

---

Notice the pattern?

Everything changes ViewModel.

---

# Problem 5

Testing

Imagine writing this test.

```
Test ProductViewModel
```

Need to mock

```
URLSession

JSON

CoreData

API

Business Rules
```

Huge effort.

---

# Problem 6

Reusability

Tomorrow another screen needs products.

```
Wishlist

Cart

Search

Home
```

Now what?

Copy

Paste

Copy

Paste

Copy

Paste

Because ViewModel owns everything.

---

# Real Production Story

This is exactly how many apps become after 3–5 years.

One ViewModel becomes

```
1500 lines

2000 lines

3000 lines
```

Then everyone fears touching it.

---

# Let's Rewrite Properly

Now same feature.

---

## Step 1

View

```text
View
```

Only responsibility

```
Display UI
```

Nothing else.

---

## Step 2

ViewModel

```text
ViewModel
```

Only responsibility

```
Manage screen state
```

Example

```swift
@Published var products
@Published var isLoading
@Published var error
```

Nothing else.

---

## Step 3

ViewModel asks

```
UseCase

Give me products.
```

It does NOT ask

```
API

Database

URLSession
```

---

## Step 4

UseCase

Question

"How should products be fetched?"

Business decision.

Maybe

```
Premium user?

Filter products.

Guest?

Hide products.

Offline?

Use cache.
```

This belongs here.

---

## Step 5

Repository

Question

Where should data come from?

```
API?

Database?

Cache?

Mock?

```

Repository decides.

---

## Step 6

Remote Data Source

Only knows

```
URLSession
```

Nothing else.

---

## Step 7

Local Data Source

Only knows

```
CoreData
```

Nothing else.

---

# Now Look At Responsibilities

### View

```
Display
```

One job.

---

### ViewModel

```
State
```

One job.

---

### UseCase

```
Business Rules
```

One job.

---

### Repository

```
Choose data source
```

One job.

---

### RemoteDataSource

```
Networking
```

One job.

---

### LocalDataSource

```
Persistence
```

One job.

---

### Mapper

```
DTO

↓

Entity
```

One job.

---

# Amazing Result

Suppose backend changes.

Who changes?

```
RemoteDataSource

DTO

Mapper
```

Everything else remains untouched.

---

Suppose CoreData becomes SwiftData.

Who changes?

```
LocalDataSource
```

Nothing else.

---

Suppose UI becomes UIKit.

Who changes?

```
View

ViewModel (maybe slightly)
```

Business layer stays identical.

---

Suppose business rule changes.

Old

```
price > 100
```

New

```
price > 500
```

Only

```
UseCase
```

changes.

---

# This is called "Low Coupling"

Every layer knows very little.

```
View
      ↓
ViewModel
      ↓
UseCase
      ↓
Repository
      ↓
Remote
Local
```

No shortcuts.

---

# The Biggest Mental Shift

Many developers think Clean Architecture is about **adding more files**.

It is not.

It is about **moving responsibilities to the right place**.

Think of it like a company:

```
CEO
Accountant
HR
Engineer
Security
Receptionist
```

Imagine if the receptionist also:

* approves salaries
* writes software
* manages finances
* hires employees

The company would still function—for a while—but it would become chaotic and hard to scale.

The same thing happens when one `ViewModel` starts doing:

* networking
* parsing
* caching
* business rules
* persistence
* UI state

Clean Architecture doesn't make the application "more complex." It **distributes work to the right specialists**, just like a well-run company.


