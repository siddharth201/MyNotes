
func test() async {
    print("Running")
}

func TaskGroupExample() {
    
    await withTaskGroup(of: String.self) { group in
        
    }
}

@main
struct TaskGroup {
    static func main() async {
        await test()
    }
}
