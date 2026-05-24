
Swift’s **`Task`** struct lets us start running some work immediately, and optionally wait for the result to be returned. And it is optional: sometimes you don’t care about the result of the task, or sometimes the task automatically updates some external value when it completes, so you can just use them as “fire and forget” operations if you need to. This makes them a great way to run async code from a synchronous function.  


