
[Chat-GPT Link](https://chatgpt.com/s/t_6ae1627309a48191aafff032965d0fee)

We will follow this exact order:

                    MODERN CONCURRENCY
                            │
          ┌─────────────────┼─────────────────┐
          ↓                 ↓                 ↓
     ASYNC WORK         STRUCTURE          SAFETY
          │                 │                 │
    async / await      async let          Actor
    Task               TaskGroup          @MainActor
    Task.detached      Child Tasks        Global Actor
    Continuation       AsyncSequence      Sendable
    Cancellation       AsyncStream        @Sendable
                                        Data Isolation
                            │
                            ↓
                       REAL WORLD iOS
                            │
                  API → ViewModel → SwiftUI
