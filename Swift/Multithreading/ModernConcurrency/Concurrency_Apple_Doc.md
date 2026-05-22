
Swift has built-in support for writing `asynchronous` and `parallel code` in a structured way.  

> **`Asynchronous` code can be suspended and resumed later, although only one piece of the program executes at a time.</br>
 Suspending and resuming code in your program lets it continue to make progress on short-term operations like updating its UI while continuing to work on long-running operations like fetching data over the network or parsing files.**  
 
 > **`Parallel` code means multiple pieces of code run simultaneously — for example, a computer with a four-core processor can run four pieces of code at the same time, with each core carrying out one of the tasks. A program that uses parallel and asynchronous code carries out multiple operations at a time, and it suspends operations that are waiting for an external system.**   
  
 
 ## Problems with Cocurrent Code
 The additional scheduling flexibility from parallel or asynchronous code also comes with a cost of increased complexity. When you write concurrent code, you don’t know ahead of time what code will run at the same time, and you might not always know the order that code will run. </br>A common problem in concurrent code happens when multiple pieces of code try to access some piece of shared mutable state — this is known as a data race. When you use the language-level support for concurrency, Swift detects and prevents data races, and most data races produce a compile-time error. Some data races can’t be detected until your code is running; these data races terminate code execution.  
 
 > **Note**</br>If you’ve written concurrent code before, you might be used to working with threads. The concurrency model in Swift is built on top of threads, but you don’t interact with them directly. An asynchronous function in Swift can give up the thread that it’s running on, which lets another asynchronous function run on that thread while the first function is blocked. When an asynchronous function resumes, Swift doesn’t make any guarantee about which thread that function will run on.  
   
 
 ## Defining and Calling Asynchronous Functions
 An asynchronous function or asynchronous method is a special kind of function or method that can be suspended while it’s partway through execution. This is in contrast to ordinary, synchronous functions and methods, which either run to completion, throw an error, or never return. An asynchronous function or method still does one of those three things, but it can also pause in the middle when it’s waiting for something. Inside the body of an asynchronous function or method, you mark each of these places where execution can be suspended.

To indicate that a function or method is asynchronous, you write the `async` keyword in its declaration after its parameters, similar to how you use throws to mark a throwing function. If the function or method returns a value, you write async before the return arrow (->). For example, here’s how you might fetch the names of photos in a gallery:  

```swift
func listPhotos(inGallery name: String) async -> [String] {
    let result = // ... some asynchronous networking code ...
    return result
}
```  

For a function or method that’s both asynchronous and throwing, you write async before throws.  
  

