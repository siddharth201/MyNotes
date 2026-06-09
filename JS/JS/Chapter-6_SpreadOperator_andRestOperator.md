# Day 6 — Spread Operator (`...`) and Rest Operator (`...`)

This is one of the most important topics in React Native because **React state should be updated immutably**.

You will use `...` almost every day.

Many beginners get confused because:

```javascript
...
```

is used for both:

1. Spread Operator
2. Rest Operator

Same symbol, different behavior.

---

# Mental Model

## Spread

Think:

```text
EXPAND
```

or

```text
UNPACK
```

Example:

```javascript
[1,2,3]
```

Spread:

```javascript
...[1,2,3]
```

Becomes:

```javascript
1,2,3
```

---

## Rest

Think:

```text
COLLECT
```

or

```text
PACK
```

Example:

```javascript
1,2,3
```

Rest:

```javascript
...numbers
```

Becomes:

```javascript
[1,2,3]
```

---

# PART 1: Spread Operator

---

# Spread with Arrays

Suppose:

```javascript
const fruits = [
  "Apple",
  "Banana",
  "Orange"
];
```

---

Without Spread

```javascript
console.log(fruits);
```

Output:

```javascript
[
 "Apple",
 "Banana",
 "Orange"
]
```

---

With Spread

```javascript
console.log(...fruits);
```

Output:

```text
Apple Banana Orange
```

Array gets expanded.

---

# Array Copy

One of the most common use cases.

---

Without Spread

```javascript
const arr1 = [1,2,3];

const arr2 = arr1;
```

Memory:

```text
arr1 ----\
          > same array
arr2 ----/
```

---

Problem:

```javascript
arr2.push(4);

console.log(arr1);
```

Output:

```javascript
[1,2,3,4]
```

Oops.

Both changed.

---

Why?

Because arrays are reference types.

---

# Correct Way

```javascript
const arr1 = [1,2,3];

const arr2 = [...arr1];
```

Now:

```text
arr1 -> [1,2,3]

arr2 -> [1,2,3]
```

Separate arrays.

---

```javascript
arr2.push(4);

console.log(arr1);
console.log(arr2);
```

Output:

```javascript
[1,2,3]

[1,2,3,4]
```

---

# Merge Arrays

Very common.

```javascript
const arr1 = [1,2];
const arr2 = [3,4];
```

---

Without Spread

```javascript
const result =
  arr1.concat(arr2);
```

---

With Spread

```javascript
const result =
 [
   ...arr1,
   ...arr2
 ];

console.log(result);
```

Output:

```javascript
[1,2,3,4]
```

---

# Add Item to Array

Suppose:

```javascript
const users =
 ["John","Alex"];
```

Need:

```javascript
["John","Alex","Bob"]
```

---

```javascript
const updatedUsers = [
   ...users,
   "Bob"
];
```

Output:

```javascript
[
 "John",
 "Alex",
 "Bob"
]
```

---

# React Native State Example

Very important.

Suppose:

```javascript
const [users,setUsers] =
  useState(["John"]);
```

Need to add:

```javascript
"Alex"
```

---

Wrong:

```javascript
users.push("Alex");
```

Mutates state.

---

Correct:

```javascript
setUsers([
   ...users,
   "Alex"
]);
```

---

# Spread with Objects

Another daily React Native pattern.

---

Object:

```javascript
const user = {
   name:"John",
   age:25
};
```

---

Copy Object

```javascript
const copy = {
   ...user
};
```

Output:

```javascript
{
  name:"John",
  age:25
}
```

---

# Update Object Property

Suppose:

```javascript
const user = {
  name:"John",
  age:25
};
```

Need:

```javascript
age = 30
```

---

```javascript
const updatedUser = {
   ...user,
   age:30
};
```

Output:

```javascript
{
  name:"John",
  age:30
}
```

---

# Visual Explanation

Step 1

```javascript
...user
```

Expands:

```javascript
{
 name:"John",
 age:25
}
```

---

Step 2

```javascript
age:30
```

Overrides existing value.

Final:

```javascript
{
 name:"John",
 age:30
}
```

---

# React Native State Update

Extremely common.

```javascript
const [user,setUser] =
 useState({
   name:"John",
   age:25
 });
```

Need update age.

---

Wrong:

```javascript
user.age = 30;
```

---

Correct:

```javascript
setUser({
   ...user,
   age:30
});
```

---

You will write code like this constantly.

---

# Spread with Function Calls

Function:

```javascript
function add(a,b,c){
   return a+b+c;
}
```

Array:

```javascript
const nums =
 [10,20,30];
```

---

Without Spread

```javascript
add(nums);
```

Wrong.

---

With Spread

```javascript
add(...nums);
```

Becomes:

```javascript
add(10,20,30);
```

Output:

```javascript
60
```

---

# PART 2: Rest Operator

Now let's switch.

---

# Rest in Function Parameters

Suppose:

```javascript
function sum(a,b,c){

}
```

Only accepts 3 values.

---

Need:

```javascript
sum(1,2,3,4,5,6);
```

---

Use Rest.

```javascript
function sum(...numbers){

}
```

---

Call:

```javascript
sum(1,2,3,4,5);
```

Inside function:

```javascript
numbers
```

becomes:

```javascript
[1,2,3,4,5]
```

---

Complete Example

```javascript
function sum(...numbers){

  return numbers.reduce(
     (total,num) =>
       total + num,
     0
  );

}
```

---

```javascript
console.log(
 sum(1,2,3,4,5)
);
```

Output:

```javascript
15
```

---

# Rest with Array Destructuring

Suppose:

```javascript
const numbers =
 [10,20,30,40];
```

---

```javascript
const [
   first,
   ...remaining
] = numbers;
```

Output:

```javascript
first = 10

remaining =
[20,30,40]
```

---

# Visual

```text
10 → first

20
30
40
 ↓
remaining
```

---

# Rest with Object Destructuring

Object:

```javascript
const user = {
   name:"John",
   age:25,
   city:"Delhi"
};
```

---

```javascript
const {
   name,
   ...otherData
} = user;
```

Output:

```javascript
name = "John"

otherData = {
 age:25,
 city:"Delhi"
}
```

---

Very useful.

---

# Spread vs Rest

Most common interview question.

---

## Spread

Expands values.

```javascript
const nums =
 [1,2,3];

console.log(...nums);
```

Output:

```text
1 2 3
```

---

## Rest

Collects values.

```javascript
function test(...nums){

}
```

Output:

```javascript
[1,2,3]
```

---

# Easy Rule

If `...` is on the RIGHT side

```javascript
[...arr]
```

Usually Spread.

---

If `...` is on the LEFT side

```javascript
const [...rest]
```

Usually Rest.

---

# Real React Native Examples

---

# Example 1

Updating User State

```javascript
setUser({
  ...user,
  age:30
});
```

---

# Example 2

Appending New Message

```javascript
setMessages([
   ...messages,
   newMessage
]);
```

---

# Example 3

Removing Property

```javascript
const {
   password,
   ...safeUser
} = user;
```

Result:

```javascript
safeUser
```

contains everything except password.

---

# Interview Questions

---

## Question 1

Output?

```javascript
const arr =
 [1,2,3];

console.log(...arr);
```

Output:

```text
1 2 3
```

---

## Question 2

Output?

```javascript
const arr =
 [1,2,3];

const copy =
 [...arr];

console.log(copy);
```

Output:

```javascript
[1,2,3]
```

---

## Question 3

Output?

```javascript
const [
 a,
 ...rest
] = [1,2,3,4];
```

Result:

```javascript
a = 1

rest =
[2,3,4]
```

---

## Question 4

Output?

```javascript
function test(...nums){
   console.log(nums);
}

test(1,2,3);
```

Output:

```javascript
[1,2,3]
```

---

# Practice Exercises

### Exercise 1

Merge:

```javascript
const a = [1,2];
const b = [3,4];
```

Result:

```javascript
[1,2,3,4]
```

---

### Exercise 2

Copy:

```javascript
const users =
 ["John","Alex"];
```

into a new array.

---

### Exercise 3

Create:

```javascript
function multiply(...nums)
```

and return product.

---

### Exercise 4

Object:

```javascript
const user = {
  name:"John",
  age:25
};
```

Create new object with:

```javascript
age:30
```

using spread.

---

### Exercise 5 (React Native Style)

```javascript
const [todos,setTodos] =
 useState([]);
```

Add:

```javascript
{
 id:1,
 title:"Learn React Native"
}
```

without mutating state.

---

# Mental Model Cheat Sheet

| Operator                | Meaning | Example           |
| ----------------------- | ------- | ----------------- |
| Spread                  | Expand  | `...array`        |
| Rest                    | Collect | `(...args)`       |
| Array Copy              | Spread  | `[...arr]`        |
| Object Copy             | Spread  | `{...obj}`        |
| Merge Arrays            | Spread  | `[...a,...b]`     |
| Function Params         | Rest    | `(...args)`       |
| Destructuring Leftovers | Rest    | `[first,...rest]` |

---

# Why React Native Developers Use Spread Constantly

React state should never be mutated directly.

That's why you'll repeatedly write:

```javascript
setUser({
   ...user,
   age:30
});

setItems([
   ...items,
   newItem
]);
```

Understanding spread deeply will make React state management much easier.

---



