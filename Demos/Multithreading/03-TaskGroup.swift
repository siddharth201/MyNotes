
func test() async {
    print("Running")
}

@main
struct TaskGroup {
    static func main() {
        await test()
    }
}
