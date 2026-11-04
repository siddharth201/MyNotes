cat << 'EOF' > Task-vs-DetachedTask1.swift
import Foundation

nonisolated func isMain() -> Bool {
    Thread.isMainThread
}

@MainActor
class ViewModel {
    func runExample() async {
        print("1. Called from Main Thread? ->", isMain())

        Task {
            print("2. Task (Regular): Main Thread? ->", isMain())
        }

        Task.detached {
            print("3. Task.detached: Main Thread? ->", isMain())
        }
    }
}

@main
struct App {
    static func main() async {
        let vm = ViewModel()
        await vm.runExample()
        try? await Task.sleep(nanoseconds: 500_000_000)
    }
}
EOF
