## 🏗️ Architectural Overview – SpendLog

SpendLog is built using the MVVM (Model-View-ViewModel) architecture pattern to ensure clear separation of concerns, scalability, and maintainability.

---

### 🧱 Layers Overview

<img width="347" alt="Screenshot 2025-05-07 at 3 44 05 PM" src="https://github.com/user-attachments/assets/2a3e4d88-d425-4322-a390-696d70c36a7b" />

---

### 🧩 Component Breakdown

#### Models (`Models/`)
- **Expense.swift** – Defines the data model for a spending entry, including amount, category, and date. Conforms to `Codable` for local persistence.

#### ViewModels (`ViewModels/`)
- **ExpenseViewModel.swift** – Contains logic for managing the list of expenses, computing totals, filtering by category/date, and storing data in `UserDefaults`.

#### Views (`Views/`)
- **HomeView.swift** – Dashboard showing total spend, pie chart, recent expenses, and navigation to add/edit views.
- **AddExpenseView.swift** – Form view for adding a new expense, with input validation and category selection.
- **EditExpenseView.swift** – Similar to `AddExpenseView`, but pre-filled for editing existing entries.
- **SpendingPieChartView.swift** – Displays a pie chart of expenses by category using Swift Charts.
- **SpendingSummaryView.swift** – Shows high-level spending insights (monthly total, biggest day, etc.).
- **CategoryManager.swift** – UI for managing category display or assignment (future-proofed).
- **SplashView.swift** – Optional animated splash screen to enhance app branding.

#### Resources (`Resources/`)
- **Colors.swift** – Centralized color definitions for categories and themes.

- **Assets.xcassets** – Contains color sets, icons, and launch images.

---

### 💾 Data Handling & Persistence

- **UserDefaults** is used for storing expense data and user preferences locally.
- Data models are encoded/decoded using `Codable`.
- The app is entirely offline-first and requires no backend connection.
- For production apps, migrating to **Core Data** or **Realm** is recommended for richer querying and data relationships.

---

### ⚙️ Navigation Flow

<img width="229" alt="Screenshot 2025-05-07 at 3 52 18 PM" src="https://github.com/user-attachments/assets/6ebfedd3-072b-46cd-a794-5e1fa25c6591" />

- Navigation is handled via `NavigationStack` and SwiftUI bindings.
- Expense editing is initiated from lists in `HomeView` or `SpendingSummaryView`.

---

### 🧠 Architecture Summary

- Uses MVVM to keep business logic in `ExpenseViewModel`, allowing views to focus solely on UI.
- Minimal coupling between views and models for better scalability.
- Organized file structure for long-term maintenance and collaboration.

---

Let me know if you'd like this converted into a visual diagram or embedded in your README!
