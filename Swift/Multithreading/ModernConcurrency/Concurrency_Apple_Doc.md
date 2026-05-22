
Swift has built-in support for writing `asynchronous` and `parallel code` in a structured way.  

> **`Asynchronous` code can be suspended and resumed later, although only one piece of the program executes at a time.</br>
 Suspending and resuming code in your program lets it continue to make progress on short-term operations like updating its UI while continuing to work on long-running operations like fetching data over the network or parsing files.**  
 
 > **`Parallel` code means multiple pieces of code run simultaneously — for example, a computer with a four-core processor can run four pieces of code at the same time, with each core carrying out one of the tasks. A program that uses parallel and asynchronous code carries out multiple operations at a time, and it suspends operations that are waiting for an external system.**  
 
 ## Problems with Cocurrent Code
 The additional scheduling flexibility from parallel or asynchronous code also comes with a cost of increased complexity. When you write concurrent code, you don’t know ahead of time what code will run at the same time, and you might not always know the order that code will run. </br>A common problem in concurrent code happens when multiple pieces of code try to access some piece of shared mutable state — this is known as a data race. When you use the language-level support for concurrency, Swift detects and prevents data races, and most data races produce a compile-time error. Some data races can’t be detected until your code is running; these data races terminate code execution.
