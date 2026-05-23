
Using async/await in Swift allows us to write asynchronous code that is easy to read and understand, but by itself it doesn’t enable us to run anything concurrently – even with several CPU cores working hard, async/await code would still execute sequentially.

To create actual concurrency – to provide the ability for multiple pieces of work to run at the same time – Swift provides us with two specific types for constructing and managing concurrency in a way that makes it easier to use: **`Task`** and **`TaskGroup`**.  

[Explaination](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/Task_Explain_1.md)  

## Which you choose?
Which you choose – **Task** or **TaskGroup** – depends on the goal of your work: if you want one or two independent pieces of work to start, then Task is the right choice. If you want to split up one job into several concurrent operations then TaskGroup is a better fit. Task groups work best when their individual operations return exactly the same kind of data, but with a little extra effort you can coerce them into supporting heterogenous data types.  

Although you might not realize it, you’re using tasks every time you write any async code in Swift. You see, all async functions run as part of a task whether or not we explicitly ask for it to happen. Even **using async let is syntactic sugar for creating a task then waiting for its result – special syntax that makes a particular piece of code easier to write.** This is why if you use multiple sequential async let calls they will all start executing immediately while the rest of your code continues.
