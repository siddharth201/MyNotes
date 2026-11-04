
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

/**
 
 #The Problem with Classes: Data Races

 A class in Swift is a reference type, meaning multiple parts of your program can point to and modify the exact same instance in memory at the same time.
 
 When you run 1,000 concurrent tasks on a class, they all attempt to execute count += 1 simultaneously. Under the hood, count += 1 is not a single action; it consists of three separate steps:
 
 1. Read the current value of count from memory.
 2. Modify the value by adding 1.
 3. Write the new value back to memory.
 
 Because the class provides no synchronization, Thread A and Thread B might both read the number 45 at the exact same split second. They both add 1 to get 46, and both write 46 back to memory. Instead of the counter going up by two, it only goes up by one. This loss of data is called a Data Race or Race Condition.

 #How Actors Solve This: Actor Isolation

 An actor is a conceptual "box" around your data. It looks and behaves almost exactly like a class (it is also a reference type), but with one crucial superpower: it only allows one thread to access its internal state at any given moment.
 Here is how it fixes the issue:
 1. Serialized Execution: Think of an actor as a bank counter with a single, orderly queue. Even if 1,000 tasks scream to increment the counter at the same time, the actor forces them to form a single-file line. It processes them one by one.
 2. The await Keyword: Because tasks have to wait their turn to enter the actor, Swift forces you to use the await keyword whenever you call an actor's method (e.g., await counter.increment()). This explicitly tells the system: "This call might pause for a microsecond while waiting for the thread ahead of me to finish."
 3. Compile-Time Safety: If you try to modify an actor’s variable directly from the outside without proper synchronization, the Swift compiler will refuse to build your app. It catches thread-safety bugs before your code ever runs.
 Would you like to look at a third approach, such as using Locks (NSLock) or the newer OSAllocatedUnfairLock, to see how iOS developers traditionally solved this problem before Actors were introduced?

 */
