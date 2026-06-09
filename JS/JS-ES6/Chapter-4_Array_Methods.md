# Day 4 — Array Methods (`map`, `filter`, `find`, `reduce`)

This is one of the most important JavaScript topics for React Native.

If you fetch data from an API:

```javascript
[
  {
    id: 1,
    name: "John"
  },
  {
    id: 2,
    name: "Alex"
  }
]
```

You will almost always use:

* `map()` → Transform data
* `filter()` → Remove unwanted items
* `find()` → Get one item
* `reduce()` → Aggregate data

---

# Mental Model

Imagine this array:

```javascript
const users = [
  {
    id: 1,
    name: "John",
    age: 25
  },
  {
    id: 2,
    name: "Alex",
    age: 30
  },
  {
    id: 3,
    name: "Bob",
    age: 20
  }
];
```

Question:

* Need all names? → `map`
* Need users older than 25? → `filter`
* Need user with id 2? → `find`
* Need total age? → `reduce`

---

# 1. map()

## What is map()?

Map transforms each element and returns a NEW array.

Think:

```text
Input Array
     ↓
 Transformation
     ↓
Output Array
```

---

## Syntax

```javascript
array.map(callback)
```

Callback receives:

```javascript
array.map((item, index) => {
   // logic
})
```

---

# Example 1

```javascript
const numbers = [1,2,3,4];
```

Need:

```javascript
[2,4,6,8]
```

---

```javascript
const doubled =
  numbers.map(num => num * 2);

console.log(doubled);
```

Output:

```javascript
[2,4,6,8]
```

---

# Visual Flow

```text
1 → 2

2 → 4

3 → 6

4 → 8
```

Result:

```javascript
[2,4,6,8]
```

---

# Example 2

Extract names

```javascript
const users = [
  { id:1, name:"John" },
  { id:2, name:"Alex" },
  { id:3, name:"Bob" }
];
```

---

```javascript
const names =
 users.map(user => user.name);

console.log(names);
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

# React Native Example

Suppose API returns:

```javascript
const users = [
  {id:1,name:"John"},
  {id:2,name:"Alex"},
  {id:3,name:"Bob"}
];
```

Rendering:

```javascript
{
 users.map(user => (
   <Text key={user.id}>
      {user.name}
   </Text>
 ))
}
```

Output:

```text
John
Alex
Bob
```

You will do this daily.

---

# map() Parameters

```javascript
array.map((item,index,array) => {})
```

---

Example:

```javascript
const fruits =
[
 "Apple",
 "Banana",
 "Orange"
];

fruits.map((fruit,index) => {
   console.log(index, fruit);
});
```

Output:

```text
0 Apple
1 Banana
2 Orange
```

---

# Common Interview Question

Does map modify original array?

NO.

```javascript
const numbers = [1,2,3];

const doubled =
 numbers.map(num => num * 2);

console.log(numbers);
```

Output:

```javascript
[1,2,3]
```

Original unchanged.

---

# 2. filter()

## What is filter()?

Returns only items matching condition.

Think:

```text
Keep ?
YES → Include

NO → Skip
```

---

# Example

```javascript
const numbers =
[1,2,3,4,5,6];
```

Need even numbers.

---

```javascript
const evens =
 numbers.filter(num => num % 2 === 0);

console.log(evens);
```

Output:

```javascript
[2,4,6]
```

---

# Visual Flow

```text
1 → NO

2 → YES

3 → NO

4 → YES

5 → NO

6 → YES
```

Result:

```javascript
[2,4,6]
```

---

# Example 2

```javascript
const users = [
 {name:"John", age:25},
 {name:"Alex", age:35},
 {name:"Bob", age:40}
];
```

Need age > 30

```javascript
const adults =
 users.filter(user => user.age > 30);

console.log(adults);
```

Output:

```javascript
[
 {name:"Alex", age:35},
 {name:"Bob", age:40}
]
```

---

# React Native Example

Search users.

```javascript
const searchText = "jo";
```

---

```javascript
const filteredUsers =
 users.filter(user =>
    user.name
      .toLowerCase()
      .includes(searchText)
 );
```

Result:

```javascript
[
 {name:"John"}
]
```

Very common interview question.

---

# Does filter return first match?

NO.

Returns ALL matches.

```javascript
[
 match1,
 match2,
 match3
]
```

---

# 3. find()

## What is find()?

Returns FIRST matching element.

Think:

```text
Search
 ↓
Found?
 ↓
Return immediately
```

---

Example:

```javascript
const users = [
 {id:1,name:"John"},
 {id:2,name:"Alex"},
 {id:3,name:"Bob"}
];
```

Need user id 2

---

```javascript
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

# Visual Flow

```text
id=1 ? NO

id=2 ? YES

STOP
```

---

# No Match Case

```javascript
const user =
 users.find(user => user.id === 10);

console.log(user);
```

Output:

```javascript
undefined
```

---

# Difference Between find and filter

Array:

```javascript
[
 {id:1},
 {id:2},
 {id:2}
]
```

---

Find:

```javascript
array.find(item => item.id === 2)
```

Output:

```javascript
{id:2}
```

First match only.

---

Filter:

```javascript
array.filter(item => item.id === 2)
```

Output:

```javascript
[
 {id:2},
 {id:2}
]
```

All matches.

---

# React Native Example

Suppose user taps item.

```javascript
const selectedUser =
 users.find(user =>
   user.id === selectedId
 );
```

Used constantly.

---

# 4. reduce()

Most powerful.

Most feared.

Let's make it simple.

---

# What is reduce?

Reduce converts array into a SINGLE value.

Think:

```text
Many values
     ↓
 One value
```

---

Examples:

```javascript
[1,2,3,4]
```

Can become:

```javascript
10
```

or

```javascript
{
 total:10
}
```

or

```javascript
"1234"
```

Anything.

---

# Syntax

```javascript
array.reduce(
 (accumulator,currentValue) => {},
 initialValue
)
```

---

# Example 1

Sum numbers.

```javascript
const numbers =
 [1,2,3,4];
```

---

```javascript
const total =
 numbers.reduce(
   (acc,num) => acc + num,
   0
 );

console.log(total);
```

Output:

```javascript
10
```

---

# Visual Flow

Initial:

```javascript
acc = 0
```

Step 1

```javascript
0 + 1 = 1
```

Step 2

```javascript
1 + 2 = 3
```

Step 3

```javascript
3 + 3 = 6
```

Step 4

```javascript
6 + 4 = 10
```

Result:

```javascript
10
```

---

# Example 2

Total Price

```javascript
const cart = [
 {price:100},
 {price:200},
 {price:300}
];
```

---

```javascript
const total =
 cart.reduce(
   (sum,item) =>
      sum + item.price,
   0
 );

console.log(total);
```

Output:

```javascript
600
```

---

# Example 3

Count Users

```javascript
const users =
[
 "John",
 "Alex",
 "Bob"
];
```

---

```javascript
const count =
 users.reduce(
   acc => acc + 1,
   0
 );

console.log(count);
```

Output:

```javascript
3
```

---

# Chaining Methods

Real-world code often combines them.

---

Example:

```javascript
const users = [
 {name:"John", age:25},
 {name:"Alex", age:35},
 {name:"Bob", age:40}
];
```

Need:

* age > 30
* only names

---

```javascript
const result =
 users
   .filter(user => user.age > 30)
   .map(user => user.name);

console.log(result);
```

Output:

```javascript
[
 "Alex",
 "Bob"
]
```

---

# Real React Native Example

API:

```javascript
[
 {id:1,name:"John", active:true},
 {id:2,name:"Alex", active:false},
 {id:3,name:"Bob", active:true}
]
```

Show only active users.

```javascript
{
 users
   .filter(user => user.active)
   .map(user => (
      <Text key={user.id}>
         {user.name}
      </Text>
   ))
}
```

---

# Interview Questions

## map vs forEach

### map

Returns array

```javascript
const result =
 arr.map(x => x*2);
```

---

### forEach

Returns undefined

```javascript
arr.forEach(x => {
 console.log(x);
});
```

---

## map vs filter

Map transforms.

```javascript
[1,2,3]
```

↓

```javascript
[2,4,6]
```

---

Filter removes.

```javascript
[1,2,3,4]
```

↓

```javascript
[2,4]
```

---

## filter vs find

Filter:

```javascript
returns array
```

Find:

```javascript
returns one element
```

---

## reduce purpose

Convert many values into one value.

---

# Practice Exercises

## Exercise 1

```javascript
const numbers =
[1,2,3,4];
```

Using map:

```javascript
[10,20,30,40]
```

---

## Exercise 2

```javascript
const numbers =
[1,2,3,4,5,6];
```

Using filter:

```javascript
[2,4,6]
```

---

## Exercise 3

```javascript
const users = [
 {id:1,name:"John"},
 {id:2,name:"Alex"}
];
```

Find Alex.

---

## Exercise 4

```javascript
const prices =
[100,200,300];
```

Using reduce:

```javascript
600
```

---

## Exercise 5 (React Native Style)

```javascript
const users = [
 {name:"John", active:true},
 {name:"Alex", active:false},
 {name:"Bob", active:true}
];
```

Get:

```javascript
[
 "John",
 "Bob"
]
```

Hint:

```javascript
filter()
map()
```

---

# Mental Model Cheat Sheet

| Method  | Returns          | Use Case            |
| ------- | ---------------- | ------------------- |
| map     | New Array        | Transform           |
| filter  | New Array        | Keep matching items |
| find    | Single Item      | Find one object     |
| reduce  | Any Single Value | Aggregate           |
| forEach | undefined        | Side effects        |

---

# React Native Interview Reality

You will see these every day:

```javascript
users.map(...)
users.filter(...)
users.find(...)
products.reduce(...)
```

When rendering a `FlatList`, processing API responses, implementing search, calculating totals, or transforming state.

Master these four methods before moving to React because React's rendering model heavily depends on `map()`, and API handling frequently uses `filter()`, `find()`, and `reduce()`.

