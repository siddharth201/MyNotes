
Correct!

Exactly. Swift does not create a new thread for every Task.

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

Next interview question:

If two Tasks execute concurrently, can they execute on the same thread?
