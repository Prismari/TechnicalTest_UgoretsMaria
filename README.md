# TechnicalTest_UgoretsMaria
Instagram Stories-like feature

## 🧱 Tech Stack

* **Language**: Swift
* **Framework**: SwiftUI, SwiftData
* **Architecture**: MVVM
* **Data Source**: Dynamic story content from open image APIs
* **Dependencies**: Only native frameworks

## 🎯 Implementation Notes

* The project uses a **modular MVVM architecture** to maintain clear separation of concerns and support future scalability.
* My **main focus was architecture**, as it lays the foundation for maintainability and growth.
* **Data loading** is done with basic offset-based pagination for simplicity. However, I believe **cursor-based pagination** would be more appropriate in production, especially to support **dynamic data and story expiration** handling.
* **Persistence is incomplete** due to time constraints, but the structure is in place to support it.
* The **UI implementation is basic**, focused on listing users and displaying their stories. I would love to improve it with features like:

  * Smooth **transitions between user stories**
  * **Avatar highlights** for seen/unseen states
  * **Gesture support** for navigation
* **Dependency injection** is used but could be improved.
* **Protocols and unit tests are currently missing**, and would be prioritized next to ensure robustness and flexibility.

## ✅ Next Steps (if more time was available)

* Implement proper state persistence (e.g., Core Data or SwiftData)
* Improve UI/UX polish and add transitions/gestures
* Add DI refinement and protocol abstraction
* Write unit tests to cover view models and data layers
