**DispatchSemaphore regulates access to shared resources across concurrent threads in Swift.** It uses a counter to limit simultaneous operations, preventing race conditions by blocking threads when the count hits zero. [devindeep](https://devindeep.com/dispatch-semaphore-examples-in-swift/)

## Key Methods
- `wait()`: Decrements the counter; blocks if zero until signaled.
- `signal()`: Increments the counter, unblocking one waiting thread (FIFO order).
- Initial `value`: Sets available "permits" (e.g., 1 for mutex-like single access).

Unlike barriers (queue-specific), semaphores work across any threads, making them versatile for network requests or shared data. Use cautiously to avoid deadlocks. [mobikul](https://mobikul.com/dispatchsemaphore-in-swift/)

## Example: Limiting Concurrent Downloads
```swift
    func regulateAccess() {
        let queue = DispatchQueue.global(qos: .utility)
        let semaphore = DispatchSemaphore(value: 2) // allow only 2 tasks at a time
        
        let urls = ["url1", "url2", "url3", "url4", "url5"]
        
        for url in urls {
            queue.async {
                
                semaphore.wait() // 🔒 acquire permit
                
                print("Start \(url)")
                
                // Simulate API call
                sleep(2)
                
                print("End \(url)")
                
                semaphore.signal() // 🔓 release permit
            }
        }
    }
```
This ensures only 2 downloads run simultaneously, throttling resource use while allowing parallelism. Output shows staggered execution. [devindeep](https://devindeep.com/dispatch-semaphore-examples-in-swift/)
