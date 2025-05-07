## 🏗️ Architectural Overview – SpendLog

SpendLog is built using the MVVM (Model-View-ViewModel) architecture pattern to ensure clear separation of concerns, scalability, and maintainability.

---

### 🧱 Layers Overview

<img width="347" alt="Screenshot 2025-05-07 at 3 44 05 PM" src="https://github.com/user-attachments/assets/2a3e4d88-d425-4322-a390-696d70c36a7b" />

---

### 🧩 Components

#### Models (`Models/`)
- **Expense.swift** – Represents a single spending item.
- **Category.swift** – Enum and metadata for spending categories.
- **Goal.swift** – Represents user-defined spending goals.

#### ViewModels (`ViewModels/`)
- **ExpenseViewModel.swift** – Handles logic for adding, listing, and deleting expenses.
- **GoalViewModel.swift** – Manages saving goals, goal progress, and validations.

#### Views (`Views/`)
- **HomeView.swift** – Dashboard with current totals, streak chart, and add button.
- **AddExpenseView.swift** – Form UI for logging a new expense.
- **ExpenseHistoryView.swift** – Shows past spending records with edit/delete options.

#### Charts (`Charts/`)
- **SpendingPieChartView.swift** – Pie chart displaying spending by category.
- **StreakBarChartView.swift** – Visual bar chart showing spending streaks or consistency.

#### Resources (`Resources/`)
- **CategoryColor.swift** – Central file for defining UI colors per category.
- **Constants.swift** – Stores shared string and value constants.
- **Assets.xcassets** – Holds app icons, UI colors, and design assets.

#### Supporting Utilities (`Supporting/`)
- **DateUtils.swift** – Handles date comparisons, formatting, and resets.
- **NotificationManager.swift** – Manages daily reminder scheduling.

---

### 💾 Data Persistence

- **UserDefaults** is used for prototyping purposes to persist expense and goal data locally.
- All models conform to `Codable` for easy encoding/decoding to JSON.
- Consider migrating to **CoreData** or **Realm** for production-level data integrity and querying.

---

### ⚙️ Navigation Flow

- `HomeView` → Add Expense → ExpenseHistory → Expense Details (optional editing)
- Navigation uses `NavigationStack` and `@State` to manage transitions and data passing.

---

### 🧠 Architecture Summary

- **MVVM** pattern ensures clean separation between UI and logic.
- All business logic lives in ViewModels for testability and reuse.
- Views remain declarative and driven by observed state changes.

---

Let me know if you’d like a diagram or flowchart version of this overview!
