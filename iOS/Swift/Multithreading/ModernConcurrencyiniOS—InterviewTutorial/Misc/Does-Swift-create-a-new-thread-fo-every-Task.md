

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


