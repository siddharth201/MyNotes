
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
