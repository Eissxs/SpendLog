# 💸 SpendLog v1.0 (Prototype) for ITEL315 - Elective iOS Development

**SpendLog** is a minimalist iOS prototype app built in SwiftUI that helps users track their daily expenses, visualize spending habits, and manage categories. It supports a modern UI, bar/pie/line charts for analytics, and daily reminders to log expenses—making it a great tool for mindful budgeting.

> ⚠️ This is a prototype project – built to explore SwiftUI concepts, data persistence, and chart-based expense visualization for personal finance tracking.

---

## Features

- ✅ Add, edit, and delete daily expenses with notes and categories  
- 📊 Pie chart breakdown of spending categories (Swift Charts)  
- 📈 Bar chart and line chart summaries for monthly and yearly spending  
- 📅 Highlights the highest-spending day  
- 🔔 Local notification to remind users to log expenses daily  
- 🎨 Aesthetic, Zen-inspired UI with pastel colors and a minimalist splash screen  
- 💾 UserDefaults for lightweight data storage and daily resets  

---

## 🛠️ Tech Stack

- Swift  
- SwiftUI  
- Swift Charts  
- UserNotifications (for reminders)  
- UserDefaults (for persistence)  
- MVVM pattern (basic ViewModel separation)  
- Launch animation with splash screen  

---

## 📸 Screenshots

<div align="center">
  <img src="https://github.com/user-attachments/assets/4eba6e01-2a7f-493a-919b-1b384de68ee3" width="45%" />
  <img src="https://github.com/user-attachments/assets/ea13adb4-6b7a-4b00-ae42-e526322cbfb3" width="45%" />
</div>
<br/>
<div align="center">
  <img src="https://github.com/user-attachments/assets/8aefdc1a-13bf-4ad1-95f2-f748eb531277" width="45%" />
  <img src="https://github.com/user-attachments/assets/618686f6-0a3a-478b-a6a4-06a635e2c522" width="45%" />
</div>
<br/>
<div align="center">
  <img src="https://github.com/user-attachments/assets/4f3aee9a-df9d-46b6-be31-d572f8459369" width="45%" />
  <img src="https://github.com/user-attachments/assets/47ef8e40-87a3-4111-876c-fc53c422e9ff" width="45%" />
</div>
<br/>
<div align="center">
  <img src="https://github.com/user-attachments/assets/88185a88-07d1-4804-9644-ef72d8aae06c" width="45%" />
</div>

---

## 🧪 Project Goals

This prototype demonstrates:

- Building a clean, mobile-first expense tracker UI in SwiftUI  
- Using UserDefaults to store and reset daily expense data  
- Displaying multiple chart types using Swift Charts  
- Animating a splash screen with logo scaling and modern loaders  
- Scheduling notifications with UserNotifications  
- Applying MVVM where appropriate  

---

## 📦 Installation

1. Clone the repo:
   ```bash
   git clone https://github.com/your-username/spendlog.git

2. Open `SpendLog.xcodeproj` in Xcode  
3. Run the app on a simulator or device (iOS 16+ recommended)

---

## ⚠️ What Could Improve (for Production Readiness)

### 📁 File Organization

- While ViewModels and folders exist, some logic could be further modularized  
- Use a `Models/`, `ViewModels/`, and `Resources/` structure consistently  
- Consider centralizing color and font styles in `Assets` or a `Theme.swift`  

### 💾 State Management

- Relies on `@StateObject` and `UserDefaults` directly  
- For scalability, Core Data or `@ObservableObject` services would be more robust  
- Dependency injection or a shared data layer would improve testability  

### 🧪 Testing & Edge Cases

- Currently, no error handling or input validation beyond simple formatting  
- Implement validation for negative or extremely high amounts  
- Add unit tests for ViewModel calculations (totals, filters)  

### 🌐 Localization & Strings

- Most strings are hardcoded  
- Use a constants file or `Localizable.strings`  

---

## 🔔 Daily Reminder Setup

The app will prompt users once per day to log their spending.  
You must allow notifications when the app first launches.  
No backend is used — all logic runs locally via `UNUserNotificationCenter`.

---

## 🧑‍💻 Author

Created by **Eissxs** — Not Cowboy, Not Guru.
