
# **Facade Pattern**

> **Facade Pattern provides a simple, unified interface to a complex subsystem.
> Instead of exposing many classes and methods, Facade offers a single clean API that hides internal complexity.**

---

## ✔ What Facade actually means (Simple)

### Correct:

* It simplifies complex workflows
* It hides multiple steps behind one method
* It reduces coupling
* It keeps your ViewController or business logic clean

### Not fully correct:

* Facade is NOT just “create a helper class when a method becomes bulky”
* It is about **wrapping multiple complicated subsystems behind one simple API**

---

## 🎯 A Better Way to Say What You Meant

### Your Meaning (refined):

> If you see a method or workflow doing too many things — validation, network call, parsing, saving, etc. — instead of doing it all in one place, create a Facade class that organizes these steps and exposes **one simple method**.

This **is correct Facade**.

---

## 🍎 **Simple iOS Example**

Login process is complex:

* Validate input
* Build request
* Make network call
* Parse JSON
* Save token
* Update session

Without Facade → ViewController becomes a mess.

With Facade:

```swift
class LoginFacade {
    func login(email: String, password: String) {
        Validator.validate(email, password)
        let request = RequestBuilder().setEmail(email).setPassword(password).build()
        let data = APIService.shared.send(request)
        TokenManager.save(data.token)
    }
}
```

Usage:

```swift
LoginFacade().login(email: "sid@gmail.com", password: "1234")
```

✔ ViewController becomes clean
✔ Complex logic stays behind the facade
✔ You expose **only** what is needed

---

## 🧠 **Correct Way to Describe It in Interview**

Here is a perfect answer:

> **Facade Pattern provides a simpler interface on top of a complex set of classes or operations.
> Instead of letting the client deal with the complexity, we create a Facade class that organizes the workflow and exposes a single clean method.
> It improves readability, reduces coupling, and keeps client code clean.**

---

## ❌ Common Mistake (Avoid saying this)

> “Facade is used whenever a class becomes bulky.”

Not exactly.
A bulky class may need **Refactoring**, not necessarily Facade.

Facade is specifically about:

✔ Hiding complexity
✔ Acting as a gateway
✔ Providing a unified API over multiple classes

---

## ⭐ Perfect Memory Trick

> **Adapter changes interface.**
> **Facade simplifies interface.**

Adapter = compatibility
Facade = simplicity

---

## **Example:**  

Great — here is a **clean, complete, production-style example** of the **Facade Design Pattern** using:

✔ `LoginFacade`
✔ Helper classes (`Validator`, `LoginRequestBuilder`, `APIClient`, `KeychainManager`, `UserSession`)
✔ **ViewModel** (NOT ViewController) calling the Facade
✔ Fully working Swift code

This is exactly the kind of answer interviewers love because it shows real architecture + clean layering.

---

## ✅ **1. Helper Classes (Subsystems)**

These represent internal complexity that the Facade will hide.

---

## 🔹 **Validator**

```swift
struct Validator {
    static func isValidEmail(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }

    static func isValidPassword(_ password: String) -> Bool {
        return password.count >= 4
    }
}
```

---

## 🔹 **LoginRequestBuilder**

```swift
struct LoginRequest {
    let email: String
    let password: String
}

class LoginRequestBuilder {
    private var email: String = ""
    private var password: String = ""

    func setEmail(_ email: String) -> Self {
        self.email = email
        return self
    }

    func setPassword(_ password: String) -> Self {
        self.password = password
        return self
    }

    func build() -> LoginRequest {
        return LoginRequest(email: email, password: password)
    }
}
```

---

## 🔹 **APIClient (Fake Networking Layer)**

```swift
class APIClient {
    static let shared = APIClient()

    func send(_ request: LoginRequest, completion: @escaping (Result<String, Error>) -> Void) {

        // Simulate success response with token
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            completion(.success("FAKE_AUTH_TOKEN_123"))
        }
    }
}
```

---

## 🔹 **KeychainManager**

```swift
class KeychainManager {
    static func save(token: String) {
        print("Token saved in Keychain: \(token)")
    }
}
```

---

## 🔹 **UserSession**

```swift
class UserSession {
    static let shared = UserSession()
    private(set) var token: String?

    func start(token: String) {
        self.token = token
        print("User session started with token: \(token)")
    }
}
```

---

## 🎯 **2. FACADE — Hides all the complexity**

```swift
class LoginFacade {

    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {

        // Step 1: Validate
        guard Validator.isValidEmail(email),
              Validator.isValidPassword(password) else {
            completion(false)
            return
        }

        // Step 2: Build request
        let request = LoginRequestBuilder()
            .setEmail(email)
            .setPassword(password)
            .build()

        // Step 3: Network call
        APIClient.shared.send(request) { result in
            switch result {
            case .success(let token):
                
                // Step 4 & 5: Save token + start session
                KeychainManager.save(token: token)
                UserSession.shared.start(token: token)

                completion(true)

            case .failure:
                completion(false)
            }
        }
    }
}
```

---

## 👨‍💻 **3. ViewModel (Instead of ViewController)**

The ViewModel uses the Facade to keep UI code clean.

```swift
class LoginViewModel {

    private let loginFacade = LoginFacade()

    var onLoginSuccess: (() -> Void)?
    var onLoginFailure: (() -> Void)?

    func login(email: String, password: String) {
        loginFacade.login(email: email, password: password) { [weak self] success in
            DispatchQueue.main.async {
                if success {
                    self?.onLoginSuccess?()
                } else {
                    self?.onLoginFailure?()
                }
            }
        }
    }
}
```

Usage example (inside SwiftUI or UIKit):

```swift
let vm = LoginViewModel()

vm.onLoginSuccess = {
    print("Navigate to Home screen")
}

vm.onLoginFailure = {
    print("Show error message")
}

vm.login(email: "sid@gmail.com", password: "1234")
```

---

## 🔥 **Why This Is a Perfect Facade Example**

| Facade Job         | How Code Shows It                           |
| ------------------ | ------------------------------------------- |
| Hide complexity    | ViewModel only calls `login()`              |
| Simplify workflow  | 5 steps hidden behind 1 method              |
| Reduce boilerplate | No validation or networking in ViewModel    |
| Clean architecture | ViewModel does not know about subsystems    |
| Easy to modify     | Change internals without touching ViewModel |

This exactly demonstrates **Facade Pattern** the way companies expect in interviews.

---

## ⭐ **Interview-Ready Answer**

> “In my iOS projects, I use the Facade Pattern when a flow becomes too complex.
> For example, in the login flow, instead of letting the ViewModel handle validation, request building, networking, token saving, and session management, I create a LoginFacade that exposes a single clean method `login()`.
> The ViewModel stays clean, and all complexity stays behind the facade.”




