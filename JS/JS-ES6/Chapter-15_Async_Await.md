# Day 15 — Async/Await (Deep Dive)

By the end of this lesson, you should be able to answer these interview questions confidently:

* What does `async` do?
* What does `await` do?
* Does `await` block the entire JavaScript thread?
* Can you use `await` outside an `async` function?
* When should you use `Promise.all()` with `await`?
* Why is `async/await` preferred over `.then()` chains?

---

# 1. Why Do We Need Async/Await?

Suppose you want to:

1. Fetch a user
2. Fetch that user's posts
3. Fetch comments for the first post

Using Promises:

```javascript
getUser()
  .then(user => getPosts(user.id))
  .then(posts => getComments(posts[0].id))
  .then(comments => {
    console.log(comments);
  })
  .catch(error => {
    console.log(error);
  });
```

This works, but long chains can become difficult to read.

With `async/await`:

```javascript
try {
    const user = await getUser();

    const posts = await getPosts(user.id);

    const comments =
        await getComments(posts[0].id);

    console.log(comments);

} catch (error) {
    console.log(error);
}
```

This looks almost like synchronous code.

---

# 2. What is `async`?

An `async` function **always returns a Promise**.

Example:

```javascript
async function greet() {
    return "Hello";
}
```

You might expect:

```text
Hello
```

Actually:

```javascript
console.log(greet());
```

prints something like:

```text
Promise { "Hello" }
```

JavaScript automatically wraps the return value.

Equivalent to:

```javascript
function greet() {
    return Promise.resolve("Hello");
}
```

---

# 3. What is `await`?

`await` waits for a Promise to settle and extracts its resolved value.

Example:

```javascript
const promise =
    Promise.resolve(42);

const value =
    await promise;

console.log(value);
```

Output:

```text
42
```

---

# Mental Model

Without `await`:

```javascript
const value =
    Promise.resolve(42);

console.log(value);
```

Output:

```text
Promise { 42 }
```

With `await`:

```javascript
const value =
    await Promise.resolve(42);

console.log(value);
```

Output:

```text
42
```

---

# 4. Rule: `await` Must Be Inside an `async` Function

Wrong:

```javascript
const data =
    await fetch(url);
```

This causes an error in ordinary scripts.

Correct:

```javascript
async function loadData() {

    const data =
        await fetch(url);

}
```

---

# 5. A Complete Example

```javascript
async function loadUser() {

    const response =
        await fetch(
            "https://jsonplaceholder.typicode.com/users/1"
        );

    const user =
        await response.json();

    console.log(user);

}
```

Execution flow:

```text
fetch()
    │
    ▼
Response
    │
    ▼
response.json()
    │
    ▼
JavaScript Object
```

---

# 6. Multiple `await`s

```javascript
async function example() {

    const a =
        await Promise.resolve(10);

    const b =
        await Promise.resolve(20);

    console.log(a + b);

}
```

Output:

```text
30
```

These execute one after another.

---

# 7. Sequential Execution

```javascript
const user =
    await getUser();

const posts =
    await getPosts();

const comments =
    await getComments();
```

Visual:

```text
User
  ↓
Posts
  ↓
Comments
```

If each takes 2 seconds:

```
2 + 2 + 2 = 6 seconds
```

---

# 8. Parallel Execution with `Promise.all`

Better approach:

```javascript
const [
    user,
    posts,
    comments
] = await Promise.all([
    getUser(),
    getPosts(),
    getComments()
]);
```

Visual:

```text
User ─────┐
Posts ────┼──► Promise.all
Comments ─┘
```

If each takes 2 seconds:

```
Total ≈ 2 seconds
```

This is a common React Native optimization.

---

# 9. `await` Does NOT Block the Entire App

A common misconception:

> "`await` freezes JavaScript."

Not exactly.

It pauses **only the current async function** while allowing the event loop to continue processing other work.

Example:

```javascript
async function demo() {

    console.log("A");

    await Promise.resolve();

    console.log("B");

}

console.log("Start");

demo();

console.log("End");
```

Output:

```text
Start
A
End
B
```

Notice the rest of the program continues running.

---

# 10. Error Handling with `try/catch`

Suppose:

```javascript
async function loadData() {

    const response =
        await fetch(url);

}
```

If something fails:

```javascript
try {

    const response =
        await fetch(url);

    const data =
        await response.json();

    console.log(data);

} catch (error) {

    console.log(error.message);

}
```

This is the recommended pattern.

---

# 11. Equivalent Promise Code

Async/Await:

```javascript
const response =
    await fetch(url);

const data =
    await response.json();
```

Equivalent Promise chain:

```javascript
fetch(url)
    .then(response => response.json())
    .then(data => {
        console.log(data);
    });
```

---

# 12. Returning Values

```javascript
async function add() {
    return 10;
}
```

Equivalent to:

```javascript
function add() {
    return Promise.resolve(10);
}
```

Consume it:

```javascript
const value =
    await add();

console.log(value);
```

Output:

```text
10
```

---

# 13. Returning Another Promise

```javascript
async function getNumber() {

    return Promise.resolve(100);

}
```

Calling:

```javascript
const value =
    await getNumber();
```

Results in:

```text
100
```

JavaScript automatically unwraps the Promise.

---

# 14. React Native Example

```javascript
const loadUsers = async () => {

    try {

        const response =
            await fetch(
                "https://jsonplaceholder.typicode.com/users"
            );

        if (!response.ok) {
            throw new Error("Failed request");
        }

        const users =
            await response.json();

        setUsers(users);

    } catch (error) {

        console.log(error.message);

    }

};
```

This is close to production-quality code.

---

# 15. Loading Multiple APIs

Bad:

```javascript
const user =
    await getUser();

const notifications =
    await getNotifications();

const messages =
    await getMessages();
```

Better:

```javascript
const [
    user,
    notifications,
    messages
] = await Promise.all([
    getUser(),
    getNotifications(),
    getMessages()
]);
```

---

# 16. Async Arrow Functions

Very common in React Native.

```javascript
const loadUsers = async () => {

    const response =
        await fetch(url);

    return response.json();

};
```

Also common:

```javascript
const onPress = async () => {

    console.log("Button Pressed");

};
```

---

# 17. Common Mistakes

## Mistake 1: Forgetting `await`

Wrong:

```javascript
const response =
    fetch(url);

console.log(response);
```

Output:

```text
Promise { <pending> }
```

Correct:

```javascript
const response =
    await fetch(url);
```

---

## Mistake 2: Sequential Requests That Could Be Parallel

Wrong:

```javascript
await fetchUsers();

await fetchPosts();

await fetchComments();
```

Better:

```javascript
await Promise.all([
    fetchUsers(),
    fetchPosts(),
    fetchComments()
]);
```

---

## Mistake 3: No Error Handling

Wrong:

```javascript
const response =
    await fetch(url);
```

Better:

```javascript
try {

    const response =
        await fetch(url);

} catch (error) {

    console.log(error);

}
```

---

# 18. Interview Questions

### Q1: Does `async` always return a Promise?

**Answer:** Yes.

---

### Q2: Can `await` be used with non-Promise values?

Yes.

```javascript
const x = await 10;

console.log(x);
```

Output:

```text
10
```

JavaScript treats it as an already-resolved value.

---

### Q3: Does `await` block the event loop?

**Answer:** No. It pauses only the current async function.

---

### Q4: Which is better: `.then()` or `async/await`?

They are built on the same Promise mechanism.

`async/await` is often preferred because it is easier to read and reason about.

---

### Q5: Can you use `await` outside an async function?

Generally, no (unless you're in an environment that supports top-level `await` in ES modules).

---

# 19. Practice Exercises

### Exercise 1

Create:

```javascript
async function greet() {
    return "Hello";
}
```

Call it and print the resolved value.

---

### Exercise 2

Use `await` with:

```javascript
Promise.resolve(50)
```

Print:

```text
50
```

---

### Exercise 3

Write an async function that fetches users from:

```text
https://jsonplaceholder.typicode.com/users
```

Parse and print the JSON.

---

### Exercise 4

Use `Promise.all` and `await` to load three simulated APIs in parallel.

---

### Exercise 5 (React Native Style)

Create:

```javascript
const loadDashboard = async () => {

    const [
        user,
        posts,
        notifications
    ] = await Promise.all([
        getUser(),
        getPosts(),
        getNotifications()
    ]);

    console.log(user);
    console.log(posts);
    console.log(notifications);

};
```

Explain why this is faster than awaiting each call sequentially.

---

# Cheat Sheet

| Concept                      | Key Idea                                   |
| ---------------------------- | ------------------------------------------ |
| `async`                      | Makes a function return a Promise          |
| `await`                      | Waits for a Promise and extracts its value |
| `try/catch`                  | Handles async errors                       |
| `Promise.all`                | Runs independent async tasks in parallel   |
| `await` pauses               | Only the current async function            |
| Preferred React Native style | `async/await` with `try/catch`             |

---

# React Native Interview Tip

You'll often encounter code like:

```javascript
const fetchProfile = async () => {
    try {
        const response = await fetch(PROFILE_URL);

        if (!response.ok) {
            throw new Error("Profile request failed");
        }

        const profile = await response.json();

        setProfile(profile);
    } catch (error) {
        console.log(error.message);
    }
};
```

You should be able to explain **every line** of this function.

---



