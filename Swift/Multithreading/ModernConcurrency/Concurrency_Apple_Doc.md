
Swift has built-in support for writing `asynchronous` and `parallel code` in a structured way.  

> `Asynchronous` code can be suspended and resumed later, although only one piece of the program executes at a time.</br>
 Suspending and resuming code in your program lets it continue to make progress on short-term operations like updating its UI while continuing to work on long-running operations like fetching data over the network or parsing files.  
 
 > `Parallel` code means multiple pieces of code run simultaneously — for example, a computer with a four-core processor can run four pieces of code at the same time, with each core carrying out one of the tasks. A program that uses parallel and asynchronous code carries out multiple operations at a time, and it suspends operations that are waiting for an external system.   
  
 
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
  
When calling an asynchronous method, execution suspends until that method returns. You write await in front of the call to mark the possible suspension point. This is like writing try when calling a throwing function, to mark the possible change to the program’s flow if there’s an error. Inside an asynchronous method, the flow of execution can be suspended only when you call another asynchronous method — suspension is never implicit or preemptive — which means every possible suspension point is marked with await. Marking all of the possible suspension points in your code helps make concurrent code easier to read and understand.

For example, the code below fetches the names of all the pictures in a gallery and then shows the first picture:  

```swift
let photoNames = await listPhotos(inGallery: "Summer Vacation")
let sortedNames = photoNames.sorted()
let name = sortedNames[0]
let photo = await downloadPhoto(named: name)
show(photo)
```  

Because the listPhotos(inGallery:) and downloadPhoto(named:) functions both need to make network requests, they could take a relatively long time to complete. Making them both asynchronous by writing async before the return arrow lets the rest of the app’s code keep running while this code waits for the picture to be ready.

To understand the concurrent nature of the example above, here’s one possible order of execution:

1. The code starts running from the first line and runs up to the first await. It calls the listPhotos(inGallery:) function and suspends execution while it waits for that function to return.

2. While this code’s execution is suspended, some other concurrent code in the same program runs. For example, maybe a long-running background task continues updating a list of new photo galleries. That code also runs until the next suspension point, marked by await, or until it completes.

3. After listPhotos(inGallery:) returns, this code continues execution starting at that point. It assigns the value that was returned to photoNames.

4. The lines that define sortedNames and name are regular, synchronous code. Because nothing is marked await on these lines, there aren’t any possible suspension points.

5. The next await marks the call to the downloadPhoto(named:) function. This code pauses execution again until that function returns, giving other concurrent code an opportunity to run.

6. After downloadPhoto(named:) returns, its return value is assigned to photo and then passed as an argument when calling show(_:).  

The possible suspension points in your code marked with await indicate that the current piece of code might pause execution while waiting for the asynchronous function or method to return. This is also called yielding the thread because, behind the scenes, Swift suspends the execution of your code on the current thread and runs some other code on that thread instead. Because code with await needs to be able to suspend execution, only certain places in your program can call asynchronous functions or methods:

* Code in the body of an asynchronous function, method, or property.

* Code in the static main() method of a structure, class, or enumeration that’s marked with @main.

* Code in an unstructured child task  

The Task.sleep(for:tolerance:clock:) method is useful when writing simple code to learn how concurrency works. This method suspends the current task for at least the given amount of time. Here’s a version of the listPhotos(inGallery:) function that uses sleep(for:tolerance:clock:) to simulate waiting for a network operation:  

```swift
func listPhotos(inGallery name: String) async throws -> [String] {
    try await Task.sleep(for: .seconds(2))
    return ["IMG001", "IMG99", "IMG0404"]
}
```  

The version of listPhotos(inGallery:) in the code above is both asynchronous and throwing, because the call to Task.sleep(until:tolerance:clock:) can throw an error. When you call this version of listPhotos(inGallery:), you write both try and await:  

```swift
let photos = try await listPhotos(inGallery: "A Rainy Weekend")
```  

Asynchronous functions have some similarities to throwing functions: When you define an asynchronous or throwing function, you mark it with async or throws, and you mark calls to that function with await or try. An asynchronous function can call another asynchronous function, just like a throwing function can call another throwing function.

However, there’s a very important difference. You can wrap throwing code in a do-catch block to handle errors, or use Result to store the error for code elsewhere to handle it. These approaches let you call throwing functions from nonthrowing code. For example:  

```swift
func availableRainyWeekendPhotos() -> Result<[String], Error> {
    return Result {
        try listDownloadedPhotos(inGallery: "A Rainy Weekend")
    }
}
```  

In contrast, there’s no safe way to wrap asynchronous code so you can call it from synchronous code and wait for the result. The Swift standard library intentionally omits this unsafe functionality — trying to implement it yourself can lead to problems like subtle races, threading issues, and deadlocks. </br</br>>When adding concurrent code to an existing project, work from the top down. Specifically, start by converting the top-most layer of code to use concurrency, and then start converting the functions and methods that it calls, working through the project’s architecture one layer at a time. There’s no way to take a bottom-up approach, because synchronous code can’t ever call asynchronous code.
