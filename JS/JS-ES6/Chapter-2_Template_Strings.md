# Day 2 — Template Strings (Template Literals)

Template Strings are one of the most frequently used JavaScript features in React Native.

You will use them for:

* Displaying UI text
* Building API URLs
* Logging
* Dynamic styling
* Error messages
* Navigation routes

---

# What Problem Did Template Strings Solve?

Before ES6, strings were concatenated using `+`.

```javascript
const firstName = "Siddharth";
const lastName = "Tiwari";

const fullName = firstName + " " + lastName;

console.log(fullName);
```

Output:

```text
Siddharth Tiwari
```

Imagine:

```javascript
const name = "Siddharth";
const age = 30;
const city = "Bangalore";

const message =
  "My name is " +
  name +
  ", I am " +
  age +
  " years old and I live in " +
  city;
```

This quickly becomes ugly.

---

# Template String Syntax

Use backticks:

```javascript
`
`
```

NOT single quotes:

```javascript
''
```

NOT double quotes:

```javascript
""
```

---

## Basic Example

```javascript
const name = "Siddharth";

const message = `Hello ${name}`;

console.log(message);
```

Output:

```text
Hello Siddharth
```

---

# What is `${}` ?

`${}` allows JavaScript expressions inside strings.

Syntax:

```javascript
`${expression}`
```

Example:

```javascript
const age = 30;

console.log(`Age: ${age}`);
```

Output:

```text
Age: 30
```

---

# Multiple Variables

```javascript
const firstName = "Siddharth";
const lastName = "Tiwari";

console.log(
  `${firstName} ${lastName}`
);
```

Output:

```text
Siddharth Tiwari
```

---

# Expressions Inside Template Strings

Anything that returns a value can be placed inside `${}`.

---

## Arithmetic

```javascript
const a = 10;
const b = 20;

console.log(`Sum = ${a + b}`);
```

Output:

```text
Sum = 30
```

---

## Boolean Expressions

```javascript
const age = 20;

console.log(
  `Can Vote: ${age >= 18}`
);
```

Output:

```text
Can Vote: true
```

---

## Ternary Operators

```javascript
const age = 16;

console.log(
  `${age >= 18 ? "Adult" : "Minor"}`
);
```

Output:

```text
Minor
```

---

## Function Calls

```javascript
function greet(name) {
  return `Hello ${name}`;
}

console.log(`${greet("Siddharth")}`);
```

Output:

```text
Hello Siddharth
```

---

# Multiline Strings

One of the biggest advantages.

Before ES6:

```javascript
const message =
  "Hello\n" +
  "Welcome\n" +
  "To React Native";
```

Now:

```javascript
const message = `
Hello
Welcome
To React Native
`;

console.log(message);
```

Output:

```text
Hello
Welcome
To React Native
```

---

# Real React Native Example

Suppose API gives:

```javascript
const user = {
  name: "Siddharth",
  age: 30
};
```

UI:

```javascript
<Text>
  {`Name: ${user.name}`}
</Text>
```

Result:

```text
Name: Siddharth
```

---

# Building API URLs

Very common.

Without Template Strings:

```javascript
const userId = 10;

const url =
  "https://api.com/users/" +
  userId;
```

With Template Strings:

```javascript
const userId = 10;

const url =
  `https://api.com/users/${userId}`;
```

Output:

```text
https://api.com/users/10
```

---

# Multiple Dynamic Values

```javascript
const page = 1;
const limit = 20;

const url =
`https://api.com/users?page=${page}&limit=${limit}`;
```

Output:

```text
https://api.com/users?page=1&limit=20
```

You'll do this frequently in React Native API integration.

---

# Working with Objects

```javascript
const user = {
  name: "Siddharth",
  city: "Bangalore"
};

console.log(
  `${user.name} lives in ${user.city}`
);
```

Output:

```text
Siddharth lives in Bangalore
```

---

# Working with Arrays

```javascript
const fruits = [
  "Apple",
  "Banana",
  "Orange"
];

console.log(
  `First Fruit: ${fruits[0]}`
);
```

Output:

```text
First Fruit: Apple
```

---

# Nested Expressions

```javascript
const user = {
  firstName: "Siddharth",
  lastName: "Tiwari"
};

console.log(
`${user.firstName.toUpperCase()} ${user.lastName.toUpperCase()}`
);
```

Output:

```text
SIDDHARTH TIWARI
```

---

# Template Strings in Logging

Traditional:

```javascript
console.log(
  "User ID is " + userId
);
```

Modern:

```javascript
console.log(
  `User ID is ${userId}`
);
```

Much cleaner.

---

# React Native Examples

---

## Example 1: Greeting User

```javascript
const user = "Siddharth";

<Text>
  {`Welcome ${user}`}
</Text>
```

Output:

```text
Welcome Siddharth
```

---

## Example 2: Error Message

```javascript
const minLength = 8;

const message =
  `Password must be at least ${minLength} characters`;
```

Output:

```text
Password must be at least 8 characters
```

---

## Example 3: Dynamic Header

```javascript
navigation.setOptions({
  title: `Profile - ${user.name}`
});
```

Output:

```text
Profile - Siddharth
```

---

# Template Strings + Map()

Very common in React.

```javascript
const users = [
  "John",
  "Alex",
  "Bob"
];

users.map(user =>
  console.log(`Hello ${user}`)
);
```

Output:

```text
Hello John
Hello Alex
Hello Bob
```

---

# Interview Question

## What is the difference between

```javascript
"Hello ${name}"
```

and

```javascript
`Hello ${name}`
```

?

Answer:

First one uses quotes.

```javascript
"Hello ${name}"
```

Output:

```text
Hello ${name}
```

No interpolation occurs.

Second uses backticks.

```javascript
`Hello ${name}`
```

Output:

```text
Hello Siddharth
```

Interpolation happens.

---

# Interview Question

Output?

```javascript
const a = 10;
const b = 20;

console.log(`${a + b}`);
```

Output:

```text
30
```

---

# Interview Question

Output?

```javascript
const name = "John";

console.log("Hello ${name}");
```

Output:

```text
Hello ${name}
```

Because double quotes are used.

---

# Tagged Template Literals (Advanced)

Rarely used in React Native but good to know.

Example:

```javascript
function tag(strings, value) {
  console.log(strings);
  console.log(value);
}

const name = "Siddharth";

tag`Hello ${name}`;
```

Output:

```javascript
["Hello ", ""]
"Siddharth"
```

Mostly used in:

* Styled Components
* Advanced libraries

Example:

```javascript
const Button = styled.View`
  background-color: blue;
  padding: 10px;
`;
```

We'll revisit this if you learn Styled Components.

---

# Common Mistakes

## Using quotes instead of backticks

Wrong:

```javascript
const name = "John";

console.log("Hello ${name}");
```

Output:

```text
Hello ${name}
```

---

Correct:

```javascript
console.log(`Hello ${name}`);
```

Output:

```text
Hello John
```

---

# Practice Exercises

## Exercise 1

Create:

```javascript
const name = "Siddharth";
const age = 30;
```

Print:

```text
My name is Siddharth and I am 30 years old.
```

---

## Exercise 2

Create:

```javascript
const price = 1000;
const discount = 100;
```

Print:

```text
Final Price = 900
```

using a template string.

---

## Exercise 3

Build URL:

```text
https://api.com/users/101
```

using:

```javascript
const userId = 101;
```

---

## Exercise 4

Given:

```javascript
const user = {
  name: "Siddharth",
  city: "Bangalore"
};
```

Print:

```text
Siddharth lives in Bangalore
```

---

# React Native Usage Frequency

| Feature                | Usage |
| ---------------------- | ----- |
| Variable interpolation | ⭐⭐⭐⭐⭐ |
| API URLs               | ⭐⭐⭐⭐⭐ |
| Error messages         | ⭐⭐⭐⭐⭐ |
| Logging                | ⭐⭐⭐⭐  |
| Navigation titles      | ⭐⭐⭐⭐  |
| Tagged templates       | ⭐     |

---

# Mental Model

Think of a template string as:

```javascript
`Some text ${JavaScript Expression} Some text`
```

JavaScript evaluates whatever is inside `${}` and inserts the result into the string.

Example:

```javascript
`2 + 3 = ${2 + 3}`
```

Result:

```text
2 + 3 = 5
```

---

## Mini Assignment (React Native Style)

Create a user object:

```javascript
const user = {
  id: 101,
  name: "Siddharth",
  city: "Bangalore"
};
```

Generate:

```text
Welcome Siddharth

Profile URL:
https://api.myapp.com/users/101

Location:
Bangalore
```

using only template strings.

---


