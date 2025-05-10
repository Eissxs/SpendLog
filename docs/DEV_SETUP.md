# Developer Setup – SpendLog

Welcome to the SpendLog iOS app! This guide provides instructions on how to set up and run the project locally.

---

## Requirements

- **Xcode 15 or later**
- **macOS Ventura or later**
- **iOS 16+ simulator or device**
- **Swift 5.9+**

---

## Running the App

### 1. Clone the Repository

Clone the repository to your local machine:

```bash
git clone https://github.com/Eissxs/SpendLog.git
cd SpendLog
```

### 2. Open the Project in Xcode
Open `SpendLog.xcodeproj` using Xcode.

### 3. Run the Application
- Select an iOS simulator (e.g., iPhone 16e)
- Press `Cmd + R` to build and launch the app

---

## Permissions & Setup Notes

### Notifications Permission
SpendLog uses local notifications to remind users to log their expenses.  
Ensure to allow notifications when prompted during the first launch.

### Running on Real Devices
To test on a physical iPhone:
- Set your Apple Developer Team under:  
  `Signing & Capabilities → Team`
- Enable **Push Notifications** (local use only; no server needed)

### No Backend Required
All data is stored locally using `UserDefaults`.  
No internet or backend configuration is necessary.

---

## Debugging Tips

- **If expenses aren’t saving**:
  - Check `ExpenseViewModel.swift` for logic errors.
  - Ensure `UserDefaults` keys are consistent.

- **If local notifications are not triggering**:
  - Confirm notification permissions are enabled in **Settings → Notifications**.
  - In the simulator, use **Features → Trigger Notification** to manually test local notifications.

---

## Ready to Contribute?

Feel free to **fork** this project or open an **issue/PR** if you would like to collaborate.
