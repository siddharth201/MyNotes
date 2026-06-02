
<details>
<summary>$\color{red}{\huge{\textbf{List Realated Issue}}}$</summary> 

#### Q. I want to show this list of users `users = ["Sid", "Jyoti", "Shivi"]` in `List`. How to do in Swift?
```swift
struct ContentView: View {
    
    @State private var users = ["Sid", "Jyoti", "Shivi"]
    
    var body: some View {
        VStack {
            List() {
                // ???
            }
        }
        .padding()
    }
}
```  

#### Answer:   

To display your array of strings in a SwiftUI `List`, you need to iterate over the array and provide a way for SwiftUI to uniquely identify each item. Since strings don't conform to the `Identifiable` protocol by default, you can use `id: \.self` to use the strings themselves as their unique identifiers.

Here is the corrected and standard way to just **show** the list:

```swift
import SwiftUI

struct ContentView: View {
    @State private var users = ["Sid", "Jyoti", "Shivi"]
    
    var body: some View {
        VStack {
            // Pass the array and use \.self as the identifier
            List(users, id: \.self) { user in
                Text(user)
            }
        }
        .padding()
    }
}

```

### Why this works:

* **`List(users, id: \.self)`**: This tells the List to loop through the `users` array. The `id: \.self` part is crucial—it tells SwiftUI to use the actual string values ("Sid", "Jyoti", etc.) to tell the rows apart.
* **`{ user in Text(user) }`**: This closure runs for every item in the array, taking the current string (named `user`) and generating a `Text` view for it.

---

### Bonus: If you *did* want to enable row selection

If your goal was to allow users to tap and select rows (which is what `selection:` is for), you need a separate state variable to keep track of the selected items. It usually requires a `Set` to track multiple selections and works best when the `List` is inside a `NavigationView` or `NavigationStack` with an Edit button.

Here is how you would do that:

```swift
import SwiftUI

struct ContentView: View {
    @State private var users = ["Sid", "Jyoti", "Shivi"]
    // Create a new State variable to hold the selected items
    @State private var selectedUsers = Set<String>()
    
    var body: some View {
        NavigationStack {
            VStack {
                // Pass the selection binding here
                List(users, id: \.self, selection: $selectedUsers) { user in
                    Text(user)
                }
                .navigationTitle("Users")
                .toolbar {
                    EditButton() // Required to enable multi-selection mode in iOS
                }
            }
            .padding()
        }
    }
}

```  

#### Q. Explain **`id: \.self`** more  
[Explanation]()


</details>
