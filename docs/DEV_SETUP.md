# 🛠️ Developer Setup – SpendLog

Welcome to the SpendLog iOS app! This guide covers everything you need to know to set up and run the project locally.

---

## ✅ Requirements

- **Xcode 15 or later**
- **macOS Ventura or later**
- **iOS 16+ simulator or device**
- **Swift 5.9+**

---

## 🚀 Running the App

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/SpendLog.git
cd SpendLog
```

### 2. Open the Project in Xcode

Open the `SpendLog.xcodeproj` file:

```bash
open SpendLog.xcodeproj
```

### 3. Build & Run

- Select an iPhone simulator (e.g., iPhone 15)
- Press **Cmd + R** to build and run

---

### ⚠️ Permissions & Setup Notes

#### • Notifications Permission
SpendLog uses local notifications to remind users to log their expenses.  
Make sure to allow notifications when prompted on first launch.

#### • Running on Real Devices
To test on a physical iPhone:

- Set your Apple Developer Team under:  
  `Signing & Capabilities → Team`
- Enable **Push Notifications** (local use only; no server is needed)

#### • No Backend Required
All data is stored locally using `UserDefaults`.  
No internet or backend configuration is necessary.

---

### 🧪 Debugging Tips

- If expenses aren’t saving:
  - Check `ExpenseViewModel.swift` for logic errors
  - Ensure `UserDefaults` keys are consistent

- If local notifications don’t appear:
  - Confirm permissions are granted in **Settings → Notifications**
  - Use the simulator menu: **Features → Trigger Notification**

---

### ☑️ Ready to Contribute?

Feel free to **fork** this project or open an **issue/PR** if you’d like to collaborate.
