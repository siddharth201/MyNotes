
## Check if Node is installed  
 
```text
node -v  —> [v26.0.0]
npm -v —> [11.12.1]
```
  
  
## If not installed
```text
brew install node. 
```

# 1. Variables

Used to store values.

---

## `let`

Value can change.

```js
let name = "Sid";
name = "Siddharth";
```

---

## `const`

Value should not be reassigned.

```js
const age = 28;
```

Most React Native code uses `const`.

---

## `var`

Older JavaScript.

Avoid in modern code.

---

# 2. Data Types

---

## String

```js
const name = "Sid";
```

---

## Number

```js
const age = 30;
```

---

## Boolean

```js
const isLoggedIn = true;
```

---

## Array

```js
const users = ["Sid", "Ram", "Amit"];
```

---

## Object

Very common in React Native.

```js
const user = {
  name: "Sid",
  age: 28,
};
```

---

# 3. Functions

Very important.

---

## Normal function

```js
function greet() {
  console.log("Hello");
}
```

---

## Function with parameter

```js
function greet(name) {
  console.log(name);
}
```

---

# 4. Arrow Functions

Used everywhere in React Native.

```js
const greet = () => {
  console.log("Hello");
};
```

With parameter:

```js
const greet = (name) => {
  console.log(name);
};
```

---

# Why arrow functions are common?

Because React components are often written like:

```jsx
const HomeScreen = () => {
  return <Text>Hello</Text>;
};
```

---

# 5. Arrays

Very important because FlatList uses arrays.

---

Example:

```js
const users = ["A", "B", "C"];
```

Access:

```js
console.log(users[0]);
```

---

# Array methods

---

## `map()`

Very important in React.

Transforms array.

```js
const numbers = [1, 2, 3];

const doubled = numbers.map((item) => item * 2);
```

Result:

```js
[2, 4, 6]
```

---

## `filter()`

Filters data.

```js
const users = [1, 2, 3, 4];

const even = users.filter((x) => x % 2 === 0);
```

---

## `find()`

Returns first match.

```js
const user = users.find((u) => u.id === 2);
```

---

# 6. Objects

Very important because API response is usually object-based.

---

Example:

```js
const user = {
  name: "Sid",
  age: 28,
};
```

Access:

```js
console.log(user.name);
```

---

# 7. Destructuring

Used heavily in React Native.

Example:

```js
const user = {
  name: "Sid",
  age: 28,
};

const { name, age } = user;
```

---

Very common in components:

```jsx
const UserCard = ({ name, age }) => {
  return <Text>{name}</Text>;
};
```

---

# 8. Spread Operator `...`

Very common in Redux.

---

Example:

```js
const user = {
  name: "Sid",
};

const updatedUser = {
  ...user,
  age: 28,
};
```

Result:

```js
{
  name: "Sid",
  age: 28
}
```

---

Reducer example:

```js
return {
  ...state,
  loading: true,
};
```

Very common.

---

# 9. `if` / Conditional Rendering

---

Example:

```js
if (loading) {
  console.log("Loading...");
}
```

React Native:

```jsx
{
  loading ? <Loader /> : <UserList />;
}
```

Very common.

---

# 10. Async / Await

Extremely important.

Used in API calls.

---

Example:

```js
const fetchUsers = async () => {
  const response = await fetch(url);
};
```

Meaning:

* wait for API response
* then continue

---

# 11. Promise

API calls usually return Promise.

Example:

```js
fetchUsers()
  .then((response) => {})
  .catch((error) => {});
```

---

In modern code:

`async/await` is preferred.

---

# TypeScript Basics

TypeScript

TypeScript = JavaScript + types.

---

# 1. Type Annotation

---

## String

```ts
let name: string = "Sid";
```

---

## Number

```ts
let age: number = 28;
```

---

## Boolean

```ts
let isActive: boolean = true;
```

---

# 2. Array Type

```ts
let users: string[] = ["Sid", "Ram"];
```

---

Number array:

```ts
let ids: number[] = [1, 2, 3];
```

---

# 3. Function Type

```ts
function add(a: number, b: number): number {
  return a + b;
}
```

Here:

* a → number
* b → number
* return → number

---

# 4. Object Type

```ts
const user: {
  name: string;
  age: number;
} = {
  name: "Sid",
  age: 28,
};
```

---

# 5. Interface

Very important in React Native.

Used a lot for API response models.

---

Example:

```ts
interface User {
  id: number;
  name: string;
  email: string;
}
```

Then:

```ts
const user: User = {
  id: 1,
  name: "Sid",
  email: "sid@test.com",
};
```

---

# 6. Optional Property `?`

Very common.

```ts
interface User {
  name: string;
  phone?: string;
}
```

Means:

phone may or may not exist.

---

# 7. Props typing in React Native

Very common.

Example:

```tsx
type Props = {
  title: string;
};

const Header = ({ title }: Props) => {
  return <Text>{title}</Text>;
};
```

---

# 8. API typing example

Very interview-friendly.

```ts
interface User {
  id: number;
  name: string;
  email: string;
}
```

Then:

```ts
const [users, setUsers] = useState<User[]>([]);
```

This means:

```text
users = array of User objects
```

---

# Most important JS topics for React Native interview

If short on time, focus here:

✅ let / const
✅ arrow functions
✅ arrays
✅ map
✅ objects
✅ destructuring
✅ spread operator
✅ async / await
✅ promises

---

# Most important TS topics for React Native interview

Focus here:

✅ basic types
✅ interfaces
✅ props typing
✅ array typing
✅ optional properties
✅ API response typing

---

# One practical example

JavaScript:

```js
const users = [
  { id: 1, name: "Sid" },
  { id: 2, name: "Ram" },
];

users.map((item) => console.log(item.name));
```

---

TypeScript:

```ts
interface User {
  id: number;
  name: string;
}

const users: User[] = [
  { id: 1, name: "Sid" },
  { id: 2, name: "Ram" },
];
```

This is extremely common in React Native apps.

---

# iOS mapping for you

Since you know Swift:

| JavaScript / TypeScript |             Swift Equivalent |
| ----------------------- | ---------------------------: |
| object                  |           Dictionary / Model |
| array                   |                        Array |
| interface               | struct / protocol-like model |
| async/await             |                  async/await |
| function                |                         func |
| destructuring           | similar to extracting values |

---

If you want, next we can do **React Hooks (`useState`, `useEffect`, `useMemo`, `useCallback`)**, which interviewers ask very often.

