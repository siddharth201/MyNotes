# Day 14 — Fetch API & AJAX (Complete React Native Guide)

This is one of the most practical topics in JavaScript and React Native.

After this lesson, you'll understand how apps communicate with servers to:

* Log in users
* Load profiles
* Fetch product lists
* Submit forms
* Upload data
* Delete records

Almost every React Native app relies on these concepts.

---

# 1. What is AJAX?

**AJAX** stands for:

> **Asynchronous JavaScript And XML**

Despite the name, modern applications usually exchange **JSON**, not XML.

The key idea is:

> **Send or receive data from a server without blocking or reloading the application.**

---

## Without AJAX

Imagine visiting a shopping website.

```
User clicks "View Products"

↓

Browser reloads entire page

↓

Products appear
```

Every interaction refreshes everything.

---

## With AJAX

```
User clicks "View Products"

↓

JavaScript sends request in background

↓

Server responds with data

↓

UI updates without full reload
```

This creates a smoother experience.

---

# 2. What is the Fetch API?

`fetch()` is the modern JavaScript API for making HTTP requests.

Example:

```javascript
fetch("https://jsonplaceholder.typicode.com/users")
```

It returns **a Promise**, so you can use:

```javascript
.then(...)
.catch(...)
```

or

```javascript
await
```

---

# 3. How Fetch Works

```
React Native App
        │
        │ fetch()
        ▼
     Internet
        │
        ▼
      Server
        │
        │ JSON Response
        ▼
React Native receives data
```

---

# 4. Your First GET Request

```javascript
fetch("https://jsonplaceholder.typicode.com/users")
    .then(response => response.json())
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.log(error);
    });
```

---

# 5. Why `response.json()`?

A common beginner question.

The server sends a response object.

```
Response
   │
   ├── status
   ├── headers
   ├── body
```

The body contains JSON text.

Calling:

```javascript
response.json()
```

parses it into a JavaScript object.

---

## Example

Server sends:

```json
{
  "id": 1,
  "name": "John"
}
```

After:

```javascript
const data = await response.json();
```

You get:

```javascript
{
    id: 1,
    name: "John"
}
```

---

# 6. Using Async/Await

The previous example becomes much cleaner.

```javascript
async function loadUsers() {
    try {
        const response = await fetch(
            "https://jsonplaceholder.typicode.com/users"
        );

        const users = await response.json();

        console.log(users);
    } catch (error) {
        console.log(error);
    }
}
```

This style is preferred in modern React Native code.

---

# 7. GET Request

GET retrieves data.

Example:

```
GET /users
```

Server returns:

```json
[
  {
    "id": 1,
    "name": "John"
  }
]
```

Code:

```javascript
const response = await fetch(url);

const data = await response.json();
```

---

# 8. POST Request

POST creates new data.

Suppose you register a user.

```
POST /users
```

Body:

```json
{
  "name": "Siddharth",
  "age": 30
}
```

JavaScript:

```javascript
fetch("https://example.com/users", {
    method: "POST",
    headers: {
        "Content-Type": "application/json"
    },
    body: JSON.stringify({
        name: "Siddharth",
        age: 30
    })
});
```

---

# 9. Why `JSON.stringify()`?

`fetch()` expects a string for the request body.

Object:

```javascript
{
    name: "Siddharth"
}
```

becomes:

```json
"{\"name\":\"Siddharth\"}"
```

using:

```javascript
JSON.stringify(object)
```

---

# 10. PUT Request

PUT usually replaces or updates an existing resource.

```javascript
fetch("https://example.com/users/1", {
    method: "PUT",
    headers: {
        "Content-Type": "application/json"
    },
    body: JSON.stringify({
        name: "Updated Name"
    })
});
```

---

# 11. PATCH Request

PATCH partially updates data.

```javascript
fetch("https://example.com/users/1", {
    method: "PATCH",
    headers: {
        "Content-Type": "application/json"
    },
    body: JSON.stringify({
        age: 31
    })
});
```

---

# 12. DELETE Request

Deletes data.

```javascript
fetch("https://example.com/users/1", {
    method: "DELETE"
});
```

---

# 13. HTTP Methods Summary

| Method | Purpose             |
| ------ | ------------------- |
| GET    | Read data           |
| POST   | Create data         |
| PUT    | Replace/update data |
| PATCH  | Partial update      |
| DELETE | Remove data         |

---

# 14. Headers

Headers provide metadata about the request.

Example:

```javascript
headers: {
    "Content-Type": "application/json"
}
```

Another common example:

```javascript
headers: {
    Authorization: "Bearer your_token"
}
```

Used for authenticated APIs.

---

# 15. Checking for HTTP Errors

A very common mistake is assuming `fetch` throws an error for every bad HTTP status.

Consider:

```javascript
const response = await fetch(url);
```

If the server returns:

```
404 Not Found
```

or

```
500 Internal Server Error
```

`fetch` may still resolve successfully. You should check:

```javascript
if (!response.ok) {
    throw new Error(`HTTP Error ${response.status}`);
}
```

Then parse JSON:

```javascript
const data = await response.json();
```

---

# 16. Complete Production-Style Example

```javascript
async function loadUsers() {
    try {
        const response = await fetch(
            "https://jsonplaceholder.typicode.com/users"
        );

        if (!response.ok) {
            throw new Error(
                `Server Error: ${response.status}`
            );
        }

        const users = await response.json();

        console.log(users);

    } catch (error) {
        console.log(error.message);
    }
}
```

---

# 17. React Native Example

```javascript
const loadUsers = async () => {
    try {
        const response = await fetch(
            "https://jsonplaceholder.typicode.com/users"
        );

        const users = await response.json();

        setUsers(users);

    } catch (error) {
        console.log(error);
    }
};
```

This is a pattern you'll write frequently.

---

# 18. Loading Multiple APIs

Instead of:

```javascript
const users = await getUsers();
const posts = await getPosts();
const comments = await getComments();
```

use:

```javascript
const [users, posts, comments] =
    await Promise.all([
        getUsers(),
        getPosts(),
        getComments()
    ]);
```

Much faster because the requests run in parallel.

---

# 19. Fetch Lifecycle

```
fetch(url)
     │
     ▼
Promise<Response>
     │
     ▼
response.json()
     │
     ▼
Promise<Data>
     │
     ▼
JavaScript Object
```

---

# 20. Common Beginner Mistake

Wrong:

```javascript
const data = fetch(url);

console.log(data);
```

Output:

```
Promise { <pending> }
```

Because `fetch` returns a Promise.

Correct:

```javascript
const response = await fetch(url);
const data = await response.json();
```

or

```javascript
fetch(url)
    .then(response => response.json())
    .then(data => console.log(data));
```

---

# 21. Interview Questions

## Q1: Does `fetch()` return JSON?

**Answer:** No. It returns a **Promise** that resolves to a `Response` object.

---

## Q2: Why call `response.json()`?

**Answer:** To parse the response body into a JavaScript object.

---

## Q3: Does `fetch()` reject on HTTP 404?

**Answer:** Not necessarily. It usually resolves with a `Response`; check `response.ok` or `response.status` yourself.

---

## Q4: Difference between GET and POST?

| GET                           | POST                            |
| ----------------------------- | ------------------------------- |
| Reads data                    | Creates data                    |
| Usually no request body       | Usually includes a request body |
| Safe/idempotent by convention | Changes server state            |

---

## Q5: Why use `JSON.stringify()`?

To convert a JavaScript object into a JSON string suitable for transmission.

---

# 22. Mini React Native Project

Imagine a screen that loads users.

```javascript
const loadUsers = async () => {
    try {
        const response = await fetch(
            "https://jsonplaceholder.typicode.com/users"
        );

        if (!response.ok) {
            throw new Error("Failed to load users");
        }

        const users = await response.json();

        setUsers(users);

    } catch (error) {
        console.log(error.message);
    }
};
```

When the API succeeds:

```
Loading...
      │
      ▼
Users Received
      │
      ▼
Update State
      │
      ▼
UI Re-renders
```

---

# 23. Best Practices

✅ Prefer `async/await` over long `.then()` chains for readability.

✅ Always wrap network calls in `try/catch`.

✅ Check `response.ok` before parsing the response.

✅ Send JSON bodies with:

```javascript
body: JSON.stringify(data)
```

and include:

```javascript
headers: {
    "Content-Type": "application/json"
}
```

---

# Cheat Sheet

| Concept            | Key Idea                             |
| ------------------ | ------------------------------------ |
| AJAX               | Background communication with server |
| `fetch()`          | Sends HTTP requests                  |
| GET                | Read data                            |
| POST               | Create data                          |
| PUT                | Replace/update data                  |
| PATCH              | Partial update                       |
| DELETE             | Remove data                          |
| `response.json()`  | Parse JSON response                  |
| `JSON.stringify()` | Convert object to JSON string        |
| `response.ok`      | Check HTTP success                   |
| `Promise.all()`    | Run requests in parallel             |

---



