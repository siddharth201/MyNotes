
Swift’s **`Task`** struct lets us start running some work immediately, and optionally wait for the result to be returned. And it is optional: sometimes you don’t care about the result of the task, or sometimes the task automatically updates some external value when it completes, so you can just use them as “fire and forget” operations if you need to. This makes them a great way to run async code from a synchronous function.   


First, let’s look at an example where we create two tasks back to back, then wait for them both to complete. This will fetch data from two different URLs, decode them into two different structs, then print a summary of the results, all to simulate a user starting up a game – what are the latest news updates, and what are the current highest scores?

Here’s how that looks:

```swift
struct NewsItem: Decodable {
    let id: Int
    let title: String
    let url: URL
}

struct HighScore: Decodable {
    let name: String
    let score: Int
}

func fetchUpdates() async {
    let newsTask = Task {
        let url = URL(string: "https://hws.dev/headlines.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([NewsItem].self, from: data)
    }

    let highScoreTask = Task {
        let url = URL(string: "https://hws.dev/scores.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([HighScore].self, from: data)
    }

    do {
        let news = try await newsTask.value
        let highScores = try await highScoreTask.value
        print("Latest news loaded with \(news.count) items.")

        if let topScore = highScores.first {
            print("\(topScore.name) has the highest score with \(topScore.score), out of \(highScores.count) total results.")
        }
    } catch {
        print("There was an error loading user data.")
    }
}

await fetchUpdates()
```  

Let’s unpick the key parts:

1. Creating and running a task is done by using its initializer, passing in the work you want to do.

2. Tasks don’t always need to return a value, but when they do Swift can often figure it out automatically. If you have something more complex, you might need to declare it explicitly. For example, we might have used () -> [NewsItem] in to say that our task returns an array of NewsItem.

3. As soon as you create the task it will start running – there’s no **`start()`** method or similar.

4. The entire task is run concurrently with your other code, which means it might be able to run in parallel too. In our case, that means fetching and decoding the data happens inside the task, which keeps our main fetchUpdates() function free.

5. If you want to read the return value of a task, you need to access its **`value`** property using **`await`**. In our case our task could also throw errors because we’re accessing the network, so we need to use try as well.

6. Once you’ve copied out the value from your task you can use that normally without needing **`await`** or **`try`** again, although subsequent accesses to the task itself – e.g. **`newsTask.value`** – will need **`try await`** because Swift can’t statically determine that the value is already present.   

Both tasks in that example returned a value, but that’s not a requirement – the “fire and forget” approach allows us to create a task without storing it, and Swift will ensure it runs until completion correctly.

To demonstrate this, we could make a small SwiftUI program to fetch a user’s inbox when a button is pressed. Button actions are not async functions, so we need to launch a new task inside the action. The task can call async functions, but in this instance we don’t actually care about the result so we’re not going to store the task – the function it calls will handle updating our SwiftUI view.

Here’s the code:  

```swift
struct Message: Decodable, Identifiable {
    let id: Int
    var from: String
    var text: String
}

struct ContentView: View {
    @State private var messages = [Message]()

    var body: some View {
        NavigationStack {
            Group {
                if messages.isEmpty {
                    Button("Load Messages") {
                        Task {
                            await loadMessages()
                        }
                    }
                } else {
                    List(messages) { message in
                        VStack(alignment: .leading) {
                            Text(message.from)
                                .font(.headline)

                            Text(message.text)
                        }
                    }
                }
            }
            .navigationTitle("Inbox")
        }
    }

    func loadMessages() async {
        do {
            let url = URL(string: "https://hws.dev/messages.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            messages = try JSONDecoder().decode([Message].self, from: data)
        } catch {
            messages = [
                Message(id: 0, from: "Failed to load inbox.", text: "Please try again later.")
            ]
        }
    }
}
```  

Even though that code isn’t so different from the previous example, I still want to pick out a few things:

Creating the new task is what allows us to start calling an async function even though the button’s action is a synchronous function.
The lifetime of the task is not bound by the button’s action closure. So, even though the closure will finish immediately, the task it created will carry on running to completion.
We aren’t trying to read a return value from the task, or storing it anywhere. This task doesn’t actually return anything, and doesn’t need to.  

Between Task, async/await, and SwiftUI a lot of work is happening on our behalf. Remember, when we use await we’re signaling a potential suspension point, which means the task might sleep for a while based on the work that's happening.

Let's break it down:

All UI work runs on the main thread, so the button’s action closure will fire on the main thread.
We create the task on the main thread, and the code we're running belongs to our SwiftUI view, so it will also run on the main thread.
Inside loadMessages() we use await to load our URL data, but that will run on its own networking thread to avoid making our UI freeze. When it resumes, our code will return to the main thread.
Finally, the messages property uses the @State property wrapper, which will automatically update its value on the main thread no matter where we change it from.
Best of all, we don’t have to care about this – we don’t need to know how the system is balancing the threads, or even that the threads exist, because Swift and SwiftUI take care of that for us. In fact, the concept of tasks is so thoroughly baked into SwiftUI that there’s a dedicated task() modifier that makes them even easier to use.


