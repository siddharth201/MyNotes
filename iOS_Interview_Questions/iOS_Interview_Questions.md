
# iOS Questions Answers  

## iOS Basics

### Q. Can you explain the iOS Application Lifecycle?
<details>
<summary>Answer</summary>
The iOS app lifecycle is managed by the UIApplication object. The main states are:  

**(NIABS)**

**1. Not Running:** App is not launched or has been terminated.

**2. Inactive:** App is running but not receiving events (e.g., incoming call).

**3. Active:** App is running in the foreground and receiving user input.

**4. Background:** App is running code in the background but not visible to the user.

**5. Suspended:** App is in memory but not executing code, ready to be resumed quickly.  

### Callbacks in AppDelegate:

• `application(_:didFinishLaunchingWithOptions:)` → called when the app launches.

• `applicationDidBecomeActive(_:)` → app enters foreground.

• `applicationWillResignActive(_:)` → app will move to inactive state.

• `applicationDidEnterBackground(_:)` → app moved to background.

• `applicationWillEnterForeground(_:)` → app is about to become active again.

• `applicationWillTerminate(_:)` → app is about to be killed.
</details>  

### Q. Can you explain the UIViewController lifecycle.
<details>
<summary>Answer</summary>
A UIViewController manages a screen in an iOS app. The lifecycle methods are:

`1. init(coder:) / init(nibName:bundle:)` → initialization of controller.

`2. loadView()` → loads the main view (used rarely, mostly overridden when creating views programmatically).

`3. viewDidLoad()` → called once when the view is loaded into memory (best place to set up UI, API calls).

`4. viewWillAppear(_:)` → called before the view appears on screen (update UI, analytics).

`5. viewDidAppear(_:)` → called when view is visible (start animations, video, etc.).

`6. viewWillDisappear(_:)` → called before leaving the screen (save data, stop animations).

`7. viewDidDisappear(_:)` → called when the view has gone offscreen (clean-up tasks).

`8. deinit` → called when the view controller is deallocated (release resources).
</details>  

### Q. What is the difference between CFBundleVersion and CFBundleShortVersionString?
<details>
<summary>Answer</summary>  

**CFBundleShortVersionString**  

• This is the “marketing version” of your app.

• Usually shown to users in the App Store or app settings.

• Format: "Major.Minor.Patch" (e.g., "1.2.3")

• Purpose: Communicate the app version to users.

**Example in Info.plist:**

```
<key>CFBundleShortVersionString</key>
<string>1.2.3</string>
```

---

**CFBundleVersion**

• This is the “build number” of your app.

• Represents a specific build for internal tracking or deployment.

• Can be any string (usually integer increments: "1", "2", "3").

• Purpose: Track specific builds for testing, CI/CD, or App Store uploads.

**Example in Info.plist:**

```
<key>CFBundleVersion</key>
<string>45</string>
```
</details>  





