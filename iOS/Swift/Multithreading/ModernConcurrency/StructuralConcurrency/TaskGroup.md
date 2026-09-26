
In Swift, a TaskGroup is a tool used to manage structural concurrency when you need to run a dynamic number of tasks in parallel and wait for all of them to finish.
Unlike async let, which is great for a fixed, known number of concurrent tasks, a TaskGroup allows you to spawn tasks dynamically (like inside a loop).
## Key Concepts

* Concurrency: All tasks added to the group run at the exact same time.
* Automatic Cleanup: The group waits for all its child tasks to finish before it exits.
* Type Safety: All tasks in a specific group must return data of the same type.

## Momorize

To memorize that exact definition, use the acronym D.P.S.W. (think of it like an app or a gaming term, like "Deep Sweep"):

* D – Dynamic: Runs a dynamic number of tasks.
* P – Parallel: Runs them all in parallel (at the exact same time).
* S – Structural: Manages structural concurrency (safely contained).
* W – Wait: Forces the app to wait for all of them to finish.

## 💡 The Mind Trigger
Just remember: When you have a massive, unpredictable workload, you need to make a D.P.S.W. (Deep Sweep) to clear it all out at once!

## Q. If I have to download multiple images than I have to use TaskGroup?


