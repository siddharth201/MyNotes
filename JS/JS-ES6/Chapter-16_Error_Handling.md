# Day 16 — Error Handling (Synchronous & Asynchronous)

Error handling is one of the most important skills for a React Native developer. Users expect apps to **fail gracefully** instead of crashing.

By the end of this lesson, you'll understand:

* `try`, `catch`, and `finally`
* `throw` and custom errors
* Synchronous vs asynchronous errors
* Error propagation
* Best practices for API calls
* Production-ready React Native patterns

---

# 1. What is an Error?

An error is an unexpected problem that prevents your code from completing normally.

Examples:

* Dividing by invalid input
* Calling a method on `undefined`
* Network failures
* API returning `500`
* JSON parsing failures

Example:

```javascript
const user = undefined;

console.log(user.name);
```

Output:

```text
TypeError: Cannot read properties of undefined
```

---

# 2. Synchronous Errors

A synchronous error occurs immediately during execution.

```javascript
console.log("Start");

const obj = null;

console.log(obj.name);

console.log("End");
```

Output:

```text
Start
TypeError...
```

`"End"` never executes because the error interrupts execution.

---

# 3. `try` and `catch`

Use `try` to wrap code that might fail.

```javascript
try {
    const obj = null;

    console.log(obj.name);

} catch (error) {

    console.log("Something went wrong");

}
```

Output:

```text
Something went wrong
```

The app continues instead of crashing.

---

# Mental Model

```
try
 │
 │ Success?
 │
 ├──────────► Continue
 │
 │ Error?
 ▼
catch
 │
 ▼
Handle Error
```

---

# 4. The Error Object

The caught error contains useful information.

```javascript
try {

    JSON.parse("invalid json");

} catch (error) {

    console.log(error.name);

    console.log(error.message);

}
```

Typical output:

```text
SyntaxError

Unexpected token ...
```

Useful properties:

| Property  | Meaning                           |
| --------- | --------------------------------- |
| `name`    | Error type                        |
| `message` | Description                       |
| `stack`   | Call stack (mostly for debugging) |

---

# 5. `finally`

`finally` always runs.

```javascript
try {

    console.log("Trying");

} catch {

    console.log("Failed");

} finally {

    console.log("Always executes");

}
```

Output:

```text
Trying
Always executes
```

Even when an error occurs:

```javascript
try {

    throw new Error("Boom");

} catch {

    console.log("Caught");

} finally {

    console.log("Cleanup");

}
```

Output:

```text
Caught
Cleanup
```

---

# 6. Throwing Your Own Errors

You can create errors intentionally.

```javascript
throw new Error("Invalid User");
```

Example:

```javascript
function login(user) {

    if (!user) {
        throw new Error("User required");
    }

    return "Success";
}
```

---

# 7. Catching Custom Errors

```javascript
try {

    login(null);

} catch (error) {

    console.log(error.message);

}
```

Output:

```text
User required
```

---

# 8. Input Validation Example

```javascript
function divide(a, b) {

    if (b === 0) {
        throw new Error("Cannot divide by zero");
    }

    return a / b;
}
```

Usage:

```javascript
try {

    console.log(divide(10, 0));

} catch (error) {

    console.log(error.message);

}
```

Output:

```text
Cannot divide by zero
```

---

# 9. Asynchronous Errors with `async/await`

```javascript
async function loadUsers() {

    const response =
        await fetch(url);

    const data =
        await response.json();

    return data;
}
```

Handle errors with:

```javascript
try {

    const users =
        await loadUsers();

} catch (error) {

    console.log(error);

}
```

---

# 10. Why `try/catch` Around `await`?

Because any awaited Promise may reject.

```
await fetch()

        │
        ▼

Success ─────► Continue

Failure ─────► catch
```

---

# 11. Production API Example

```javascript
async function getUsers() {

    try {

        const response =
            await fetch(
                "https://example.com/users"
            );

        if (!response.ok) {
            throw new Error(
                `HTTP ${response.status}`
            );
        }

        const users =
            await response.json();

        return users;

    } catch (error) {

        console.log(error.message);

        throw error;

    }
}
```

Notice:

```javascript
throw error;
```

This rethrows the error to the caller.

---

# 12. Error Propagation

Suppose:

```javascript
async function getUser() {

    throw new Error("API Failed");

}
```

Then:

```javascript
async function loadProfile() {

    try {

        await getUser();

    } catch (error) {

        console.log(error.message);

    }
}
```

Output:

```text
API Failed
```

Errors move upward until handled.

---

# 13. Nested Function Example

```javascript
function c() {

    throw new Error("Boom");

}

function b() {

    c();

}

function a() {

    b();

}

try {

    a();

} catch (error) {

    console.log(error.message);

}
```

Output:

```text
Boom
```

Flow:

```
a()
 │
 ▼
b()
 │
 ▼
c()
 │
 ▼
throw
 │
 ▼
catch
```

---

# 14. React Native Login Example

```javascript
const login = async () => {

    try {

        const response =
            await fetch(LOGIN_URL);

        if (!response.ok) {
            throw new Error(
                "Login Failed"
            );
        }

        const user =
            await response.json();

        setUser(user);

    } catch (error) {

        Alert.alert(
            "Error",
            error.message
        );

    }
};
```

Instead of crashing, the user sees a friendly message.

---

# 15. Retry Pattern

```javascript
const loadData = async () => {

    try {

        await fetchUsers();

    } catch {

        console.log(
            "Retry Later"
        );

    }
};
```

Many production apps also show a **Retry** button.

---

# 16. Creating Custom Error Types

```javascript
class ValidationError
    extends Error {

    constructor(message) {

        super(message);

        this.name =
            "ValidationError";

    }

}
```

Usage:

```javascript
throw new ValidationError(
    "Email required"
);
```

Catch:

```javascript
catch (error) {

    if (
        error instanceof
        ValidationError
    ) {

        console.log(
            "Validation failed"
        );

    }

}
```

---

# 17. Common Built-in Errors

```javascript
TypeError
```

Wrong type.

```javascript
undefined.name
```

---

```javascript
ReferenceError
```

Variable doesn't exist.

```javascript
console.log(x);
```

---

```javascript
SyntaxError
```

Invalid syntax.

```javascript
JSON.parse("{");
```

---

```javascript
RangeError
```

Value outside allowed range.

---

# 18. Promise Error Handling

```javascript
fetch(url)

    .then(response =>
        response.json()
    )

    .catch(error => {

        console.log(error);

    });
```

Equivalent with async:

```javascript
try {

    const response =
        await fetch(url);

} catch (error) {

    console.log(error);

}
```

---

# 19. Common Mistakes

## Mistake 1

Ignoring errors:

```javascript
await fetch(url);
```

Always prefer:

```javascript
try {

    await fetch(url);

} catch (error) {

    console.log(error);

}
```

---

## Mistake 2

Throwing strings:

```javascript
throw "Invalid";
```

Prefer:

```javascript
throw new Error("Invalid");
```

because `Error` objects carry useful metadata.

---

## Mistake 3

Swallowing errors silently:

```javascript
catch {

}
```

At minimum:

```javascript
catch (error) {

    console.log(error);

}
```

or show an appropriate user-facing message.

---

# 20. Interview Questions

### Q1: Difference between `throw` and `catch`?

* `throw` creates or forwards an error.
* `catch` handles an error.

---

### Q2: Does `finally` always execute?

Yes, in normal control flow it runs whether the operation succeeds or fails.

---

### Q3: Why use `throw new Error()` instead of throwing a string?

Because `Error` objects include structured information like `name`, `message`, and `stack`.

---

### Q4: How do you catch errors from `await`?

Wrap the awaited code in `try/catch`.

---

### Q5: Should API calls check `response.ok`?

Yes. An HTTP response like `404` or `500` may not reject the Promise automatically, so check `response.ok` (or `response.status`) and handle it explicitly.

---

# 21. Practice Exercises

## Exercise 1

Write a function:

```javascript
function checkAge(age)
```

Throw:

```text
Age must be at least 18
```

when `age < 18`.

---

## Exercise 2

Wrap `checkAge(15)` inside a `try/catch` block and print the error message.

---

## Exercise 3

Create an async function that fetches data and handles network failures with `try/catch`.

---

## Exercise 4

Create a custom `ValidationError` class and throw it when an email is empty.

---

## Exercise 5 (React Native Style)

```javascript
const loadProfile = async () => {

    try {

        const response =
            await fetch(PROFILE_URL);

        if (!response.ok) {
            throw new Error(
                "Failed to load profile"
            );
        }

        const profile =
            await response.json();

        setProfile(profile);

    } catch (error) {

        console.log(error.message);

    } finally {

        setLoading(false);

    }
};
```

Explain why `finally` is a good place to stop a loading spinner.

---

# Mental Model Cheat Sheet

| Concept               | Purpose                        |
| --------------------- | ------------------------------ |
| `try`                 | Wrap risky code                |
| `catch`               | Handle errors                  |
| `finally`             | Cleanup that should always run |
| `throw`               | Create or propagate an error   |
| `Error`               | Standard error object          |
| `response.ok`         | Check HTTP success             |
| `try/catch` + `await` | Handle async failures          |
| `instanceof`          | Detect custom error types      |

---

# React Native Best Practices

A robust network call often looks like this:

```javascript
const fetchData = async () => {
    try {
        setLoading(true);

        const response = await fetch(API_URL);

        if (!response.ok) {
            throw new Error("Request failed");
        }

        const data = await response.json();

        setData(data);

    } catch (error) {
        console.log(error.message);
    } finally {
        setLoading(false);
    }
};
```

This pattern ensures:

* The loading indicator is shown while work is in progress.
* HTTP errors are detected explicitly.
* Unexpected failures are caught.
* The loading indicator is hidden whether the request succeeds or fails.

---



