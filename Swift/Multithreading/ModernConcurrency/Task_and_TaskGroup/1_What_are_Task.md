
Using async/await in Swift allows us to write asynchronous code that is easy to read and understand, but by itself it doesn’t enable us to run anything concurrently – even with several CPU cores working hard, async/await code would still execute sequentially.

To create actual concurrency – to provide the ability for multiple pieces of work to run at the same time – Swift provides us with two specific types for constructing and managing concurrency in a way that makes it easier to use: `Task` and `TaskGroup`.  

[Explaination](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/Task_Explain_1.md)  

## Which you choose?
