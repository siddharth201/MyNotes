
<details>
<summary><b>Q8. What is a Task?</b></summary>

**Interview-friendly definition**
A Task is a unit of asynchronous work. It provides a context in which asynchronous code can execute and can also be cancelled or awaited for its result.

Apple defines Task as a unit of asynchronous work; tasks begin running after creation and can be cancelled or awaited. Apple Developer
Simple example

import Foundation

Task {
    print("Task started")

    try? await Task.sleep(for: .seconds(2))

    print("Task finished")
}

Mental model

async function
      ↓
needs execution
      ↓
     Task
      ↓
asynchronous work
</details>

<details>
<summary><b>Explanation</b></summary>

</details>

<details>
<summary><b>Explanation</b></summary>

</details>

<details>
<summary><b>Explanation</b></summary>

</details>

<details>
<summary><b>Explanation</b></summary>

</details>

<details>
<summary><b>Explanation</b></summary>

</details>

