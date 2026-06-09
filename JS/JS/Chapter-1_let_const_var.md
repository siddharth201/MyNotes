

# Day 1 — let, const and var

Before ES6, JavaScript had only:

```javascript
var name = "Siddharth";
```

ES6 introduced:

```javascript
let name = "Siddharth";
const country = "India";
```

---

# Why var was problematic

## Example

```javascript
var age = 25;

var age = 30;

console.log(age);
```

Output

```javascript
30
```

Re-declaration is allowed.

This often caused bugs.

---

# Scope

Scope means:

> Where can I access a variable?

---

## Global Scope

```javascript
var name = "Siddharth";

function printName() {
    console.log(name);
}

printName();
```

Output

```javascript
Siddharth
```

---

## Function Scope

```javascript
function test() {
    var age = 25;
}

console.log(age);
```

Output

```javascript
ReferenceError
```

Because age exists only inside function.

---

# Block Scope

A block:

```javascript
{
}
```

or

```javascript
if() {

}
```

or

```javascript
for() {

}
```

---

## var is NOT block scoped

```javascript
if (true) {
    var age = 25;
}

console.log(age);
```

Output

```javascript
25
```

Still accessible.

This is dangerous.

---

## let IS block scoped

```javascript
if (true) {
    let age = 25;
}

console.log(age);
```

Output

```javascript
ReferenceError
```

---

## const IS block scoped

```javascript
if (true) {
    const age = 25;
}

console.log(age);
```

Output

```javascript
ReferenceError
```

---

# Reassignment

## let

```javascript
let count = 1;

count = 2;

console.log(count);
```

Output

```javascript
2
```

Allowed.

---

## const

```javascript
const count = 1;

count = 2;
```

Output

```javascript
TypeError
```

Not allowed.

---

# Important Interview Question

## Does const make object immutable?

No.

Many developers misunderstand this.

---

### Example

```javascript
const user = {
    name: "John"
};

user.name = "Bob";

console.log(user);
```

Output

```javascript
{
  name: "Bob"
}
```

Works.

Because:

```javascript
user
```

still points to same object.

---

This is NOT allowed:

```javascript
const user = {
    name: "John"
};

user = {};
```

Error.

Because now reference changes.

---

# Hoisting

One of the most asked JS interview topics.

---

## What is Hoisting?

JavaScript moves declarations to top of scope during compilation.

---

### Example

```javascript
console.log(name);

var name = "John";
```

Output

```javascript
undefined
```

JavaScript internally treats it as:

```javascript
var name;

console.log(name);

name = "John";
```

---

# let and const Hoisting

Many people think they are not hoisted.

Wrong.

They ARE hoisted.

But they behave differently.

---

Example

```javascript
console.log(age);

let age = 25;
```

Output

```javascript
ReferenceError
```

Why?

Because of:

# Temporal Dead Zone (TDZ)

---

# What is TDZ?

Time between:

```javascript
Variable hoisted
```

and

```javascript
Variable initialized
```

---

Example

```javascript
{
    console.log(age);

    let age = 25;
}
```

When execution reaches:

```javascript
console.log(age);
```

age exists.

But initialization hasn't happened yet.

Therefore:

```javascript
ReferenceError
```

This zone is called TDZ.

---

# React Native Example

You will write:

```javascript
const UserScreen = () => {

    const [users, setUsers] = useState([]);

    return null;
};
```

Almost everything is const.

---

Why?

Because:

```javascript
const UserScreen = () => {}
```

should never be reassigned.

---

# Best Practices

### Use const by default

```javascript
const name = "Siddharth";
```

---

### Use let only when value changes

```javascript
let counter = 0;

counter++;
```

---

### Avoid var completely

Modern React Native projects rarely use var.

---

# Practice Questions

## Q1

Output?

```javascript
{
    let a = 10;
}

console.log(a);
```

Answer:

```javascript
ReferenceError
```

---

## Q2

Output?

```javascript
const user = {
    name: "John"
};

user.name = "Alex";

console.log(user.name);
```

Answer:

```javascript
Alex
```

---

## Q3

Output?

```javascript
console.log(a);

var a = 10;
```

Answer:

```javascript
undefined
```

---

## Q4

Output?

```javascript
console.log(a);

let a = 10;
```

Answer:

```javascript
ReferenceError
```

---

## Q5

Output?

```javascript
for (let i = 0; i < 3; i++) {
}

console.log(i);
```

Answer:

```javascript
ReferenceError
```

---

# Mini Assignment

Create:

```javascript
const user = {
    name: "Siddharth",
    age: 30,
    city: "Bangalore"
};
```

Tasks:

1. Change age to 31.
2. Add email property.
3. Try reassigning whole object.
4. Observe result.

---

# What you should remember

| Feature   | var      | let       | const  |
| --------- | -------- | --------- | ------ |
| Scope     | Function | Block     | Block  |
| Reassign  | Yes      | Yes       | No     |
| Redeclare | Yes      | No        | No     |
| Hoisted   | Yes      | Yes       | Yes    |
| TDZ       | No       | Yes       | Yes    |
| Use Today | No       | Sometimes | Mostly |

---

Once you're comfortable with this, the next tutorial should be **Day 2: Template Strings**, where I'll cover:

* String interpolation
* Multi-line strings
* Tagged templates
* Real React Native examples
* Interview questions
* Practice exercises

This level of depth is how I'll explain every topic in the roadmap.

