
### Q. Can you explain how to upload build on Appstore or testflight?
<details>
<summary>Answer</summary>  


# Interview Answer

> "In my previous projects, we generally used Xcode for manual releases and Fastlane for automated CI/CD releases. I'll explain the manual flow first, then briefly mention the CI/CD flow."

---

# Step 1. Prepare the App

Before creating a release build, I ensure:

* App version is updated
* Build number is incremented
* Release configuration is selected
* Production API endpoint is used
* Release certificates and provisioning profiles are valid
* App icon and launch assets are correct

Example:

```
Version : 2.4.0
Build : 156
```

---

# Step 2. Select Generic iPhone Device

In Xcode,

```
Product
    →
Archive
```

Archive is enabled only when selecting

```
Any iOS Device (arm64)

or

Generic iOS Device
```

Not Simulator.

---

# Step 3. Archive the App

Xcode compiles the application.

Then opens

```
Organizer
```

Now we have an archive.

---

# Step 4. Validate Archive

Inside Organizer

```
Validate App
```

Validation checks

* signing
* bundle identifier
* certificates
* provisioning profile
* capabilities
* missing icons
* app metadata

If validation passes

Proceed to upload.

---

# Step 5. Upload to App Store Connect

Click

```
Distribute App
```

Choose

```
App Store Connect
```

Then

```
Upload
```

Xcode uploads

* IPA
* dSYMs
* Bitcode (older projects)
* Symbols
* Metadata

Apple then starts processing.

Usually takes

```
5–20 minutes
```

Sometimes longer.

---

# Step 6. Processing on App Store Connect

Open

App Store Connect

Navigate

```
My Apps

↓

Select App

↓

TestFlight
```

Initially status shows

```
Processing
```

After processing

```
Ready to Test
```

---

# Step 7. Internal Testing

Internal testers

(max 100 users)

can immediately install the build.

No Beta Review required.

Usually QA team tests here.

---

# Step 8. External Testing

If external testers are required

* Add tester groups
* Fill beta information
* Submit for Beta Review

Apple reviews

Usually

1–2 days.

After approval

External testers receive invitation.

---

# Step 9. Release to App Store

When QA approves

Go to

```
App Store
```

Create a new version.

Example

```
2.5.0
```

Fill

* What's New
* Screenshots
* Keywords
* Description
* Support URL
* Privacy details

Attach uploaded build.

---

# Step 10. Submit for Review

Press

```
Submit for Review
```

Apple performs App Review.

Status changes

```
Waiting for Review

↓

In Review

↓

Pending Developer Release

↓

Ready for Sale
```

---

# Step 11. Release Strategy

There are three options

### Manual Release

Developer presses

```
Release This Version
```

---

### Automatic Release

Apple releases automatically after approval.

---

### Scheduled Release

Release on a specific date.

---

# If Using Fastlane (CI/CD)

Many companies automate this process.

Typical pipeline:

```
Developer merges code

↓

CI/CD triggers

↓

Run Unit Tests

↓

Static Analysis

↓

Increment Build Number

↓

Archive

↓

Sign App

↓

Upload to TestFlight

↓

Notify QA
```

Common tools:

* Fastlane
* Jenkins
* GitHub Actions
* Bitrise
* Azure DevOps

---

# Diagram

```
Code Complete
      │
      ▼
Update Version & Build
      │
      ▼
Archive App
      │
      ▼
Validate
      │
      ▼
Upload to App Store Connect
      │
      ▼
Apple Processing
      │
      ▼
TestFlight
      │
      ├────────► Internal Testing
      │
      └────────► External Testing
                    │
                    ▼
             QA Approval
                    │
                    ▼
           Create App Store Version
                    │
                    ▼
           Submit for Review
                    │
                    ▼
           Apple Review
                    │
                    ▼
         Approved for Release
                    │
      ┌─────────────┴──────────────┐
      ▼                            ▼
Manual Release             Automatic Release
```

---

# Interview Tips (Senior-Level Discussion)

Interviewers often ask follow-up questions after you explain the flow. Be ready for topics such as:

* **Version Number vs Build Number**

  * Version (e.g., `2.4.0`) is the customer-facing release version.
  * Build Number (e.g., `156`) uniquely identifies each uploaded build and typically increments with every upload.

* **Certificates and Provisioning Profiles**

  * Explain the difference between Development and Distribution certificates.
  * Mention that App Store distribution requires a Distribution certificate and an appropriate provisioning profile.

* **Signing**

  * Describe how code signing ensures the app's authenticity and that the app is associated with the correct Team ID and Bundle Identifier.

* **dSYM Files**

  * dSYM files are uploaded so crash reporting tools like Firebase Crashlytics or Sentry can symbolicate crash logs into readable stack traces.

* **Internal vs External TestFlight Testing**

  * Internal testers (up to 100 users with App Store Connect access) can test immediately after processing.
  * External testers require Apple's Beta App Review before receiving the build.

* **Release Automation**

  * Mention experience with Fastlane and CI/CD if applicable, including automated versioning, archiving, signing, uploading to TestFlight, and notifying QA.

---

## Sample 2-Minute Answer

> "Once development is complete, I update the app version and build number, verify that the correct release configuration, certificates, and provisioning profiles are being used, and then archive the app in Xcode using a Generic iOS Device. After the archive is created, I validate it to ensure there are no signing or configuration issues. If validation succeeds, I distribute the archive to App Store Connect. Apple processes the uploaded build, after which it becomes available in TestFlight. We first distribute it to internal testers for QA. If external users need to test it, we submit the build for Beta App Review and share it with external tester groups after approval. Once QA signs off, we create a new App Store version, add the release notes and metadata, attach the approved build, and submit it for Apple's review. After approval, we either release the app manually, schedule the release, or let it go live automatically. In projects with CI/CD, much of this process is automated using Fastlane integrated with tools like Jenkins, GitHub Actions, or Bitrise."

</details>
