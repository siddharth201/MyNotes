
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

## Q. Explain Swift's concurrency runtime in simple way

#### Swift Concurrency Runtime — Simple Explanation

Let's understand it step by step.

First, remember three important terms:

1. Compiler — Checks your Swift code and catches concurrency-related mistakes.
2. Runtime — Manages the execution of concurrency features while your app is running.
3. Executor — Determines where and how a task's work gets executed.

## 1. What is Swift Concurrency Runtime?

Interview-friendly definition:

Swift Concurrency Runtime is the system that manages the execution of asynchronous tasks, coordinates their scheduling and execution, handles task suspension and resumption, and supports actor isolation at runtime.

Hinglish:

Swift Concurrency Runtime ek system hai jo app run hone ke time asynchronous tasks ko manage karta hai. Ye tasks ki scheduling, execution, suspension aur resumption coordinate karta hai aur Actors ke through shared data ko safely access karne mein help karta hai.

## 2. Understand it with a simple example

Suppose you write:

```
func fetchUser() async {
    print("Fetching user...")
}

func fetchOrders() async {
    print("Fetching orders...")
}

Task {
    await fetchUser()
    await fetchOrders()
}
```

What happens?

Your Swift Code

Task, async/await, actors

Swift Concurrency Runtime

Manages task lifecycle and execution

Scheduling

Coordinates when work runs

Suspension

Handles waiting and resumption

Executors

Provide execution context

Actor Isolation

Coordinates isolated access

Execution on available threads

Tasks are not permanently attached to individual threads.

The runtime coordinates the work. It doesn't mean that every Task gets its own thread.

## 3. What does the runtime actually do?

Let's understand four responsibilities.

A. Task scheduling

When you create a `Task`, the runtime manages when its work gets scheduled for execution.

B. Suspension and resumption

Consider:

```
Task {
    print("Start")

    let user = await fetchUser()

    print("User received")
}
```

When `fetchUser()` suspends, the current task can pause without blocking its underlying thread. Once the awaited operation completes, the task becomes eligible to resume.

The runtime coordinates this process.

C. Executor management

An executor provides the execution context for a task's work.

For example:

- `MainActor` provides main-actor isolation, commonly used for UI-related state.
- A nonisolated task can execute through the runtime's general execution machinery.

Important: An executor is not necessarily a dedicated thread.

D. Actor isolation

Consider:

```
actor BankAccount {
    private var balance = 1000

    func deposit(amount: Int) {
        balance += amount
    }
}
```

If multiple tasks try to modify the account, actor isolation ensures that actor-isolated synchronous operations don't access its mutable state simultaneously.

The runtime and executor machinery support this isolation.

## 4. Runtime vs Compiler vs GCD

| Component                 | Main responsibility                                      |
| ------------------------- | -------------------------------------------------------- |
| Swift Compiler            | Checks concurrency rules and generates code              |
| Swift Concurrency Runtime | Manages task execution and lifecycle                     |
| Executor                  | Provides an execution context for task work              |
| GCD                       | Provides lower-level dispatch queues and scheduling APIs |

One important distinction: Swift Concurrency uses compiler support, runtime support, and standard library APIs together. It is not a replacement for the operating system's threading system.

## 5. Remember this for interviews

Quick revision

- Compiler: Checks the rules.
- Runtime: Manages the tasks.
- Executor: Provides the execution context.
- Thread: Actually executes instructions.

A simple analogy:

Think of a restaurant:

- Compiler = Checks whether the order is valid.
- Runtime = Restaurant management system.
- Executor = Assigns work to an available kitchen station.
- Thread = The worker actually performing the work.
- Task = The order being processed.

The analogy is not exact, but it helps remember the responsibilities.

### Interview check

Suppose a Task starts executing on Thread 1 and reaches an `await` where it must wait for a network response.

Can Thread 1 execute another Task while the first Task is suspended?

Think about it before answering.

## Q. While Task A is suspended, can Thread 1 execute Task B? Why?

Correct!

Yes. Thread 1 can execute another Task while the first Task is suspended at `await`.

Let's understand what happens:

```
Task {
    print("Task A - Started")

    let user = await fetchUser()

    print("Task A - Resumed")
}

Task {
    print("Task B - Started")
}
```

Imagine this execution:

Thread 1 — Execution timeline

1. Task A starts

   Prints "Task A - Started"
2. Task A reaches await

   Task A suspends while waiting for fetchUser(). Thread is not blocked.
3. Task B executes

   Thread 1 is available to execute other work.
4. Task A resumes

   After fetchUser() completes, Task A continues. It may resume on a different thread.

### Important interview point

Suspending a Task is not the same as blocking a Thread.

- Task suspension: The task pauses; the thread can do other work.
- Thread blocking: The thread itself cannot execute other work until unblocked.

### Next interview question

When Task A resumes after `await`, must it resume on the same thread where it was suspended?

A. Yes, always.

B. No, it may resume on a different thread.

C. Only if it uses `Task.detached`.
