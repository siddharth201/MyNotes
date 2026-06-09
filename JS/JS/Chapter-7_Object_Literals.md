# Day 7 — Object Literals (Enhanced Object Literals)

By now you've learned:

* `let`, `const`
* Template Strings
* Arrow Functions
* Array Methods
* Destructuring
* Spread & Rest

Today we'll learn **Object Literals**, which are heavily used in:

* API requests
* API responses
* React Native state
* Navigation params
* Redux actions
* Configuration objects
* Firebase payloads

---

# What is an Object?

An object stores data as **key-value pairs**.

Example:

```javascript
const user = {
    name: "Siddharth",
    age: 30,
    city: "Bangalore"
};
```

Visual:

```text
user
 │
 ├── name → Siddharth
 ├── age → 30
 └── city → Bangalore
```

---

# Accessing Properties

## Dot Notation

```javascript
console.log(user.name);
```

Output:

```text
Siddharth
```

---

## Bracket Notation

```javascript
console.log(user["name"]);
```

Output:

```text
Siddharth
```

Both work.

---

# Why Enhanced Object Literals?

Before ES6:

```javascript
const name = "Siddharth";
const age = 30;

const user = {
    name: name,
    age: age
};
```

Notice duplication:

```javascript
name: name
age: age
```

ES6 solved this.

---

# 1. Property Shorthand

---

## Traditional

```javascript
const name = "Siddharth";
const age = 30;

const user = {
    name: name,
    age: age
};
```

---

## ES6 Shorthand

```javascript
const name = "Siddharth";
const age = 30;

const user = {
    name,
    age
};
```

JavaScript automatically converts to:

```javascript
{
  name: "Siddharth",
  age: 30
}
```

---

# Visual

```javascript
const name = "Siddharth";
```

becomes

```javascript
{
   name
}
```

which internally becomes

```javascript
{
   name: "Siddharth"
}
```

---

# React Native Example

Suppose:

```javascript
const email = "test@gmail.com";
const phone = "9999999999";
```

---

Without shorthand:

```javascript
const payload = {
   email: email,
   phone: phone
};
```

---

With shorthand:

```javascript
const payload = {
   email,
   phone
};
```

Much cleaner.

---

# API Request Example

Very common.

```javascript
const name = "Siddharth";
const age = 30;
```

---

```javascript
const requestBody = {
    name,
    age
};
```

---

Send:

```javascript
fetch(url, {
   method: "POST",
   body: JSON.stringify(requestBody)
});
```

---

# 2. Method Shorthand

Before ES6:

```javascript
const user = {
    greet: function() {
        console.log("Hello");
    }
};
```

---

ES6:

```javascript
const user = {
    greet() {
        console.log("Hello");
    }
};
```

Output:

```javascript
user.greet();
```

```text
Hello
```

---

# Visual

Old:

```javascript
greet: function() {}
```

New:

```javascript
greet() {}
```

---

# Multiple Methods

```javascript
const calculator = {

    add(a,b) {
        return a+b;
    },

    subtract(a,b) {
        return a-b;
    }
};
```

---

```javascript
console.log(
 calculator.add(10,20)
);
```

Output:

```text
30
```

---

# Real React Native Example

Imagine service object.

```javascript
const APIService = {

    getUsers() {
        console.log("Fetching users");
    },

    getPosts() {
        console.log("Fetching posts");
    }
};
```

---

# 3. Computed Property Names

One of the most important advanced features.

---

Normally:

```javascript
const user = {
   name: "John"
};
```

Key is fixed.

---

Sometimes key is dynamic.

Suppose:

```javascript
const field = "email";
```

Need:

```javascript
{
  email: "abc@test.com"
}
```

---

Solution:

```javascript
const field = "email";

const user = {
    [field]: "abc@test.com"
};

console.log(user);
```

Output:

```javascript
{
   email: "abc@test.com"
}
```

---

# Visual

Without brackets:

```javascript
{
 field: value
}
```

Produces:

```javascript
{
 field: value
}
```

Literally field.

---

With brackets:

```javascript
{
 [field]: value
}
```

Produces:

```javascript
{
 email: value
}
```

because field contains email.

---

# React Native Form Example

Suppose:

```javascript
const fieldName = "username";
const value = "Siddharth";
```

---

```javascript
const formData = {
   [fieldName]: value
};
```

Output:

```javascript
{
 username: "Siddharth"
}
```

Very common in forms.

---

# Dynamic State Update

Suppose:

```javascript
const field = "email";
```

---

```javascript
setUser({
   ...user,
   [field]: "new@test.com"
});
```

Output:

```javascript
{
 email: "new@test.com"
}
```

This pattern appears frequently in forms.

---

# Combining Spread + Computed Properties

React Native favorite.

Suppose:

```javascript
const field = "phone";
```

---

```javascript
const updatedUser = {
   ...user,
   [field]: "9999999999"
};
```

Meaning:

```text
Copy everything

Update phone
```

---

# Nested Objects

Example:

```javascript
const user = {
    name: "Siddharth",

    address: {
        city: "Bangalore",
        state: "Karnataka"
    }
};
```

Access:

```javascript
console.log(
 user.address.city
);
```

Output:

```text
Bangalore
```

---

# Nested Update

Suppose:

```javascript
city = "Delhi"
```

---

Wrong:

```javascript
user.address.city = "Delhi";
```

Mutates object.

---

Correct:

```javascript
const updatedUser = {

   ...user,

   address: {
      ...user.address,
      city: "Delhi"
   }
};
```

Output:

```javascript
{
  name:"Siddharth",

  address:{
     city:"Delhi",
     state:"Karnataka"
  }
}
```

Very important for React state.

---

# Object.entries()

Converts object into array.

```javascript
const user = {
  name:"John",
  age:25
};
```

---

```javascript
console.log(
 Object.entries(user)
);
```

Output:

```javascript
[
 ["name","John"],
 ["age",25]
]
```

---

# Object.keys()

Returns keys.

```javascript
Object.keys(user);
```

Output:

```javascript
[
 "name",
 "age"
]
```

---

# Object.values()

Returns values.

```javascript
Object.values(user);
```

Output:

```javascript
[
 "John",
 25
]
```

---

# React Native Example

API Response:

```javascript
const response = {
   id:1,
   name:"John",
   email:"john@test.com"
};
```

---

Create payload:

```javascript
const payload = {
    ...response,
    isActive: true
};
```

Result:

```javascript
{
   id:1,
   name:"John",
   email:"john@test.com",
   isActive:true
}
```

---

# Interview Questions

---

## Question 1

Output?

```javascript
const name = "John";

const user = {
   name
};

console.log(user);
```

Output:

```javascript
{
  name:"John"
}
```

---

## Question 2

Output?

```javascript
const key = "email";

const obj = {
   [key]: "abc@test.com"
};

console.log(obj);
```

Output:

```javascript
{
  email:"abc@test.com"
}
```

---

## Question 3

Output?

```javascript
const user = {

  greet() {
     return "Hello";
  }

};

console.log(
 user.greet()
);
```

Output:

```text
Hello
```

---

## Question 4

Output?

```javascript
const key = "age";

const user = {
   [key]: 30
};

console.log(user.age);
```

Output:

```text
30
```

---

# Common Mistakes

---

### Forgetting Brackets

Wrong:

```javascript
const key = "email";

const obj = {
   key: "abc@test.com"
};
```

Output:

```javascript
{
 key:"abc@test.com"
}
```

Not email.

---

Correct:

```javascript
{
 [key]: "abc@test.com"
}
```

Output:

```javascript
{
 email:"abc@test.com"
}
```

---

# Practice Exercises

### Exercise 1

Create:

```javascript
const firstName = "Siddharth";
const age = 30;
```

Build:

```javascript
const user = {
   firstName,
   age
};
```

using shorthand.

---

### Exercise 2

Create calculator object:

```javascript
calculator.add()
calculator.subtract()
```

using method shorthand.

---

### Exercise 3

```javascript
const key = "city";
```

Create:

```javascript
{
 city: "Bangalore"
}
```

using computed property.

---

### Exercise 4

Update:

```javascript
{
 name:"John",
 age:25
}
```

to

```javascript
{
 name:"John",
 age:30
}
```

using spread.

---

### Exercise 5 (React Native Style)

```javascript
const field = "email";
const value = "test@gmail.com";
```

Create:

```javascript
{
 email:"test@gmail.com"
}
```

using computed properties.

---

# Mental Model Cheat Sheet

| Feature            | Syntax             |
| ------------------ | ------------------ |
| Property Shorthand | `{name}`           |
| Method Shorthand   | `greet(){}`        |
| Computed Property  | `{[key]:value}`    |
| Copy Object        | `{...obj}`         |
| Update Property    | `{...obj, age:30}` |
| Dynamic Property   | `{[field]:value}`  |

---

# React Native Reality

You will constantly write:

```javascript
const payload = {
   email,
   password
};

const updatedUser = {
   ...user,
   age:30
};

const formData = {
   [fieldName]: value
};
```

These patterns appear in:

* Login screens
* Signup forms
* API requests
* Redux reducers
* State updates
* Firebase writes

---


