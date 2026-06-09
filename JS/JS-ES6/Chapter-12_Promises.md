# Day 12 — Promises

Now we reach one of the most important JavaScript topics for React Native.

After Day 11, you learned:

```text
Callbacks
Event Loop
Callback Hell
```

Today's lesson explains:

> How Promises solve Callback Hell and make asynchronous code manageable.

---

# Why Promises Were Introduced?

Recall Callback Hell:

```javascript
getUser(user => {

   getPosts(user.id, posts => {

      getComments(posts[0].id, comments => {

         console.log(comments);

      });

   });

});
```

Problems:

❌ Deep nesting

❌ Difficult debugging

❌ Error handling nightmare

❌ Hard to maintain

---

Promises provide a cleaner solution:

```javascript
getUser()
  .then(user => getPosts(user.id))
  .then(posts => getComments(posts[0].id))
  .then(comments => console.log(comments))
  .catch(error => console.log(error));
```

Much cleaner.

---

# What is a Promise?

Definition:

> A Promise is an object that represents a future result of an asynchronous operation.

Think:

```text
I promise to give you a result later.
```

Result could be:

```text
Success
```

or

```text
Failure
```

---

# Real Life Example

Ordering food:

```text
Place Order
     │
     ▼
 Promise
     │
 ┌───┴───┐
 │       │
 ▼       ▼
Success Failure
```

You don't get food immediately.

You get a promise that food will arrive later.

---

# Promise States

Every Promise has exactly one state.

```text
Pending
   │
   ▼
 ┌───────┐
 │       │
 ▼       ▼
Fulfilled Rejected
```

---

## 1. Pending

Work is still happening.

Example:

```javascript
fetch(url)
```

Request sent.

Waiting for response.

---

## 2. Fulfilled

Operation succeeded.

Example:

```javascript
User data received
```

---

## 3. Rejected

Operation failed.

Example:

```javascript
Network Error
```

---

# Creating a Promise

Syntax:

```javascript
const promise =
 new Promise((resolve,reject) => {

 });
```

---

Visual:

```text
Promise
   │
   ├── resolve()
   │
   └── reject()
```

---

# Simple Success Example

```javascript
const promise =
 new Promise((resolve,reject) => {

   resolve("Success");

 });
```

---

Consume:

```javascript
promise.then(result => {
   console.log(result);
});
```

Output:

```text
Success
```

---

# What is resolve()?

`resolve()` means:

```text
Operation completed successfully.
```

Example:

```javascript
resolve("Data Loaded");
```

The value travels to:

```javascript
.then()
```

---

Visual

```text
resolve("Data Loaded")
           │
           ▼
      then(data)
```

---

# Failure Example

```javascript
const promise =
 new Promise((resolve,reject) => {

    reject("Something Went Wrong");

 });
```

---

Consume:

```javascript
promise
 .catch(error => {
    console.log(error);
 });
```

Output:

```text
Something Went Wrong
```

---

# What is reject()?

Means:

```text
Operation failed.
```

The value travels to:

```javascript
.catch()
```

---

Visual

```text
reject(error)
      │
      ▼
 catch(error)
```

---

# Using then()

`then()` executes when promise succeeds.

Example:

```javascript
const promise =
 Promise.resolve("Hello");
```

---

```javascript
promise.then(result => {
   console.log(result);
});
```

Output:

```text
Hello
```

---

# Using catch()

Handles errors.

```javascript
Promise.reject("Network Error")
   .catch(error => {
      console.log(error);
   });
```

Output:

```text
Network Error
```

---

# Using finally()

Runs regardless of success or failure.

Example:

```javascript
Promise.resolve("Success")

   .then(data => {
      console.log(data);
   })

   .finally(() => {
      console.log("Finished");
   });
```

Output:

```text
Success
Finished
```

---

Failure case:

```javascript
Promise.reject("Error")

   .catch(error => {
      console.log(error);
   })

   .finally(() => {
      console.log("Finished");
   });
```

Output:

```text
Error
Finished
```

---

# Simulating Async Work

Let's use:

```javascript
setTimeout()
```

---

```javascript
const promise =
 new Promise((resolve,reject) => {

    setTimeout(() => {

       resolve("Data Loaded");

    },2000);

 });
```

---

```javascript
promise.then(result => {
   console.log(result);
});
```

Output after 2 seconds:

```text
Data Loaded
```

---

# Real React Native Mental Model

Suppose:

```javascript
fetchUsers()
```

takes:

```text
2 seconds
```

Instead of:

```text
Return Data
```

immediately,

it returns:

```text
Promise
```

---

Later:

```javascript
.then(users => {})
```

receives result.

---

# Promise Chaining

One of the most important concepts.

---

Example:

```javascript
Promise.resolve(10)

   .then(num => {
      return num * 2;
   })

   .then(num => {
      return num + 5;
   })

   .then(result => {
      console.log(result);
   });
```

---

Flow

```text
10
 ↓
20
 ↓
25
 ↓
console.log
```

Output:

```text
25
```

---

# Why Chaining Works

Each:

```javascript
.then()
```

returns a NEW Promise.

Visual:

```text
Promise
   │
 then
   │
 Promise
   │
 then
   │
 Promise
```

---

# Real API Flow Example

```javascript
getUser()

  .then(user => {
      return getPosts(user.id);
  })

  .then(posts => {
      return getComments(posts[0].id);
  })

  .then(comments => {
      console.log(comments);
  })

  .catch(error => {
      console.log(error);
  });
```

No callback pyramid.

---

# Error Propagation

One of the best Promise features.

Suppose:

```javascript
Promise.resolve()

   .then(() => {
      throw new Error("Boom");
   })

   .then(() => {
      console.log("Will Not Run");
   })

   .catch(error => {
      console.log(error.message);
   });
```

Output:

```text
Boom
```

Error automatically travels down chain.

---

# Promise.resolve()

Creates successful promise.

```javascript
const promise =
 Promise.resolve("Hello");
```

Equivalent to:

```javascript
new Promise(resolve => {
   resolve("Hello");
});
```

---

# Promise.reject()

Creates failed promise.

```javascript
Promise.reject("Error");
```

Equivalent to:

```javascript
new Promise((resolve,reject) => {
   reject("Error");
});
```

---

# Real React Native Example

API Call:

```javascript
fetch(url)

 .then(response => {
     return response.json();
 })

 .then(users => {
     console.log(users);
 })

 .catch(error => {
     console.log(error);
 });
```

You will see this everywhere.

---

# Promise vs Callback

Callback:

```javascript
loadUser(user => {

});
```

---

Promise:

```javascript
loadUser()

 .then(user => {

 });
```

---

Advantages:

✅ Better readability

✅ Better error handling

✅ Chaining

✅ Avoid callback hell

---

# Promise States Visual

Example:

```javascript
const promise =
 fetch(url);
```

Initially:

```text
Pending
```

After success:

```text
Fulfilled
```

or

```text
Rejected
```

---

# Common Interview Questions

---

## Question 1

What are Promise states?

Answer:

```text
Pending
Fulfilled
Rejected
```

---

## Question 2

Purpose of resolve()?

Answer:

```text
Marks promise as successful.
```

---

## Question 3

Purpose of reject()?

Answer:

```text
Marks promise as failed.
```

---

## Question 4

Difference between then() and catch()?

```text
then() → success

catch() → error
```

---

## Question 5

Does then() return a Promise?

Answer:

```text
Yes
```

That's why chaining works.

---

## Question 6

Output?

```javascript
Promise.resolve(5)

   .then(num => num * 2)

   .then(num => console.log(num));
```

Output:

```text
10
```

---

# Common Mistakes

---

## Forgetting Return

Wrong:

```javascript
.then(user => {
   getPosts(user.id);
})
```

---

Correct:

```javascript
.then(user => {
   return getPosts(user.id);
})
```

or

```javascript
.then(user =>
   getPosts(user.id)
)
```

---

## Missing catch()

Wrong:

```javascript
fetch(url)
 .then(...)
```

No error handling.

---

Correct:

```javascript
fetch(url)
 .then(...)
 .catch(...)
```

---

# Practice Exercises

### Exercise 1

Create promise:

```javascript
resolve("Hello")
```

Print result using:

```javascript
.then()
```

---

### Exercise 2

Create promise:

```javascript
reject("Error")
```

Handle using:

```javascript
.catch()
```

---

### Exercise 3

Create promise that resolves after:

```text
2 seconds
```

using:

```javascript
setTimeout()
```

---

### Exercise 4

Chain:

```javascript
10
↓
20
↓
40
```

using multiple `.then()`.

---

### Exercise 5 (React Native Style)

Create:

```javascript
function fetchUsers()
```

that returns:

```javascript
Promise.resolve([
  "John",
  "Alex"
]);
```

Consume using:

```javascript
.then()
```

---

# Mental Model Cheat Sheet

| Concept   | Meaning         |
| --------- | --------------- |
| Promise   | Future value    |
| Pending   | In progress     |
| Fulfilled | Success         |
| Rejected  | Failure         |
| resolve() | Success         |
| reject()  | Failure         |
| then()    | Handle success  |
| catch()   | Handle error    |
| finally() | Always runs     |
| Chaining  | Multiple then() |

---

# React Native Reality

Most APIs return Promises:

```javascript
fetch()
AsyncStorage.getItem()
Firebase APIs
Geolocation APIs
Camera APIs
```

Understanding Promises is essential because modern React Native code is built on top of them.

---


