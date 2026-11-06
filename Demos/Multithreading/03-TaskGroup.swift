
func test() async {
    print("Running")
}

@main
struct TaskGroup {
    static func main() async {
        await test()
    }
}
