
Q20. How does Task cancellation work?
Interview definition
Swift task cancellation is cooperative. Calling cancel() marks a task as cancelled, but the task must check its cancellation state and stop appropriately.

Acronym
S-C-R
Signal
Check
Respond
