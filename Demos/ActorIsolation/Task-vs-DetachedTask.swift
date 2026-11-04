
import Foundation

@MainActor
class ViewModel {
    
    func runExample() async {
        
        print("1. Called from Main Thread? ->", Thread.isMainThread)
        
        // MARK: - Regular Task
        // Inherits the @MainActor context because ViewModel is @MainActor
        
        Task {
            print("2. Task (Regular): Main Thread? ->", Thread.isMainThread)
            // Stays on the main thread; safe to update UI directly,
            // but heavy work here will freeze your interface.
        }
        
        // MARK: - Task.detached
        // Breaks away from @MainActor and runs independently in the background
        Task.detached {
            print("3. Task.detached: Main Thread? ->", Thread.isMainThread)
            // Runs on a background thread; ideal for heavy computation
            // like parsing huge files or compressing images.
        }
    }
}

// Driver code to execute the async demonstration
@main
struct App {
    
}
