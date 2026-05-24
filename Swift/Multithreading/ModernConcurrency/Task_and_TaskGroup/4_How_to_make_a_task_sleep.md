Swift’s **`Task`** struct has a static **`sleep()`** method that will cause the current task to be suspended for a set period of time. You need to call **`Task.sleep()`** using **`await`** as it will cause the task to be suspended, and you also need to use try because sleep() will wake and throw an error if the task is cancelled.

For example, this will make the current task sleep for at least 3 seconds:

```swift
try await Task.sleep(for: .seconds(3))
``` 

Calling **`Task.sleep()`** will make the current task sleep for at least the amount of time you ask, not exactly the time you ask. There is a little drift involved because the system might be busy doing other work when the sleep ends, but you are at least guaranteed it won’t end before your time has elapsed.

If you're happy to add a little extra drift, you can add a tolerance parameter that allows the task to sleep for longer if needed. So, this might sleep for three seconds up to a total of four seconds:

```swift
try await Task.sleep(for: .seconds(3), tolerance: .seconds(1))
```  

Swift's **`Task.sleep()`** method automatically checks for cancellation, meaning that if you cancel a sleeping task it will be woken and throw a **`CancellationError`** for you to catch.

**Tip:** Unlike making a thread sleep, **`Task.sleep()`** does not block the underlying thread, allowing it pick up work from elsewhere if needed.
