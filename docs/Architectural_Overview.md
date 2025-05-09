## Architectural Overview – SpendLog

SpendLog follows the MVVM (Model-View-ViewModel) architecture pattern to ensure a clear separation of concerns, scalability, and maintainability.

---

### Layers Overview

![Architecture Diagram](https://github.com/user-attachments/assets/2a3e4d88-d425-4322-a390-696d70c36a7b)

---

### Component Breakdown

#### Models (`Models/`)

- **Expense.swift**: Defines the data model for a spending entry, including the amount, category, and date. It conforms to `Codable` for local persistence.

#### ViewModels (`ViewModels/`)

- **ExpenseViewModel.swift**: Manages the list of expenses, computes totals, filters by category and date, and stores data in `UserDefaults`.

#### Views (`Views/`)

- **HomeView.swift**: Dashboard that shows the total spending, pie chart, recent expenses, and navigation to add/edit views.
- **AddExpenseView.swift**: Form for adding a new expense with input validation and category selection.
- **EditExpenseView.swift**: Similar to `AddExpenseView`, but pre-filled for editing existing entries.
- **SpendingPieChartView.swift**: Displays a pie chart of expenses by category using Swift Charts.
- **SpendingSummaryView.swift**: Provides high-level insights into spending (e.g., monthly total, biggest spending day).
- **CategoryManager.swift**: UI for managing category display or assignment, designed with future-proofing in mind.
- **SplashView.swift**: Optional animated splash screen that enhances the app branding.

#### Resources (`Resources/`)

- **Colors.swift**: Centralized definitions for colors used in categories and themes.
- **Assets.xcassets**: Contains color sets, icons, and launch images for the app.

---

### Data Handling & Persistence

- **UserDefaults** is used for storing expense data and user preferences locally.
- Data models are encoded and decoded using the `Codable` protocol for persistence.
- The app operates offline-first and does not require a backend connection.
- For future production versions, consider migrating to **Core Data** or **Realm** for more robust querying and support for complex data relationships.

---

### Navigation Flow

![Navigation Diagram](https://github.com/user-attachments/assets/6ebfedd3-072b-46cd-a794-5e1fa25c6591)

- Navigation is handled using `NavigationStack` and SwiftUI bindings to enable seamless transitions between views.
- Expense editing can be initiated from lists in the `HomeView` or `SpendingSummaryView`.

---

### Architecture Summary

- The app uses the MVVM pattern to keep business logic within the `ExpenseViewModel`, allowing views to focus solely on the UI.
- The architecture maintains minimal coupling between views and models, which improves scalability and maintainability.
- The file structure is well-organized to support long-term maintenance and ease of collaboration.
