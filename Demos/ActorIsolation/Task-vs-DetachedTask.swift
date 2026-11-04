
import Foundation

class ViewModel {
    
    func runExample() async {
        
        print("1. Called from Main Thread? ->", Thread.isMainThread)
        
        // MARK: - Regular Task
        // Inherits the @MainActor context because ViewModel is @MainActor
        
        Task {
            
        }
    }
}
