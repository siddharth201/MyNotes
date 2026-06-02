
<details>
<summary>$\color{red}{\huge{\textbf{List Realated Issue}}}$</summary> 

### I want to show this list of users `users = ["Sid", "Jyoti", "Shivi"]` in `List`. How to do in Swift?
```swift
struct ContentView: View {
    
    @State private var users = ["Sid", "Jyoti", "Shivi"]
    
    var body: some View {
        VStack {
            List(selection: $users) {
                
            }
        }
        .padding()
    }
}
```

</details>
