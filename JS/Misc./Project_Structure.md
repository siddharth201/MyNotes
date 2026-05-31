

## Your project structure

```bash
MyFirstApp/
├── __tests__/
├── android/
├── app.json
├── App.tsx
├── babel.config.js
├── Gemfile
├── Gemfile.lock
├── index.js
├── ios/
├── jest.config.js
├── metro.config.js
├── node_modules/
├── package-lock.json
├── package.json
├── README.md
├── tsconfig.json
└── vendor/
```

---

## Files you’ll use most

These are the important ones day-to-day.

---

## `App.tsx`

```bash
App.tsx
```

Most important file for now.

This is your root UI.

Equivalent in SwiftUI:

```swift
ContentView.swift
```

Example:

```tsx
function App() {
  return <Text>Hello World</Text>;
}
```

When you edit this file:

```bash
Cmd + S
```

the simulator reloads.

---

## `index.js`

```bash
index.js
```

This is the app entry point.

Equivalent to:

```swift
@main
struct MyApp: App
```

It registers `App.tsx` as the root component.

Usually looks like:

```javascript
import App from './App';
```

---

## `package.json`

```bash
package.json
```

Very important.

Contains:

* project name
* npm scripts
* dependencies
* React Native version

Example:

```json
{
  "name": "MyFirstApp",
  "dependencies": {
    "react": "...",
    "react-native": "..."
  }
}
```

Equivalent to:

* `Package.swift`
* `Podfile`

combined.

---

## `package-lock.json`

```bash
package-lock.json
```

Generated automatically by npm.

Locks exact package versions.

Similar to:

```text
Podfile.lock
```

in CocoaPods.

Usually don’t edit manually.

---

## `ios/`

```bash
ios/
```

Native iOS project.

Very familiar if you know Xcode.

Open it with:

```bash
open ios/MyFirstApp.xcworkspace
```

Contains:

* `Info.plist`
* `AppDelegate`
* `Assets.xcassets`
* `LaunchScreen`
* Pods

---

## `android/`

```bash
android/
```

Native Android project.

Contains:

* `MainActivity`
* `AndroidManifest.xml`
* Gradle files

Usually untouched early on.

---

## `node_modules/`

```bash
node_modules/
```

Contains all installed JavaScript packages.

Equivalent to:

```text
Pods/
```

or Swift package cache.

Never edit manually.

Can be deleted and regenerated via:

```bash
npm install
```

---

## `app.json`

```bash
app.json
```

App metadata/config.

Contains basic config like app name:

Example:

```json
{
  "name": "MyFirstApp",
  "displayName": "MyFirstApp"
}
```

Used by React Native CLI.

---

## `babel.config.js`

```bash
babel.config.js
```

Babel transforms modern JS/TS into code Metro can run.

Think:

> JavaScript transpiler configuration

You’ll rarely touch it initially.

---

## `metro.config.js`

```bash
metro.config.js
```

Config for Metro.

Metro is what was running in your terminal earlier.

Responsible for:

* bundling JS
* hot reload
* serving code to simulator

Usually leave as-is.

---

## `tsconfig.json`

```bash
tsconfig.json
```

TypeScript compiler settings.

Because your app uses:

```tsx
.tsx
```

instead of `.js`

Controls:

* strict typing
* path aliases
* compiler rules

---

## `__tests__/`

```bash
__tests__/
```

Contains unit tests.

Example:

```bash
App.test.tsx
```

Used by Jest.

Safe to ignore while learning.

---

## `jest.config.js`

```bash
jest.config.js
```

Configuration for tests.

Only needed when writing test cases.

---

## `README.md`

Project instructions created by CLI.

Can ignore for now.

---

## New files you noticed

These are newer / Ruby related:

---

## `Gemfile`

```bash
Gemfile
```

This surprises many React Native beginners.

Why is Ruby here?

Because React Native iOS setup still uses Ruby tooling via CocoaPods.

`Gemfile` defines Ruby dependencies like:

```ruby
gem 'cocoapods'
```

Equivalent to:

> package.json for Ruby gems

---

## `Gemfile.lock`

```bash
Gemfile.lock
```

Locks Ruby dependency versions.

Like:

```text
package-lock.json
```

but for Ruby.

---

## `vendor/`

```bash
vendor/
```

Newer React Native versions sometimes create this for local Ruby/Bundler dependencies.

Often contains:

```bash
vendor/bundle/
```

Used internally by bundler/CocoaPods.

You usually don’t touch this.

---

## If I simplify your project

### You’ll edit these most:

```bash
App.tsx
package.json
```

---

### Sometimes:

```bash
ios/
android/
```

---

### Rarely:

```bash
babel.config.js
metro.config.js
tsconfig.json
```

---

### Almost never:

```bash
node_modules/
vendor/
package-lock.json
Gemfile.lock
```

---

## My recommendation for you right now

Since you're just starting:

### Focus only on:

```bash
App.tsx
ios/
package.json
```

Ignore everything else initially.

If you can open `App.tsx` in VS Code and change:

```tsx
<Text>Hello World</Text>
```

to:

```tsx
<Text>Hello Siddharth 👋</Text>
```

then save it and watch the simulator update — that’s the best next step.

