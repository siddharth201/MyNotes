# MVVM

---

# ✅ Best One-Line Definition (MEMORIZE)

> **MVVM is an architectural pattern that separates UI, presentation logic, and data using Model, View, and ViewModel.**

---

# ✅ Even Simpler Version

> **In MVVM, View observes ViewModel, and ViewModel exposes data and actions for the View.**

---

# ✅ 20-Second Interview Explanation

> “MVVM stands for Model–View–ViewModel. The View is responsible only for rendering UI. The ViewModel holds presentation logic and exposes observable state. The Model represents data and domain entities. The View does not talk directly to the Model; it communicates through the ViewModel, which makes the UI testable and loosely coupled.”

<details>
<summary><b>Are presentation logic and business logic not the same.</b></summary>

 **No, presentation logic and business logic are not the same.**

**Business logic** defines the core rules of your product (which remain true even if you didn't have a mobile app), whereas **presentation logic** defines how data is formatted, validated, or prepared specifically for the user interface.

---

### Presentation Logic vs. Business Logic

Using a banking app as an example:

| Aspect | Business Logic (Domain) | Presentation Logic (UI / ViewModel) |
| --- | --- | --- |
| **Core Question** | *"What are the rules of the business?"* | *"How should this look and behave on screen?"* |
| **Examples** | • Calculating compound interest<br>

<br>• Preventing a withdrawal if balance is too low<br>

<br>• Applying a 2% international transfer fee | • Formatting `1250.5` as `"$1,250.50"`<br>

<br>• Turning the balance text red when negative<br>

<br>• Showing a loading spinner while a transfer runs<br>

<br>• Disabling the "Submit" button until text is typed |
| **Portability** | Remains identical whether the app is on iOS, Android, Web, or a CLI tool. | Specific to the screen layout and user interaction flow. |

---

### Where Does Business Logic Sit?

Where business logic lives depends on how large your app is and whether you use **Basic MVVM** or **MVVM + Clean Architecture**:

#### 1. In Basic MVVM (Small to Medium Apps)

In simple apps without a dedicated Domain layer, business logic is split between two places:

* **Inside the Model:** Rules tied directly to a single entity (e.g., `order.calculateTotalWithTax()`).
* **Inside the ViewModel / Services:** Rules that coordinate actions (e.g., calling a `PaymentService` to process a checkout). *Note: Putting too much business logic here leads to "Massive ViewModels."*

#### 2. In MVVM + Clean Architecture (Large / Scalable Apps)

Clean Architecture adds a **Domain Layer** right between the ViewModel and the Data Layer (Repositories), isolating business logic completely from the UI:

```text
[ View ]  ──▶  [ ViewModel ]  ──▶  [ Use Cases / Interactors ]  ──▶  [ Repository ]
  (UI)       (Presentation Logic)         (Business Logic)              (Data Access)

```

* **ViewModel (Presentation Layer):** Calls a Use Case, catches errors, and maps the result into UI-ready strings, colors, and flags (`isLoading = false`).
* **Use Cases / Interactors (Domain Layer):** Hold the core business logic (e.g., `TransferMoneyUseCase`). It checks if the user is verified, verifies funds via the repository, applies transfer fees, and executes the transaction.
* **Entities (Domain Layer):** Pure data models containing core enterprise rules (e.g., a `BankAccount` struct with its core validation rules).

### Quick Rule of Thumb

Ask yourself: **"If I redesigned this screen from scratch, would this code change?"**

* **Yes** $\rightarrow$ It is **Presentation Logic** (put it in the ViewModel).
* **No** $\rightarrow$ It is **Business Logic** (put it in a Model, Domain Entity, or Use Case).
</details>

---

# 🧠 What Each Layer Means (Quick)

**Model**

* Data structures
* Domain objects

**View**

* SwiftUI View / UIViewController
* Displays data
* Forwards user actions

**ViewModel**

* UI state
* Formatting
* Calls use cases / repository
* No UIKit / SwiftUI code

---

# 🖼️ Visual You Should Imagine

```
View  ↔  ViewModel  →  Model
```

(View observes VM, VM uses Model)

---

# 🎯 Key Benefits (Mention Any 2)

* Separation of concerns
* Testable ViewModels
* Easier maintenance
* Reusable logic

---

# ⚡ If Interviewer Asks: Why MVVM over MVC?

> “MVC often leads to Massive View Controllers. MVVM moves presentation logic into ViewModel, keeping views thin and testable.”

---

# 🧠 One-Line Memory Hook

> **View shows, ViewModel thinks, Model stores.**

---

# 🏁 Final Short Answer (If Time Is Tight)

> “MVVM separates UI from presentation logic using a ViewModel that exposes observable state to the View.”

---



