# Day 8 — Modules (`import` / `export`)

This is the topic that transforms JavaScript from writing everything in one file to building real-world applications.

Every React Native project uses modules heavily.

Without modules:

```javascript
// App.js

function login() {}
function logout() {}
function fetchUsers() {}
function fetchPosts() {}
function fetchComments() {}
function calculatePrice() {}
function validateEmail() {}
```

Imagine a project with 100 screens.

One file becomes impossible to manage.

Modules solve this.

---

# What is a Module?

A module is simply:

> A JavaScript file that can share code with other files.

Example:

```text
src/
 ├── App.js
 ├── UserService.js
 └── Utils.js
```

---

# Why Modules?

Benefits:

✅ Reusable code

✅ Better organization

✅ Easier maintenance

✅ Team collaboration

✅ Separation of concerns

---

# Exporting Code

To use something in another file:

```text
File A
   ↓ export

File B
   ↓ import
```

---

# Named Exports

## math.js

```javascript
export const add = (a, b) => a + b;

export const subtract = (a, b) => a - b;
```

---

## App.js

```javascript
import { add, subtract } from "./math";

console.log(add(10, 20));
console.log(subtract(20, 5));
```

Output:

```text
30
15
```

---

# Visual

```text
math.js
 ├── add
 └── subtract

      ↓

App.js
 import { add, subtract }
```

---

# Multiple Named Exports

```javascript
// UserService.js

export const getUsers = () => {};

export const getUserById = () => {};

export const deleteUser = () => {};
```

Import only what you need:

```javascript
import { getUsers } from "./UserService";
```

---

# Import Aliasing

Suppose:

```javascript
export const add = (a,b) => a+b;
```

Import with different name:

```javascript
import { add as sum } from "./math";

console.log(sum(10,20));
```

Output:

```text
30
```

---

# Import Everything

```javascript
import * as MathUtils from "./math";
```

Usage:

```javascript
MathUtils.add(10,20);

MathUtils.subtract(20,10);
```

---

# Default Export

Very important.

A file can have:

```text
One default export
```

---

## UserService.js

```javascript
const getUsers = () => {
   console.log("Users");
};

export default getUsers;
```

---

## App.js

```javascript
import getUsers from "./UserService";

getUsers();
```

Output:

```text
Users
```

---

# Why No Curly Braces?

Named Export:

```javascript
export const add = () => {};
```

Import:

```javascript
import { add } from "./math";
```

Curly braces required.

---

Default Export:

```javascript
export default add;
```

Import:

```javascript
import add from "./math";
```

No curly braces.

---

# Most Common Interview Question

Difference between:

```javascript
export const add = () => {};
```

and

```javascript
export default add;
```

---

### Named Export

```javascript
export const add = () => {};
```

Import:

```javascript
import { add } from "./math";
```

Must use exact name.

---

### Default Export

```javascript
export default add;
```

Import:

```javascript
import anything from "./math";
```

Can rename freely.

Example:

```javascript
import sum from "./math";
```

Works.

---

# React Native Example

---

## UserScreen.js

```javascript
const UserScreen = () => {
    return null;
};

export default UserScreen;
```

---

## App.js

```javascript
import UserScreen from "./UserScreen";
```

This is how almost every screen is exported.

---

# Named + Default Together

Allowed.

```javascript
const UserService = {};

export default UserService;

export const API_URL =
  "https://api.com";

export const TIMEOUT =
  5000;
```

---

Import:

```javascript
import UserService,
{
   API_URL,
   TIMEOUT
}
from "./UserService";
```

---

# Folder Imports

Project:

```text
src/
 ├── services/
 │     └── UserService.js
 └── App.js
```

Import:

```javascript
import UserService
from "./services/UserService";
```

---

# Relative Paths

Current file:

```text
src/App.js
```

---

Same folder:

```javascript
import UserService
from "./UserService";
```

`./`

means:

```text
current directory
```

---

One folder up:

```javascript
import UserService
from "../UserService";
```

`../`

means:

```text
parent directory
```

---

Visual

```text
src/
 ├── App.js
 └── screens/
      └── UserScreen.js
```

Inside UserScreen:

```javascript
import App from "../App";
```

---

# Real React Native Folder Structure

```text
src/

 ├── screens/
 │     ├── HomeScreen.js
 │     ├── ProfileScreen.js
 │
 ├── services/
 │     ├── APIService.js
 │
 ├── components/
 │     ├── UserCard.js
 │
 ├── utils/
 │     ├── constants.js
 │
 └── navigation/
       ├── AppNavigator.js
```

Modules connect everything.

---

# Barrel Files (index.js)

Very common in production.

---

Without Barrel File

```javascript
import HomeScreen
from "./screens/HomeScreen";

import ProfileScreen
from "./screens/ProfileScreen";
```

---

Create:

```text
screens/
 ├── HomeScreen.js
 ├── ProfileScreen.js
 └── index.js
```

---

## index.js

```javascript
export { default as HomeScreen }
from "./HomeScreen";

export { default as ProfileScreen }
from "./ProfileScreen";
```

---

Now:

```javascript
import {
 HomeScreen,
 ProfileScreen
}
from "./screens";
```

Cleaner.

---

# Exporting Classes

```javascript
class UserService {

   getUsers() {
      return [];
   }

}

export default UserService;
```

---

Import:

```javascript
import UserService
from "./UserService";

const service =
 new UserService();
```

---

# Exporting Constants

```javascript
export const API_URL =
 "https://api.com";

export const TIMEOUT =
 5000;
```

---

Import:

```javascript
import {
 API_URL,
 TIMEOUT
}
from "./constants";
```

---

# React Native Example

---

## constants.js

```javascript
export const COLORS = {
   primary: "#2196F3",
   secondary: "#FF9800"
};
```

---

## HomeScreen.js

```javascript
import { COLORS }
from "../constants";

console.log(
 COLORS.primary
);
```

Output:

```text
#2196F3
```

---

# React Native Service Example

---

## APIService.js

```javascript
const getUsers =
 async () => {

   const response =
      await fetch(url);

   return response.json();
 };

export default getUsers;
```

---

## UserScreen.js

```javascript
import getUsers
from "../services/APIService";

const loadUsers =
 async () => {

   const users =
      await getUsers();

 };
```

This pattern is extremely common.

---

# Common Mistakes

---

## Forgetting Curly Braces

Named Export:

```javascript
export const add = () => {};
```

Wrong:

```javascript
import add from "./math";
```

❌ Error

---

Correct:

```javascript
import { add }
from "./math";
```

---

## Using Curly Braces with Default Export

Default Export:

```javascript
export default add;
```

Wrong:

```javascript
import { add }
from "./math";
```

❌ Error

---

Correct:

```javascript
import add
from "./math";
```

---

# Interview Questions

---

## Question 1

Named Export

```javascript
export const name =
 "John";
```

Import?

Answer:

```javascript
import { name }
from "./file";
```

---

## Question 2

Default Export

```javascript
export default UserScreen;
```

Import?

Answer:

```javascript
import UserScreen
from "./UserScreen";
```

---

## Question 3

How many default exports can one file have?

Answer:

```text
Only One
```

---

## Question 4

Can a file have multiple named exports?

Answer:

```text
Yes
```

Unlimited.

---

# Practice Exercises

### Exercise 1

Create:

```javascript
export const multiply =
 (a,b) => a*b;
```

Import and use it.

---

### Exercise 2

Create:

```javascript
export default function greet() {
   return "Hello";
}
```

Import and call it.

---

### Exercise 3

Create constants:

```javascript
API_URL

TIMEOUT
```

using named exports.

---

### Exercise 4

Create:

```javascript
UserScreen.js
```

Export component as default.

Import it into App.js.

---

# Mental Model Cheat Sheet

| Export Type      | Syntax               | Import           |
| ---------------- | -------------------- | ---------------- |
| Named            | `export const add`   | `import { add }` |
| Default          | `export default add` | `import add`     |
| Multiple Named   | Allowed              | Allowed          |
| Multiple Default | ❌ Not Allowed        | ❌                |
| Rename Named     | `add as sum`         | Supported        |
| Import All       | `* as Utils`         | Supported        |

---

# React Native Reality

You'll constantly see:

```javascript
import React from "react";

import HomeScreen
from "./screens/HomeScreen";

import {
 API_URL,
 COLORS
}
from "./constants";

import UserService
from "./services/UserService";
```

Understanding modules is essential because every React Native project is split across dozens or hundreds of files.

---


