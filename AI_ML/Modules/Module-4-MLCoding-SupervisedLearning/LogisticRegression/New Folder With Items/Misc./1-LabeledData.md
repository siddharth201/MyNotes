## Q. Supervised learning uses Labeled data to learn pattern. Explain this

Supervised learning relies on labeled data, which means every piece of information in the training dataset already includes the correct answer. Think of it like learning a new subject with a teacher who provides the questions along with an answer key.

Here is a simple breakdown of how this process works:

## 1. The Structure of Labeled Data

Labeled data consists of two main parts:

* Features (Inputs): The raw characteristics or variables you feed into the system.
* Labels (Outputs): The target or the "correct answer" associated with those features.

Example: If you want a model to detect spam emails, the features might be the words in the email (like "free," "winner," or "urgent"), and the label would be a definitive tag: "Spam" or "Not Spam."

## 2. How the Pattern is Learned
The learning process follows a specific loop:

* Mapping: The computer looks at the features of an item and tries to guess the label.
* Error Calculation: It compares its guess against the actual, true label provided in the data.
* Adjustment: If the guess is wrong, the algorithm adjusts its internal mathematical rules (weights) to minimize the error next time.

By repeating this millions of times across a large dataset, the model establishes a highly accurate mathematical relationship between the inputs and the outputs.
## 3. The Ultimate Goal: Generalisation
The purpose of training a model on labeled data is not just to memorize the training set, but to predict labels for completely new, unseen data. Once the model understands the underlying patterns, you can give it fresh features without any labels, and it will accurately predict the correct outcome.
## The Two Main Types of Supervised Learning
Depending on the label, supervised learning usually falls into one of two categories:

* Classification: Used when the label is a distinct category (e.g., predicting if a tumor is Benign or Malignant, or if an image is a Cat or a Dog).
* Regression: Used when the label is a continuous numerical value (e.g., predicting the exact price of a house based on its square footage and location).




