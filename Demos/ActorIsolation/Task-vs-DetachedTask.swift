import Foundation
import Dispatch

// Global helper: dynamically inspects if current execution is on the Main queue/actor
func isCurrentlyOnMainActor() -> Bool {
    // In GCD terms, MainActor work executes on DispatchQueue.main
    Thread.isMainThread // Valid in top-level non-async helper
}

@MainActor
class ViewModel {
    
    func runExample() async {
        print("1. Called from @MainActor? ->", isCurrentlyOnMainActor())
        
        // MARK: - Regular Task
        // Inherits @MainActor context
        Task {
            let onMain = isCurrentlyOnMainActor()
            print("2. Task (Regular): @MainActor? ->", onMain)
        }
        
        // MARK: - Task.detached
        // Completely non-isolated; runs on global cooperative pool
        Task.detached {
            // Computed dynamically at runtime inside the detached task
            let onMain = isCurrentlyOnMainActor()
            print("3. Task.detached: @MainActor? ->", onMain)
        }
    }
}

// Top-level script execution
let vm = await ViewModel()
await vm.runExample()

// Allow background tasks to finish before process exits
try? await Task.sleep(nanoseconds: 500_000_000)
