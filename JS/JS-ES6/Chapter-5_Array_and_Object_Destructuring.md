# Day 5 — Destructuring (Array & Object Destructuring)

This is one of the most used JavaScript features in React and React Native.

In React Native, you'll see destructuring in:

* Props
* State
* API Responses
* Navigation Params
* Redux
* Custom Hooks
* Function Parameters

If you master destructuring, React code becomes much easier to read.

---

# What is Destructuring?

Destructuring means:

> Extract values from arrays or objects and assign them to variables in a clean way.

Without destructuring:

```javascript
const user = {
    name: "Siddharth",
    age: 30,
    city: "Bangalore"
};

const name = user.name;
const age = user.age;
const city = user.city;
```

With destructuring:

```javascript
const user = {
    name: "Siddharth",
    age: 30,
    city: "Bangalore"
};

const { name, age, city } = user;
```

Much cleaner.

---

# Part 1 — Array Destructuring

---

## Traditional Way

```javascript
const colors = [
    "Red",
    "Green",
    "Blue"
];

const first = colors[0];
const second = colors[1];
const third = colors[2];
```

---

## Destructuring Way

```javascript
const colors = [
    "Red",
    "Green",
    "Blue"
];

const [first, second, third] = colors;

console.log(first);
console.log(second);
console.log(third);
```

Output:

```text
Red
Green
Blue
```

---

# Visual Mental Model

```javascript
const colors = [
    "Red",
    "Green",
    "Blue"
];
```

Destructuring:

```javascript
const [a, b, c] = colors;
```

Mapping:

```text
a → Red

b → Green

c → Blue
```

---

# Order Matters

Arrays use POSITION.

```javascript
const colors = [
    "Red",
    "Green",
    "Blue"
];

const [x, y] = colors;
```

Result:

```text
x = Red
y = Green
```

Variable names don't matter.

Position matters.

---

# Skipping Elements

```javascript
const colors = [
    "Red",
    "Green",
    "Blue"
];

const [first, , third] = colors;

console.log(first);
console.log(third);
```

Output:

```text
Red
Blue
```

---

# Default Values

```javascript
const colors = ["Red"];

const [first, second = "Black"] = colors;

console.log(second);
```

Output:

```text
Black
```

---

# Rest Operator with Arrays

```javascript
const numbers = [
    10,
    20,
    30,
    40,
    50
];

const [first, ...remaining] = numbers;

console.log(first);
console.log(remaining);
```

Output:

```javascript
10

[20,30,40,50]
```

---

# Swap Variables

Interview favorite.

Traditional:

```javascript
let a = 10;
let b = 20;

let temp = a;
a = b;
b = temp;
```

---

Destructuring:

```javascript
let a = 10;
let b = 20;

[a, b] = [b, a];

console.log(a, b);
```

Output:

```text
20 10
```

---

# Part 2 — Object Destructuring

Most important for React Native.

---

## Traditional Way

```javascript
const user = {
    name: "Siddharth",
    age: 30,
    city: "Bangalore"
};

const name = user.name;
const age = user.age;
```

---

## Destructuring Way

```javascript
const user = {
    name: "Siddharth",
    age: 30,
    city: "Bangalore"
};

const { name, age } = user;

console.log(name);
console.log(age);
```

Output:

```text
Siddharth
30
```

---

# Important Difference

Arrays:

```javascript
const [a,b]
```

use POSITION.

Objects:

```javascript
const {name,age}
```

use PROPERTY NAME.

---

Example:

```javascript
const user = {
    age: 30,
    name: "Siddharth"
};

const { name, age } = user;
```

Works.

Order doesn't matter.

---

# Renaming Variables

Very common.

```javascript
const user = {
    name: "Siddharth"
};

const {
    name: userName
} = user;

console.log(userName);
```

Output:

```text
Siddharth
```

---

# Default Values

```javascript
const user = {
    name: "Siddharth"
};

const {
    country = "India"
} = user;

console.log(country);
```

Output:

```text
India
```

---

# Nested Object Destructuring

```javascript
const user = {
    name: "Siddharth",
    address: {
        city: "Bangalore",
        state: "Karnataka"
    }
};
```

---

Traditional:

```javascript
const city =
 user.address.city;
```

---

Destructuring:

```javascript
const {
    address: { city }
} = user;

console.log(city);
```

Output:

```text
Bangalore
```

---

# Function Parameter Destructuring

Very common in React.

Without:

```javascript
function printUser(user) {
    console.log(user.name);
}
```

---

With:

```javascript
function printUser({ name }) {
    console.log(name);
}
```

Cleaner.

---

# React Native Example

Suppose:

```javascript
const user = {
    name: "Siddharth",
    email: "test@gmail.com"
};
```

---

Component:

```javascript
const UserCard = ({ name, email }) => {
    return (
        <View>
            <Text>{name}</Text>
            <Text>{email}</Text>
        </View>
    );
};
```

---

Usage:

```javascript
<UserCard
    name="Siddharth"
    email="test@gmail.com"
/>
```

This pattern is everywhere.

---

# React useState Example

You already use destructuring without realizing it.

```javascript
const [count, setCount] =
    useState(0);
```

---

What React returns:

```javascript
[
  currentValue,
  updateFunction
]
```

Destructuring extracts:

```javascript
count
```

and

```javascript
setCount
```

---

Visual:

```javascript
const result =
 useState(0);
```

Returns:

```javascript
[
 0,
 function
]
```

Destructuring:

```javascript
const [count, setCount]
```

Becomes:

```javascript
count = 0

setCount = function
```

---

# API Response Example

API:

```javascript
{
    id: 1,
    name: "John",
    email: "john@test.com"
}
```

---

Without:

```javascript
const user = response;

console.log(user.name);
console.log(user.email);
```

---

With:

```javascript
const {
    name,
    email
} = response;

console.log(name);
console.log(email);
```

---

# Combining Destructuring + map()

Very common.

```javascript
const users = [
  {
    id:1,
    name:"John"
  },
  {
    id:2,
    name:"Alex"
  }
];
```

---

Instead of:

```javascript
users.map(user => {
    return user.name;
});
```

Use:

```javascript
users.map(({ name }) => {
    return name;
});
```

Even cleaner.

---

# Interview Questions

---

## Question 1

Output?

```javascript
const arr =
 [10,20,30];

const [a,b] = arr;

console.log(a,b);
```

Output:

```text
10 20
```

---

## Question 2

Output?

```javascript
const user = {
  name:"John"
};

const {
   age = 25
} = user;

console.log(age);
```

Output:

```text
25
```

---

## Question 3

Output?

```javascript
const arr =
 [1,2,3,4];

const [a,...rest] = arr;

console.log(rest);
```

Output:

```javascript
[2,3,4]
```

---

## Question 4

Output?

```javascript
const user = {
   name:"John"
};

const {
   name:userName
} = user;

console.log(userName);
```

Output:

```text
John
```

---

# Common Mistakes

---

### Object Destructuring Uses {}

Correct:

```javascript
const { name } = user;
```

Wrong:

```javascript
const [name] = user;
```

---

### Array Destructuring Uses []

Correct:

```javascript
const [first] = colors;
```

Wrong:

```javascript
const { first } = colors;
```

---

# Practice Exercises

## Exercise 1

```javascript
const fruits = [
 "Apple",
 "Banana",
 "Orange"
];
```

Extract:

```javascript
Apple
Banana
Orange
```

using destructuring.

---

## Exercise 2

```javascript
const numbers =
 [10,20,30,40];
```

Extract:

```javascript
first = 10

remaining =
[20,30,40]
```

---

## Exercise 3

```javascript
const user = {
 name:"Siddharth",
 city:"Bangalore"
};
```

Destructure both properties.

---

## Exercise 4

Rename:

```javascript
name
```

to:

```javascript
userName
```

using destructuring.

---

## Exercise 5 (React Native Style)

API Response:

```javascript
const user = {
    id: 1,
    name: "Siddharth",
    email: "test@gmail.com",
    phone: "9999999999"
};
```

Destructure:

```javascript
name
email
```

and print them.

---

# Mental Model Cheat Sheet

## Arrays

```javascript
const [a,b,c] = arr;
```

Position-based.

---

## Objects

```javascript
const {name,age} = obj;
```

Property-name based.

---

## Rest

```javascript
const [first,...rest] = arr;
```

Collect remaining values.

---

## Rename

```javascript
const {name:userName} = user;
```

---

## Default

```javascript
const {country="India"} = user;
```

---

# React Native Reality

You'll write these patterns daily:

```javascript
const [users, setUsers] = useState([]);

const {name, email} = user;

const UserCard = ({name, email}) => {}

users.map(({id, name}) => ...)
```

Mastering destructuring will make React Native code look much less intimidating.

---


