# Day 11 — Asynchronous JavaScript (Callbacks, Event Loop, Callback Hell)

This is arguably the **most important JavaScript topic** for React Native interviews.

If you don't understand this topic, then:

* Promises won't make sense.
* Async/Await won't make sense.
* API calls won't make sense.
* React Native data loading won't make sense.

So let's build the foundation carefully.

---

# What is Synchronous Programming?

Synchronous means:

> One task executes completely before the next task starts.

Example:

```javascript
console.log("Step 1");

console.log("Step 2");

console.log("Step 3");
```

Output:

```text
Step 1
Step 2
Step 3
```

Execution Flow:

```text
Step 1
  ↓
Step 2
  ↓
Step 3
```

JavaScript executes line by line.

---

# The Problem

Imagine downloading data from server.

```javascript
const users = fetchUsers();
```

Server takes:

```text
5 seconds
```

If JavaScript waits:

```text
App freezes for 5 seconds
```

Bad user experience.

---

# Solution: Asynchronous Programming

Instead of waiting:

```text
Start Task
 ↓
Continue Other Work
 ↓
Come Back Later
```

---

Example:

```javascript
console.log("Start");

setTimeout(() => {
   console.log("Timer Finished");
}, 3000);

console.log("End");
```

Output:

```text
Start
End
Timer Finished
```

Notice:

```text
End
```

prints before:

```text
Timer Finished
```

Why?

Because `setTimeout` is asynchronous.

---

# Understanding Callbacks

A callback is simply:

> A function passed as an argument to another function.

---

Example

```javascript
function greet(name) {
   console.log(`Hello ${name}`);
}

function processUser(callback) {
   callback("Siddharth");
}

processUser(greet);
```

Output:

```text
Hello Siddharth
```

---

Visual

```text
processUser()
      │
      ▼
callback()
      │
      ▼
greet()
```

---

# Callback with Arrow Function

More common.

```javascript
function processUser(callback) {
   callback("Siddharth");
}

processUser(name => {
   console.log(`Hello ${name}`);
});
```

Output:

```text
Hello Siddharth
```

---

# Why Callbacks Matter

Most asynchronous APIs use callbacks.

Example:

```javascript
setTimeout(() => {
   console.log("Executed Later");
}, 2000);
```

The callback:

```javascript
() => {
   console.log("Executed Later");
}
```

runs later.

---

# JavaScript is Single Threaded

Very important interview concept.

JavaScript has:

```text
One Call Stack
```

Meaning:

```text
One thing at a time
```

It cannot execute:

```text
Task A
Task B
```

simultaneously on the main thread.

---

# Then How Does Async Work?

Through:

```text
Call Stack
Web APIs
Callback Queue
Event Loop
```

---

# JavaScript Runtime Architecture

```text
 ┌─────────────┐
 │ Call Stack  │
 └──────┬──────┘
        │

 ┌──────▼──────┐
 │  Web APIs   │
 └──────┬──────┘
        │

 ┌──────▼──────┐
 │CallbackQueue│
 └──────┬──────┘
        │

 ┌──────▼──────┐
 │ Event Loop  │
 └─────────────┘
```

Memorize this diagram.

---

# Call Stack

Think:

```text
Execution Area
```

Example:

```javascript
function first() {
   second();
}

function second() {
   console.log("Hello");
}

first();
```

Stack:

```text
first()
   ↓
second()
   ↓
console.log()
```

Then unwind:

```text
console.log removed

second removed

first removed
```

---

# setTimeout Example

```javascript
console.log("A");

setTimeout(() => {
   console.log("B");
}, 2000);

console.log("C");
```

What happens?

---

Step 1

```javascript
console.log("A");
```

Output:

```text
A
```

---

Step 2

```javascript
setTimeout(...)
```

Timer moves to:

```text
Web APIs
```

JavaScript does NOT wait.

---

Step 3

```javascript
console.log("C");
```

Output:

```text
C
```

---

After 2 seconds:

Callback moves to:

```text
Callback Queue
```

---

Event Loop checks:

```text
Call Stack Empty?
```

YES

Move callback into stack.

Execute:

```javascript
console.log("B");
```

Output:

```text
B
```

---

Final Output

```text
A
C
B
```

---

# Event Loop

Most famous JavaScript interview topic.

Definition:

> Event Loop continuously checks if Call Stack is empty and moves callbacks from queue to stack.

Visual:

```text
Queue
  │
  ▼
Event Loop
  │
  ▼
Call Stack
```

---

# Example

```javascript
console.log("1");

setTimeout(() => {
   console.log("2");
}, 0);

console.log("3");
```

Output?

Many beginners answer:

```text
1
2
3
```

Wrong.

Actual:

```text
1
3
2
```

---

Why?

Because:

```javascript
setTimeout(...,0)
```

does NOT mean:

```text
Execute immediately
```

It means:

```text
Put callback in queue ASAP
```

The stack must become empty first.

---

# Callback Hell

Now let's see why Promises were invented.

---

Imagine:

```javascript
getUser(() => {

});
```

After user loads:

```javascript
getPosts(() => {

});
```

After posts load:

```javascript
getComments(() => {

});
```

---

Code:

```javascript
getUser(user => {

   getPosts(user.id, posts => {

      getComments(posts[0].id, comments => {

         console.log(comments);

      });

   });

});
```

---

Visual

```text
getUser
   │
   └── getPosts
          │
          └── getComments
                 │
                 └── console.log
```

Looks like:

```text
Pyramid of Doom
```

---

Problems

### Hard to Read

```javascript
getUser(() => {
  getPosts(() => {
     getComments(() => {
        getLikes(() => {
            ...
        });
     });
  });
});
```

---

### Hard to Maintain

Changing logic becomes painful.

---

### Hard Error Handling

```javascript
if(error){

}
```

at every level.

---

# Real React Native Example

Suppose:

```text
Load User
 ↓
Load User Posts
 ↓
Load Comments
 ↓
Load Likes
```

Using callbacks:

```javascript
getUser(user => {

   getPosts(user.id, posts => {

      getComments(posts[0].id, comments => {

         getLikes(comments[0].id, likes => {

             console.log(likes);

         });

      });

   });

});
```

Nightmare.

---

# Why Promises Were Introduced

Promises flatten callback hell.

Instead of:

```javascript
getUser(() => {

});
```

We can write:

```javascript
getUser()
   .then(user => getPosts(user.id))
   .then(posts => getComments(posts[0].id))
   .then(comments => console.log(comments))
   .catch(error => console.log(error));
```

Much cleaner.

We'll learn this tomorrow.

---

# Common Async APIs

---

## setTimeout

```javascript
setTimeout(() => {
   console.log("Hello");
},1000);
```

---

## setInterval

```javascript
setInterval(() => {
   console.log("Tick");
},1000);
```

Runs repeatedly.

---

## Event Listeners

```javascript
button.addEventListener(
  "click",
  () => {}
);
```

Callback executes later.

---

## API Requests

```javascript
fetch(url)
```

Asynchronous.

---

# Interview Questions

---

## Question 1

Is JavaScript synchronous or asynchronous?

Answer:

```text
JavaScript is single-threaded and synchronous by default,
but supports asynchronous operations through Web APIs.
```

---

## Question 2

Output?

```javascript
console.log("A");

setTimeout(() => {
   console.log("B");
},0);

console.log("C");
```

Output:

```text
A
C
B
```

---

## Question 3

What is callback?

Answer:

```text
Function passed as argument
to another function.
```

---

## Question 4

What is Event Loop?

Answer:

```text
Mechanism that moves callbacks
from queue to call stack when stack is empty.
```

---

## Question 5

What is Callback Hell?

Answer:

```text
Deeply nested callbacks
that become difficult to read,
maintain and debug.
```

---

# Practice Exercises

### Exercise 1

Predict output:

```javascript
console.log("1");

setTimeout(() => {
   console.log("2");
},1000);

console.log("3");
```

---

### Exercise 2

Create function:

```javascript
execute(callback)
```

and call callback.

---

### Exercise 3

Use:

```javascript
setTimeout()
```

to print:

```text
Hello after 2 seconds
```

---

### Exercise 4

Draw flow for:

```javascript
console.log("A");

setTimeout(() => {
   console.log("B");
},0);

console.log("C");
```

using:

```text
Stack
Queue
Event Loop
```

---

# Mental Model Cheat Sheet

| Concept        | Meaning                             |
| -------------- | ----------------------------------- |
| Synchronous    | One task at a time                  |
| Asynchronous   | Start now, finish later             |
| Callback       | Function passed to another function |
| Call Stack     | Executes JS code                    |
| Web APIs       | Browser/Runtime features            |
| Callback Queue | Waiting callbacks                   |
| Event Loop     | Moves queue → stack                 |
| Callback Hell  | Nested callbacks                    |

---

# React Native Reality

Almost everything in React Native is asynchronous:

```javascript
fetch()
AsyncStorage
Firebase
Push Notifications
Location Services
Camera Access
File Downloads
```

Understanding today's lesson is mandatory before learning:

1. Promises
2. Promise Chaining
3. Promise.all
4. Async/Await

---


