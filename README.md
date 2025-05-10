# 💸 SpendLog v1.0 (Prototype)  
*ITEL315 – Elective iOS Development*

**SpendLog** is a minimalist iOS prototype app built in **SwiftUI** to help users track daily expenses, visualize spending habits, and manage categories. It features a clean UI, analytics via pie/bar/line charts, and daily notifications—offering a mindful budgeting experience with zero backend.

> **Note:** This is a **prototype-level project** designed for learning SwiftUI, exploring data persistence, and building personal finance visualizations.

---

## **Key Features**

- **Daily Expense Tracker:** Add, edit, and delete expenses with categories and optional notes  
- **Analytics Dashboard:**  
  - Pie chart of spending by category  
  - Bar and line charts for monthly and yearly overviews  
  - Highlights the highest-spending day  
- **Notifications:** Daily reminder to log expenses using local notifications  
- **Splash Screen:** Animated launch screen with logo and subtle loader  
- **Aesthetic Design:** Pastel tones and Zen-inspired minimalism  
- **Persistence:** Uses `UserDefaults` for simple local storage and daily resets

---

## **Tech Stack**

- **Swift**
- **SwiftUI**
- **Swift Charts**
- **UserNotifications** – for daily reminders  
- **UserDefaults** – for persistence  
- **MVVM Pattern** – separation of concerns via ViewModels

---

## **App Screenshots**

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

## **Project Objectives**

This prototype demonstrates:

- Clean, mobile-first expense tracking using SwiftUI  
- State persistence and daily resets using `UserDefaults`  
- Visual analytics through Swift Charts (pie, bar, line)  
- Splash screen animation with scaling effects  
- Local notification scheduling with `UNUserNotificationCenter`  
- Applying MVVM principles for better code organization

---

## **Installation Instructions**

1. Clone the repository:  
   ```bash
   git clone https://github.com/Eissxs/SpendLog.git
   ```

2. Open `SpendLog.xcodeproj` in Xcode  
3. Run the app on a simulator or device (**iOS 16+ recommended**)

---

## Areas for Improvement (Toward Production Readiness)

### 1. File Organization
- ViewModels and folders are in place, but logic can be further modularized  
- Use a consistent folder structure: `Models/`, `ViewModels/`, `Resources/`  
- Consider centralizing colors, typography, and styles in `Theme.swift` or `Assets`

### 2. State Management
- Uses `@StateObject` and `UserDefaults` directly  
- For advanced scaling, explore `CoreData` or shared services with `ObservableObject`  
- Dependency injection would enhance testability and code reuse

### 3. Input Validation & Edge Cases
- Minimal validation currently  
- Add checks for negative/large values and handle malformed input  
- Unit tests for calculation logic and filters would increase reliability

### 4. Localization & Strings
- Most strings are hardcoded  
- Use a `Constants.swift` or `Localizable.strings` to support localization and reduce duplication

---

## Daily Reminder Setup

- The app sends one local notification per day to remind users to log expenses  
- Notifications must be allowed on first launch  
- All logic is local — no server or cloud integration

---

## Documentation

- **UI Flow Diagram** *(Note: Created with Eraser AI; not fully accurate)*  
- **Architecture Overview**  
- **Developer Setup Guide**

---

## Author

Developed by **Eissxs**  
*“When I wrote this code, only God and I understood what I did. Welp, now only God knows.”*
