
### PART 3 — STRUCTURED CONCURRENCY

Now we move from:

> "How do I run async work?"

to:

>"How do I organize multiple pieces of async work?"

---

### Q14. What is Structured Concurrency?

**Interview-friendly definition**

> Structured concurrency organizes asynchronous tasks into a hierarchy so that child tasks are tied to the lifetime of their parent and are completed before the structured scope finishes.

Apple describes `async let` and `task groups` as structured concurrency mechanisms; child tasks don't outlive their parent scope

**Acronym**

### L-C-C

**L**ifetime  
**C**hild relationship  
**C**ancellation

Think:

```text
Parent Task
    │
    ├── Child
    ├── Child
    └── Child
```

The children belong to the parent.

---
