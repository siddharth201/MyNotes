
import Foundation

// Synchronous helper to safely read Thread.isMainThread without compiler warnings
nonisolated func isMain() -> Bool {
    Thread.isMainThread
}

@MainActor
class ViewModel {
    func runExample() async {
        print("1. Called from Main Thread? ->", isMain())

        // MARK: - Regular Task
        // Inherits the @MainActor context because ViewModel is @MainActor
        Task {
            print("2. Task (Regular): Main Thread? ->", isMain())
        }

        // MARK: - Task.detached
        // Breaks away from @MainActor and runs independently on background pool
        Task.detached {
            print("3. Task.detached: Main Thread? ->", isMain())
        }
    }
}

// Driver code to execute the async demonstration
@main
struct App {
    static func main() async {
        let vm = ViewModel()
        await vm.runExample()
        
        // Brief sleep so background tasks complete before process exits
        try? await Task.sleep(nanoseconds: 500_000_000)
    }
}
