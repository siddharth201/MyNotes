
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

5. If you want to read the return value of a task, you need to access its value property using await. In our case our task could also throw errors because we’re accessing the network, so we need to use try as well.
Once you’ve copied out the value from your task you can use that normally without needing await or try again, although subsequent accesses to the task itself – e.g. newsTask.value – will need try await because Swift can’t statically determine that the value is already present. 


