# Day 10 — Inheritance & Polymorphism

Today we'll learn the most important OOP concepts after Classes.

These concepts are used heavily in:

* iOS (Swift)
* Android (Java/Kotlin)
* Design Patterns
* Native Modules
* Framework Design
* Interviews

Even though React Native itself uses functional components now, understanding inheritance helps you understand many existing codebases.

---

# What is Inheritance?

Inheritance means:

> A child class can reuse properties and methods of a parent class.

Real World Example:

```text
Animal
 │
 ├── name
 ├── eat()
 └── sleep()

      ▲
      │

Dog
 │
 ├── bark()
```

Dog doesn't need to redefine:

```text
eat()
sleep()
```

because it inherits them from Animal.

---

# Why Inheritance?

Without inheritance:

```javascript
class Dog {

   eat() {
      console.log("Eating");
   }

   sleep() {
      console.log("Sleeping");
   }

   bark() {
      console.log("Barking");
   }

}
```

---

```javascript
class Cat {

   eat() {
      console.log("Eating");
   }

   sleep() {
      console.log("Sleeping");
   }

   meow() {
      console.log("Meowing");
   }

}
```

Notice duplication.

Inheritance removes it.

---

# Creating Parent Class

```javascript
class Animal {

   eat() {
      console.log("Eating");
   }

   sleep() {
      console.log("Sleeping");
   }

}
```

---

# Creating Child Class

Use:

```javascript
extends
```

---

```javascript
class Dog extends Animal {

   bark() {
      console.log("Barking");
   }

}
```

---

Visual:

```text
Animal
  ↑
  │ extends
  │
Dog
```

---

# Creating Object

```javascript
const dog =
 new Dog();
```

---

Call child method:

```javascript
dog.bark();
```

Output:

```text
Barking
```

---

Call parent method:

```javascript
dog.eat();
```

Output:

```text
Eating
```

Even though:

```javascript
eat()
```

is not inside Dog.

---

# Visual Mental Model

Dog object contains:

```text
Dog
 │
 ├── bark()
 │
 └── inherited
      │
      ├── eat()
      └── sleep()
```

---

# Constructor Inheritance

Parent:

```javascript
class Animal {

   constructor(name) {
      this.name = name;
   }

}
```

---

Child:

```javascript
class Dog extends Animal {

}
```

---

Create:

```javascript
const dog =
 new Dog("Buddy");
```

Error.

Why?

Because child class must call parent constructor.

---

# super()

Use:

```javascript
super()
```

to call parent constructor.

---

Correct:

```javascript
class Dog extends Animal {

   constructor(name) {

      super(name);

   }

}
```

---

Now:

```javascript
const dog =
 new Dog("Buddy");

console.log(dog.name);
```

Output:

```text
Buddy
```

---

# What Does super() Do?

Parent:

```javascript
constructor(name) {
   this.name = name;
}
```

---

Child:

```javascript
super(name);
```

calls:

```javascript
Animal constructor
```

---

Visual:

```text
Dog Constructor
      │
      ▼
 super(name)
      │
      ▼
Animal Constructor
      │
      ▼
this.name = name
```

---

# Child-Specific Properties

Parent:

```javascript
class Animal {

   constructor(name) {
      this.name = name;
   }

}
```

---

Child:

```javascript
class Dog extends Animal {

   constructor(name, breed) {

      super(name);

      this.breed = breed;
   }

}
```

---

Create:

```javascript
const dog =
 new Dog(
   "Buddy",
   "Labrador"
 );
```

---

Output:

```javascript
console.log(dog);
```

```javascript
{
  name:"Buddy",
  breed:"Labrador"
}
```

---

# Method Overriding

One of the most important interview topics.

---

Parent:

```javascript
class Animal {

   speak() {
      console.log("Animal Sound");
   }

}
```

---

Child:

```javascript
class Dog extends Animal {

   speak() {
      console.log("Bark");
   }

}
```

---

Create:

```javascript
const dog =
 new Dog();

dog.speak();
```

Output:

```text
Bark
```

Parent method replaced.

This is called:

# Method Overriding

---

# Visual

Parent:

```javascript
speak()
```

↓

```text
Animal Sound
```

---

Child overrides:

```javascript
speak()
```

↓

```text
Bark
```

---

# Calling Parent Method

Sometimes we want:

```text
Parent Behavior
+
Child Behavior
```

Use:

```javascript
super.methodName()
```

---

Example:

```javascript
class Animal {

   speak() {
      console.log("Animal Sound");
   }

}
```

---

```javascript
class Dog extends Animal {

   speak() {

      super.speak();

      console.log("Bark");

   }

}
```

---

Output:

```javascript
new Dog().speak();
```

```text
Animal Sound

Bark
```

---

# What is Polymorphism?

Polymorphism means:

> Same method name, different behavior.

---

Parent:

```javascript
class Animal {

   speak() {
      console.log("Animal Sound");
   }

}
```

---

Child 1

```javascript
class Dog extends Animal {

   speak() {
      console.log("Bark");
   }

}
```

---

Child 2

```javascript
class Cat extends Animal {

   speak() {
      console.log("Meow");
   }

}
```

---

Child 3

```javascript
class Cow extends Animal {

   speak() {
      console.log("Moo");
   }

}
```

---

Usage:

```javascript
const animals = [
   new Dog(),
   new Cat(),
   new Cow()
];
```

---

```javascript
animals.forEach(
 animal => animal.speak()
);
```

Output:

```text
Bark

Meow

Moo
```

Same:

```javascript
speak()
```

Different behavior.

That is Polymorphism.

---

# Real World Analogy

Button:

```text
Click Button
```

Different buttons perform different actions.

Same method:

```text
click()
```

Different behavior.

Polymorphism.

---

# Real React Native Example

Suppose:

```javascript
class APIService {

   fetchData() {
      console.log("Generic Fetch");
   }

}
```

---

User API:

```javascript
class UserAPI
extends APIService {

   fetchData() {
      console.log("Fetching Users");
   }

}
```

---

Post API:

```javascript
class PostAPI
extends APIService {

   fetchData() {
      console.log("Fetching Posts");
   }

}
```

---

Usage:

```javascript
const services = [
   new UserAPI(),
   new PostAPI()
];
```

---

```javascript
services.forEach(
 service => service.fetchData()
);
```

Output:

```text
Fetching Users

Fetching Posts
```

Polymorphism.

---

# instanceof

Check object type.

---

```javascript
const dog =
 new Dog();
```

---

```javascript
console.log(
 dog instanceof Dog
);
```

Output:

```text
true
```

---

```javascript
console.log(
 dog instanceof Animal
);
```

Output:

```text
true
```

Because Dog inherits Animal.

---

Visual:

```text
Dog
  ↑
  │
Animal
```

Dog belongs to both.

---

# Prototype Chain (Interview Topic)

JavaScript inheritance works using prototypes.

You don't need to memorize internals yet.

Mental model:

```text
Dog
 │
 ▼
Animal
 │
 ▼
Object
 │
 ▼
null
```

When:

```javascript
dog.eat()
```

JavaScript searches:

```text
Dog?
  NO

Animal?
  YES
```

Found.

Execute.

---

# Multilevel Inheritance

Possible.

```javascript
class Animal {

}
```

---

```javascript
class Mammal
extends Animal {

}
```

---

```javascript
class Dog
extends Mammal {

}
```

---

Visual:

```text
Animal
   ↑
Mammal
   ↑
Dog
```

Dog inherits everything.

---

# Interview Questions

---

## Question 1

What is inheritance?

Answer:

```text
Ability of child class
to acquire properties
and methods of parent class.
```

---

## Question 2

Keyword used?

Answer:

```javascript
extends
```

---

## Question 3

Purpose of super()?

Answer:

```text
Calls parent constructor
or parent method.
```

---

## Question 4

What is method overriding?

Answer:

```text
Child class provides its own
implementation of parent method.
```

---

## Question 5

What is polymorphism?

Answer:

```text
Same interface,
different behavior.
```

---

## Question 6

Output?

```javascript
class Animal {

   speak() {
      console.log("Animal");
   }

}

class Dog
extends Animal {

   speak() {
      console.log("Dog");
   }

}

new Dog().speak();
```

Output:

```text
Dog
```

---

# Common Mistakes

---

## Forgetting super()

Wrong:

```javascript
class Dog
extends Animal {

   constructor(name) {

      this.name = name;

   }

}
```

Error.

---

Correct:

```javascript
constructor(name){

   super(name);

}
```

---

## Expecting Parent Method Automatically

If child overrides:

```javascript
speak()
```

parent version won't run.

Need:

```javascript
super.speak();
```

---

# Practice Exercises

### Exercise 1

Create:

```javascript
Animal
```

with:

```javascript
eat()
```

---

### Exercise 2

Create:

```javascript
Dog
extends Animal
```

with:

```javascript
bark()
```

---

### Exercise 3

Add constructor:

```javascript
name
breed
```

using:

```javascript
super()
```

---

### Exercise 4

Override:

```javascript
speak()
```

---

### Exercise 5

Create:

```javascript
Cat
```

and

```javascript
Dog
```

both overriding:

```javascript
speak()
```

Demonstrate polymorphism.

---

# Mental Model Cheat Sheet

| Concept         | Meaning                         |
| --------------- | ------------------------------- |
| extends         | Inherit from parent             |
| super()         | Call parent constructor         |
| super.method()  | Call parent method              |
| Overriding      | Replace parent method           |
| Polymorphism    | Same method, different behavior |
| instanceof      | Check type                      |
| Prototype Chain | How JS inheritance works        |

---

# React Native Reality

Modern React Native code rarely uses inheritance directly.

Instead you'll often see:

```javascript
Custom Hooks
Composition
Services
Utility Functions
```

over inheritance.

However, understanding inheritance is still valuable because:

* Native iOS/Android code uses it extensively.
* Legacy React Native projects use class components.
* Many third-party libraries are class-based.
* Interviews frequently cover inheritance and polymorphism.

---



