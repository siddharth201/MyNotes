# Day 13 — Promise Chaining & Promise Combinators

Yesterday you learned:

```javascript
Promise
then()
catch()
finally()
```

Today we'll learn how Promises work together.

This is extremely important for:

* React Native API calls
* Dashboard screens
* Loading multiple resources
* Parallel requests
* Interview questions

---

# Part 1 — Promise Chaining

---

# What is Promise Chaining?

Promise chaining means:

> Using multiple `.then()` calls where the output of one becomes the input of the next.

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

Output:

```text
25
```

---

# Visual Flow

```text
10
 ↓

20
 ↓

25
 ↓

console.log
```

---

# Why Does This Work?

Because every:

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

# Example 2

```javascript
Promise.resolve("Siddharth")

   .then(name => {
      return `Hello ${name}`;
   })

   .then(message => {
      console.log(message);
   });
```

Output:

```text
Hello Siddharth
```

---

# Returning Another Promise

Very important.

Suppose:

```javascript
function getUser() {

   return Promise.resolve({
      id: 1,
      name: "John"
   });

}
```

---

Now:

```javascript
getUser()

 .then(user => {

    return Promise.resolve(
       user.name
    );

 })

 .then(name => {
    console.log(name);
 });
```

Output:

```text
John
```

---

# Automatic Promise Flattening

Suppose:

```javascript
.then(() => {
   return Promise.resolve(10);
})
```

JavaScript automatically unwraps it.

You receive:

```javascript
10
```

not:

```javascript
Promise { 10 }
```

This is called:

```text
Promise Flattening
```

---

# Error Propagation

One of the best Promise features.

---

Example:

```javascript
Promise.resolve()

 .then(() => {
    throw new Error("Boom");
 })

 .then(() => {
    console.log("Won't Run");
 })

 .catch(error => {
    console.log(error.message);
 });
```

Output:

```text
Boom
```

---

Visual

```text
then()
   │
 ERROR
   │
   ▼
catch()
```

Error automatically travels down.

---

# Real React Native Example

Suppose:

```text
Load User
 ↓
Load Posts
 ↓
Load Comments
```

---

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

This is Promise Chaining.

---

# Part 2 — Promise Combinators

These allow multiple promises to work together.

---

# Promise.all()

Most commonly used.

---

# What Does It Do?

Runs promises in parallel and waits for ALL to succeed.

---

Visual

```text
Promise A
Promise B
Promise C
    │
    ▼
Promise.all()
```

---

Example

```javascript
const p1 =
 Promise.resolve("User");

const p2 =
 Promise.resolve("Posts");

const p3 =
 Promise.resolve("Comments");
```

---

```javascript
Promise.all([
   p1,
   p2,
   p3
])

.then(results => {
   console.log(results);
});
```

Output:

```javascript
[
 "User",
 "Posts",
 "Comments"
]
```

---

# Visual

```text
User
Posts
Comments
      │
      ▼
[
 User,
 Posts,
 Comments
]
```

---

# Real React Native Example

Dashboard screen:

Need:

```text
User Info
Notifications
Messages
```

---

Instead of:

```javascript
await getUser();

await getNotifications();

await getMessages();
```

Sequential.

---

Use:

```javascript
Promise.all([
   getUser(),
   getNotifications(),
   getMessages()
])
```

Faster.

---

# Important Rule

If ONE promise fails:

```javascript
Promise.all()
```

fails immediately.

---

Example:

```javascript
const p1 =
 Promise.resolve("Success");

const p2 =
 Promise.reject("Error");
```

---

```javascript
Promise.all([
  p1,
  p2
])

.catch(error => {
   console.log(error);
});
```

Output:

```text
Error
```

---

# Promise.allSettled()

Introduced because of Promise.all limitation.

---

# What Does It Do?

Waits for ALL promises.

Even failed ones.

---

Example:

```javascript
const p1 =
 Promise.resolve("User");

const p2 =
 Promise.reject("Network Error");
```

---

```javascript
Promise.allSettled([
   p1,
   p2
])

.then(results => {
   console.log(results);
});
```

Output:

```javascript
[
 {
   status:"fulfilled",
   value:"User"
 },

 {
   status:"rejected",
   reason:"Network Error"
 }
]
```

---

# Visual

```text
Success
Failure
     │
     ▼
All Results
```

---

# React Native Example

Home Screen:

Need:

```text
Users
Posts
Notifications
```

Even if:

```text
Notifications Fail
```

still show:

```text
Users
Posts
```

Use:

```javascript
Promise.allSettled()
```

---

# Promise.race()

---

# What Does It Do?

Returns the FIRST promise to settle.

Could be:

```text
Success
```

or

```text
Failure
```

---

Example

```javascript
const p1 =
 new Promise(resolve => {

   setTimeout(() => {
      resolve("A");
   },2000);

 });

const p2 =
 new Promise(resolve => {

   setTimeout(() => {
      resolve("B");
   },1000);

 });
```

---

```javascript
Promise.race([
   p1,
   p2
])

.then(result => {
   console.log(result);
});
```

Output:

```text
B
```

Because B finished first.

---

# Visual

```text
A → 2 sec

B → 1 sec
      │
      ▼

Winner = B
```

---

# Real React Native Example

API Timeout

---

```javascript
Promise.race([
   fetch(url),

   timeoutPromise
]);
```

If API takes too long:

```text
Timeout Wins
```

---

# Promise.any()

Newer combinator.

---

# What Does It Do?

Returns FIRST SUCCESSFUL promise.

Ignores failures.

---

Example

```javascript
const p1 =
 Promise.reject("Error");

const p2 =
 Promise.resolve("User");

const p3 =
 Promise.resolve("Posts");
```

---

```javascript
Promise.any([
   p1,
   p2,
   p3
])

.then(result => {
   console.log(result);
});
```

Output:

```text
User
```

First successful result.

---

# Difference Between race and any

---

## race

First settled.

Success OR Failure.

---

Example:

```text
Failure arrives first
```

Output:

```text
Failure
```

---

## any

First SUCCESS only.

Ignores failures.

---

Example:

```text
Failure
Failure
Success
```

Output:

```text
Success
```

---

# Comparison Table

| Method             | Success Condition |
| ------------------ | ----------------- |
| Promise.all        | All succeed       |
| Promise.allSettled | All finish        |
| Promise.race       | First settles     |
| Promise.any        | First success     |

---

# Real React Native Dashboard Example

Need:

```text
User
Posts
Messages
```

---

Using Promise.all:

```javascript
Promise.all([
   getUser(),
   getPosts(),
   getMessages()
])

.then(
 ([user,posts,messages]) => {

 });
```

Notice destructuring:

```javascript
[user,posts,messages]
```

Very common.

---

# Sequential vs Parallel

---

## Sequential

```javascript
await getUser();

await getPosts();

await getMessages();
```

Time:

```text
2 + 2 + 2 = 6 sec
```

---

## Parallel

```javascript
Promise.all([
 getUser(),
 getPosts(),
 getMessages()
]);
```

Time:

```text
2 sec
```

Huge improvement.

---

# Interview Questions

---

## Question 1

Purpose of Promise.all?

Answer:

```text
Run multiple promises in parallel
and wait for all to succeed.
```

---

## Question 2

What happens if one promise fails in Promise.all?

Answer:

```text
Entire Promise.all fails.
```

---

## Question 3

Difference:

```javascript
Promise.all
```

vs

```javascript
Promise.allSettled
```

Answer:

```text
all → fail fast

allSettled → wait for everyone
```

---

## Question 4

Difference:

```javascript
Promise.race
```

vs

```javascript
Promise.any
```

Answer:

```text
race → first settled

any → first success
```

---

## Question 5

Output?

```javascript
Promise.all([
  Promise.resolve(1),
  Promise.resolve(2)
])

.then(console.log);
```

Output:

```javascript
[1,2]
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

---

## Sequential Instead of Parallel

Wrong:

```javascript
await getUser();

await getPosts();

await getMessages();
```

---

Better:

```javascript
await Promise.all([
   getUser(),
   getPosts(),
   getMessages()
]);
```

---

# Practice Exercises

### Exercise 1

Create:

```javascript
Promise.resolve(10)
```

Chain to produce:

```text
40
```

---

### Exercise 2

Create:

```javascript
Promise.all()
```

with three successful promises.

---

### Exercise 3

Create:

```javascript
Promise.allSettled()
```

with:

```text
2 success
1 failure
```

---

### Exercise 4

Create:

```javascript
Promise.race()
```

with timers:

```text
1 sec
2 sec
```

Predict output.

---

### Exercise 5 (React Native Style)

Simulate:

```text
getUser()
getPosts()
getNotifications()
```

Load all together using:

```javascript
Promise.all()
```

and destructure results.

---

# Mental Model Cheat Sheet

| Method             | Waits For     | Fails On              |
| ------------------ | ------------- | --------------------- |
| Promise.all        | All           | Any failure           |
| Promise.allSettled | All           | Never                 |
| Promise.race       | First settle  | First failure can win |
| Promise.any        | First success | All failures          |

---

# React Native Reality

You'll frequently use:

```javascript
Promise.all([
   fetchUser(),
   fetchSettings(),
   fetchNotifications()
]);
```

for dashboard and home screen loading.

---

# Next: Day 14 — Fetch API & AJAX

We'll learn:

* What AJAX is
* What Fetch API is
* GET requests
* POST requests
* PUT requests
* DELETE requests
* Request headers
* Request body
* JSON parsing
* Error handling
* Real React Native networking

This is where you'll start talking to real APIs and build actual apps.

