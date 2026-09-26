
In Swift, a TaskGroup is a tool used to manage structural concurrency when you need to run a dynamic number of tasks in parallel and wait for all of them to finish.
Unlike async let, which is great for a fixed, known number of concurrent tasks, a TaskGroup allows you to spawn tasks dynamically (like inside a loop).
## Key Concepts

* Concurrency: All tasks added to the group run at the exact same time.
* Automatic Cleanup: The group waits for all its child tasks to finish before it exits.
* Type Safety: All tasks in a specific group must return data of the same type.

