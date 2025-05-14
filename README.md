# **SpendLog v1.0**

![Swift](https://img.shields.io/badge/Swift-5.0%2B-orange)
![Platform](https://img.shields.io/badge/Platform-iOS%2016.0%2B-blue)
![License](https://img.shields.io/badge/License-Apache--2.0-green)
![Status](https://img.shields.io/badge/Status-Prototype-yellow)

*ITEL315 – Elective iOS Development*

SpendLog is a minimalist iOS app built with SwiftUI that helps users track daily expenses, visualize spending habits, and manage budgets efficiently. With features like expense categorization, data visualization, and daily reminders, SpendLog makes financial tracking simple and intuitive.

> **Note:** This is a **prototype-level project** designed for learning SwiftUI, exploring data persistence, and building personal finance visualizations.

## **Key Features**

- **Expense Tracking**
  - Add, edit, and delete expenses
  - Categorize with custom categories
  - Add notes and timestamps
  - Track recurring expenses
  - Daily and monthly summaries

- **Data Visualization**
  - Pie charts for category breakdown
  - Bar charts for monthly comparison
  - Line charts for spending trends
  - Highlight highest-spending days
  - Category-specific analytics

- **Budget Management**
  - Set daily and monthly budgets
  - Progress indicators
  - Overspending alerts
  - Goal-setting capabilities
  - Budget history and comparison

- **User Experience**
  - Clean, minimalist interface
  - Pastel tone color scheme
  - Intuitive gestures and animations
  - Dark mode support
  - Smart keyboard handling

- **Notifications & Reminders**
  - Daily expense logging reminders
  - Budget threshold alerts
  - Custom notification scheduling
  - Notification preferences

## **Tech Stack**

- **Framework:** SwiftUI
- **Data Visualization:** Swift Charts
- **Data Persistence:** UserDefaults (prototype)
- **Architecture Pattern:** MVVM
- **Notifications:** UserNotifications Framework
- **Design:** SF Symbols, Custom Color Palette

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

## **Project Structure**

```
SpendLog/
├── Views/
│   ├── DashboardView.swift
│   ├── ExpenseListView.swift
│   ├── AddExpenseView.swift
│   ├── AnalyticsView.swift
│   └── SettingsView.swift
├── Models/
│   ├── Expense.swift
│   ├── Category.swift
│   └── Budget.swift
├── ViewModels/
│   ├── ExpenseViewModel.swift
│   ├── AnalyticsViewModel.swift
│   └── BudgetViewModel.swift
├── Utilities/
│   ├── NotificationManager.swift
│   └── PersistenceManager.swift
└── Assets.xcassets/
```

## **Requirements**

- iOS 16.0+
- Xcode 14.0+
- Swift 5.0+

## **Installation**

1. Clone the repository:
   ```bash
   git clone https://github.com/Eissxs/SpendLog.git
   ```

2. Open `SpendLog.xcodeproj` in Xcode

3. Build and run the project

## **Features in Detail**

### Expense Tracking
- Simple and intuitive expense entry
- Custom category management
- Optional notes and details
- Daily, weekly, and monthly views
- Search and filter capabilities

### Analytics & Visualization
- Interactive pie charts for category distribution
- Bar charts for monthly spending comparison
- Line charts for trend analysis
- Custom date range selection
- Export options for reports

### Budget Management
- Set and track spending limits
- Visual budget indicators
- Alert thresholds for overspending
- Budget history and projections
- Category-specific budgets

### User Experience
- Minimalist Zen-inspired design
- Smooth animations and transitions
- Haptic feedback on actions
- Customizable themes
- Accessibility considerations

## **Privacy Permissions**

The app requires the following permissions:
- Notifications (for daily reminders)
- FaceID/TouchID (optional, for securing the app)

## **Contributing**

Feel free to submit issues and enhancement requests!

## **License**

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## **Documentation**

- [**UI Flow Diagram**](docs/UI_Flow_Diagram.png) *(Note: Created using Eraser AI; not fully accurate)*  
- [**Architecture Overview**](docs/Architecture_Overview.png)  
- [**Developer Setup Guide**](docs/DEV_SETUP.md)

## **Areas for Improvement (Toward Production Readiness)**

### Architecture & Code Quality
- Implement comprehensive unit tests and UI tests
- Add CI/CD pipeline for automated testing and deployment
- Enhance error handling and logging mechanisms
- Implement proper dependency injection
- Add comprehensive code documentation
- Migrate from `UserDefaults` to CoreData for robust persistence

### Security
- Implement secure data encryption for financial information
- Add biometric authentication options
- Implement proper SSL pinning for future API integrations
- Add data export security measures

### Performance
- Optimize chart rendering for large datasets
- Implement proper caching mechanisms
- Add performance monitoring for complex calculations
- Optimize data queries and filters

### Features & UX
- Add data backup and restore functionality
- Implement user accounts and cloud sync capabilities
- Add receipt capture and storage
- Enhance accessibility features
- Add localization support for multiple languages and currencies
- Implement advanced financial insights and predictions
- Add budget templates and recommendations

### Infrastructure
- Set up proper monitoring and crash reporting
- Implement analytics for user behavior tracking
- Add proper versioning and update mechanism
- Prepare for App Store submission requirements

## **Author**

Developed by **Eissxs**

## **Acknowledgments**

- Apple SwiftUI Framework
- Swift Charts
- UserNotifications Framework

---

*"Track, visualize, and conquer your finances with SpendLog!"* 

---
