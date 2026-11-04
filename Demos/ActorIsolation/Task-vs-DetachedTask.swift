
import Foundation

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
    }
}
