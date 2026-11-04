
import Foundation

// MARK: - Unsafe Class Counter
final class UnsafeCounter {
    var count: Int = 0
    func increment() {
        count += 1
    }
}

// MARK: - Safe Actor Counter
actor SafeCounter {
    var count: Int = 0
    func increment() {
        count += 1
    }
}

// MARK: - Demonstration Functions
func runUnsafeClassExample() async {
    let counter = UnsafeCounter()
    await withTaskGroup(of: Void.self) { group in
        for _ in 0..<1000 {
            group.addTask { counter.increment() }
        }
    }
    print("\n--- Unsafe Class Result ---")
    print("Expected count: 1000")
    print("Actual count:   \(counter.count) (Likely incorrect)")
}

func runSafeActorExample() async {
    let counter = SafeCounter()
    await withTaskGroup(of: Void.self) { group in
        for _ in 0..<1000 {
            group.addTask { await counter.increment() } // 'await' required for actor isolation
        }
    }
    let finalCount = await counter.count
    print("\n--- Safe Actor Result ---")
    print("Expected count: 1000")
    print("Actual count:   \(finalCount)  (Always guaranteed!)")
}

// MARK: - Main Entry Point
@main
struct App {
    static func main() async {
        print("Select which counter example to run:")
        print("1. Unsafe Counter (Class)")
        print("2. Safe Counter (Actor)")
        print("Enter choice (1 or 2): ", terminator: "")
        
        guard let choice = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            print("Invalid input.")
            return
        }
        
        switch choice {
        case "1":
            await runUnsafeClassExample()
        case "2":
            await runSafeActorExample()
        default:
            print("Invalid choice. Please run the script again and type 1 or 2.")
        }
    }
}

