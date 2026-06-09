# Arrow Functions (Most Important for React Native)

If I had to rank JavaScript topics for React Native:

| Topic           | Importance |
| --------------- | ---------- |
| Arrow Functions | ⭐⭐⭐⭐⭐      |
| Destructuring   | ⭐⭐⭐⭐⭐      |
| Async/Await     | ⭐⭐⭐⭐⭐      |
| Spread Operator | ⭐⭐⭐⭐⭐      |
| Promises        | ⭐⭐⭐⭐⭐      |

You will see arrow functions in almost every React Native file.

---

# Why Arrow Functions Were Introduced

Before ES6, functions were written like this:

```javascript
function add(a, b) {
    return a + b;
}
```

ES6 introduced a shorter syntax:

```javascript
const add = (a, b) => {
    return a + b;
};
```

Output:

```javascript
console.log(add(10, 20));
```

```text
30
```

---

# Basic Syntax

## Traditional Function

```javascript
function greet() {
    console.log("Hello");
}
```

---

## Arrow Function

```javascript
const greet = () => {
    console.log("Hello");
};
```

---

# Anatomy of Arrow Function

```javascript
const add = (a, b) => {
    return a + b;
};
```

Let's break it:

```javascript
const add
```

Variable name

```javascript
(a, b)
```

Parameters

```javascript
=>
```

Arrow operator

```javascript
{
   return a + b;
}
```

Function body

---

# No Parameter Function

Traditional:

```javascript
function greet() {
    return "Hello";
}
```

Arrow:

```javascript
const greet = () => {
    return "Hello";
};
```

---

# Single Parameter

Traditional:

```javascript
function square(num) {
    return num * num;
}
```

Arrow:

```javascript
const square = num => {
    return num * num;
};
```

Parentheses are optional when only one parameter exists.

---

# Multiple Parameters

```javascript
const multiply = (a, b) => {
    return a * b;
};
```

Parentheses required.

---

# Implicit Return

One of the most important features.

---

Normally:

```javascript
const add = (a, b) => {
    return a + b;
};
```

Can be simplified:

```javascript
const add = (a, b) => a + b;
```

Output:

```javascript
console.log(add(2, 3));
```

```text
5
```

---

JavaScript automatically returns:

```javascript
a + b
```

No need to write:

```javascript
return
```

---

# React Native Usage

You'll often see:

```javascript
const UserScreen = () => {
    return (
        <View>
            <Text>Hello</Text>
        </View>
    );
};
```

Every React component is usually an arrow function.

---

# Returning Objects

Common Interview Question

This DOES NOT work:

```javascript
const getUser = () => {
    name: "Siddharth";
};
```

Output:

```javascript
undefined
```

Because JavaScript thinks:

```javascript
{
}
```

is a function block.

---

Correct way:

```javascript
const getUser = () => ({
    name: "Siddharth"
});
```

Output:

```javascript
{
  name: "Siddharth"
}
```

Wrap object with parentheses.

---

# Arrow Functions with Arrays

Very common.

Suppose:

```javascript
const numbers = [1, 2, 3, 4];
```

Traditional:

```javascript
const doubled = numbers.map(function(num) {
    return num * 2;
});
```

Arrow:

```javascript
const doubled = numbers.map(num => num * 2);
```

Output:

```javascript
[2,4,6,8]
```

This pattern appears everywhere in React.

---

# map()

You will use:

```javascript
users.map(user => {
   return user.name;
});
```

or

```javascript
users.map(user => user.name);
```

---

# filter()

```javascript
const numbers = [1,2,3,4,5];

const evenNumbers =
    numbers.filter(num => num % 2 === 0);

console.log(evenNumbers);
```

Output:

```javascript
[2,4]
```

---

# find()

```javascript
const users = [
    {id:1,name:"John"},
    {id:2,name:"Alex"}
];

const user =
    users.find(user => user.id === 2);

console.log(user);
```

Output:

```javascript
{
 id:2,
 name:"Alex"
}
```

---

# Real React Native Example

Rendering a list:

```javascript
const users = [
    "John",
    "Alex",
    "Bob"
];
```

```javascript
{
  users.map(user => (
      <Text>{user}</Text>
  ))
}
```

You'll write code like this daily.

---

# Arrow Functions and Event Handlers

React Native:

```javascript
<Button
   title="Save"
   onPress={() => {
      console.log("Clicked");
   }}
/>
```

Arrow function is passed as callback.

---

# Why Not Write?

```javascript
onPress={console.log("Clicked")}
```

Because:

```javascript
console.log()
```

executes immediately.

---

Instead:

```javascript
onPress={() => {
   console.log("Clicked");
}}
```

Executes only when button is pressed.

---

# Closures

Arrow functions naturally create closures.

Example:

```javascript
const createCounter = () => {

    let count = 0;

    return () => {
        count++;
        return count;
    };
};

const counter = createCounter();

console.log(counter());
console.log(counter());
console.log(counter());
```

Output:

```text
1
2
3
```

We'll cover closures in depth later.

---

# The Biggest Topic: this

This is where arrow functions differ fundamentally from normal functions.

---

# Traditional Function

```javascript
const user = {

    name: "Siddharth",

    greet: function() {
        console.log(this.name);
    }
};

user.greet();
```

Output:

```text
Siddharth
```

Here:

```javascript
this
```

points to user object.

---

# Arrow Function

```javascript
const user = {

    name: "Siddharth",

    greet: () => {
        console.log(this.name);
    }
};

user.greet();
```

Output:

```javascript
undefined
```

Why?

Because arrow functions do NOT create their own:

```javascript
this
```

---

# Important Rule

Traditional Functions:

```javascript
function() {}
```

Create their own:

```javascript
this
```

---

Arrow Functions:

```javascript
() => {}
```

Borrow `this` from surrounding scope.

This is called:

## Lexical this

Most asked interview question.

---

# Visual Mental Model

Traditional:

```javascript
function() {
   this -> whoever calls me
}
```

Arrow:

```javascript
() => {
   this -> parent scope
}
```

---

# Why React Loves Arrow Functions

Imagine:

```javascript
class User {

    constructor() {
        this.name = "John";
    }

    printName() {
        setTimeout(function() {
            console.log(this.name);
        },1000);
    }
}
```

Output:

```javascript
undefined
```

because:

```javascript
this
```

changed.

---

Arrow function fixes it:

```javascript
class User {

    constructor() {
        this.name = "John";
    }

    printName() {
        setTimeout(() => {
            console.log(this.name);
        },1000);
    }
}
```

Output:

```javascript
John
```

Because arrow inherits parent this.

---

# React Native Interview Question

Output?

```javascript
const sum = (a,b) => a+b;

console.log(sum(2,3));
```

Output:

```text
5
```

---

# Interview Question

Output?

```javascript
const greet = () => "Hello";

console.log(greet());
```

Output:

```text
Hello
```

---

# Interview Question

Output?

```javascript
const getUser = () => ({
   name:"John"
});

console.log(getUser());
```

Output:

```javascript
{
  name:"John"
}
```

---

# Interview Question

Output?

```javascript
const square = num => num * num;

console.log(square(5));
```

Output:

```text
25
```

---

# Common Mistakes

### Forgetting Return

Wrong:

```javascript
const add = (a,b) => {
   a+b;
};
```

Output:

```javascript
undefined
```

Because no return.

---

Correct:

```javascript
const add = (a,b) => {
   return a+b;
};
```

or

```javascript
const add = (a,b) => a+b;
```

---

### Returning Object Wrongly

Wrong:

```javascript
const user = () => {
   name:"John";
};
```

Output:

```javascript
undefined
```

---

Correct:

```javascript
const user = () => ({
   name:"John"
});
```

---

# Practice Exercises

## Exercise 1

Convert:

```javascript
function add(a,b){
   return a+b;
}
```

into arrow function.

---

## Exercise 2

Create:

```javascript
const square = ?
```

that returns square.

---

## Exercise 3

Using map:

```javascript
const numbers = [1,2,3,4];
```

Create:

```javascript
[10,20,30,40]
```

---

## Exercise 4

Using filter:

```javascript
const numbers = [1,2,3,4,5,6];
```

Return only even numbers.

---

## Exercise 5

Using find:

```javascript
const users = [
 {id:1,name:"John"},
 {id:2,name:"Alex"}
];
```

Find user with id 2.

---

# React Native Connection

After this lesson, you should be able to understand code like:

```javascript
const UserScreen = () => {

    const loadUsers = async () => {
        const response =
            await fetch(url);

        const users =
            await response.json();

        console.log(users);
    };

    return (
        <Button
           title="Load"
           onPress={() => loadUsers()}
        />
    );
};
```

This single component uses:

* Arrow Functions
* Async Functions
* Callbacks
* Event Handlers

which are the foundation of modern React Native.

---

## Key Takeaways

1. Arrow functions are shorter than traditional functions.
2. Single-expression arrow functions support implicit return.
3. Wrap objects with `()` when returning them.
4. Arrow functions do **not** create their own `this`.
5. Arrow functions inherit `this` from parent scope (lexical `this`).
6. React Native uses arrow functions everywhere:

   * Components
   * Hooks
   * Event handlers
   * API callbacks
   * Array methods (`map`, `filter`, `find`)

Next, we should cover **Day 4: Array Methods (`map`, `filter`, `find`, `reduce`)**, because these are used heavily for rendering lists and transforming API data in React Native.

