
## Q. Does Swift create a new thread for every Task?

Swift does not create a new thread for every Task.

### Interview-friendly answer

> A Task is a unit of asynchronous work, not a thread. Swift Concurrency manages task execution using its runtime and executors. Multiple tasks can share underlying threads, and a suspended task doesn't need to occupy a thread while waiting.

### Understand with an example

```
Task {
    print("Task 1 started")
    try await Task.sleep(for: .seconds(2))
    print("Task 1 finished")
}

Task {
    print("Task 2 started")
    try await Task.sleep(for: .seconds(2))
    print("Task 2 finished")
}
```

Here:

- Two separate Tasks are created.
- Both can make progress concurrently.
- Neither requires its own dedicated thread.
- While sleeping, both tasks are suspended.

### Remember this distinction

| Concept  | Meaning                                           |
| -------- | ------------------------------------------------- |
| Task     | Unit of asynchronous work                         |
| Thread   | OS-level execution resource                       |
| Executor | Determines where/how actor-isolated work executes |


---

## Q. If two Tasks execute concurrently, can they execute on the same thread?

Yes. Two or more Tasks can execute on the same thread at different times.

### Example

```
Task {
    print("Task 1")
    await Task.yield()
    print("Task 1 resumed")
}

Task {
    print("Task 2")
    await Task.yield()
    print("Task 2 resumed")
}
```

Swift's concurrency runtime decides when and where tasks execute.

Important distinctions:

- Multiple Tasks can share a thread.
- A single Task can resume on a different thread after suspension.
- Tasks can also execute in parallel on different threads.

### Remember: T-S-E

- Task = Unit of work.
- Thread = Execution resource.
- Executor = Manages where actor-isolated work executes.

---  

## Q. If two Tasks execute concurrently, can they execute on the same thread?

Correct!

Yes. Two or more Tasks can execute on the same thread at different times.

### Example

```
Task {
    print("Task 1")
    await Task.yield()
    print("Task 1 resumed")
}

Task {
    print("Task 2")
    await Task.yield()
    print("Task 2 resumed")
}
```

Swift's concurrency runtime decides when and where tasks execute.

Important distinctions:

- Multiple Tasks can share a thread.
- A single Task can resume on a different thread after suspension.
- Tasks can also execute in parallel on different threads.

### Remember: T-S-E

- Task = Unit of work.
- Thread = Execution resource.
- Executor = Manages where actor-isolated work executes.

### Next interview question

Suppose Task A is executing on Thread 1.

It reaches:

```
await fetchUser()
```



---  

## Q. While Task A is suspended, can Thread 1 execute Task B? Why?
