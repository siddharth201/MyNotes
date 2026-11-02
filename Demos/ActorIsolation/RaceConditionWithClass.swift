
import Foundation

// MARK: - Problematic Class
final class UnsafeCounter {
    var count: Int = 0

    func increment() {
        // Read, modify, write is not atomic across multiple threads
        count += 1
    }
}

func runUnsafeClassExample() async {
    let counter = UnsafeCounter()

    // Run 1,000 concurrent tasks incrementing the counter simultaneously
    await withTaskGroup(of: Void.self) { group in
        for _ in 0..<1000 {
            group.addTask {
                counter.increment()
            }
        }
    }

    print("--- Class Result ---")
    print("Expected count: 1000")
    print("Actual count:   \(counter.count)") // Frequently prints a number less than 1000 (e.g., 942, 988)
}

@main
struct Main {
    static func main() async {
        await runUnsafeClassExample()
    }
}
