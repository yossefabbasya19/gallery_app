# 📸 Flutter Photo Gallery App

A modular Flutter application using Clean Architecture to display a curated list of photos with offline support, light/dark themes, and loading/error states.

---

## 📷 Screenshots

### 🟢 Online Mode

**video:**
![Light Mode](assets/screenshots/Screen_recording_20250726_195918.mp4)

**Light Mode:**

![Light Mode](assets/screenshots/online_light_mode.png)

**Dark Mode:**

![Dark Mode](assets/screenshots/online_dark_mode.png)

### 🔴 Offline (Cached) Mode

**Light Mode:**

![Light Mode](assets/screenshots/offline_light_mode.png)

**Dark Mode:**

![Dark Mode](assets/screenshots/offline-dark_mode.png)

### 🔄 Loading State

![Dark Mode](assets/screenshots/loading_indicator_dark.png)
![Light Mode](assets/screenshots/loading_indicator_light.png)

### ❌ Error State

![Dark Mode](assets/screenshots/error_handler_dark.png)
![Light Mode](assets/screenshots/error_handler_light.png)

### 📡 Network Status Indicator

![Dark Mode](assets/screenshots/network_indicator.png)
![Light Mode](assets/screenshots/network_indicator_light.png)

---

## 🧱 Project Structure

```
/lib
├── /core
│   ├── /api_service           → API service and constants
│   ├── /network               → Internet connection checking
│   ├── /constants             → Shared constant values
│   ├── /theme                 → Light/Dark theme configs
│   ├── /assets                → Asset path references
│   ├── /di                    → Dependency injection (GetIt + Injectable)
│   ├── /routes                → Named routes for navigation
│   ├── /widgets               → Reusable custom widgets
│   ├── /helpers               → Helper functions
│   ├── /failure               → App-wide failure/error types
│   ├── /hive                  → Hive-related utilities (optional)
│   └── /view_model            → Shared or core-level view models (optional)
│
└── /feature
    ├── /splash
    │   └── /presentation
    │       ├── /view          → splash_screen.dart
    │       └── /view_model    → splash_view_model.dart
    │
    └── /home
        ├── /data
        │   ├── /models        → Data models (e.g., Photo)
        │   ├── /repo          → Repository implementations
        │   └── /data_source   → API/Hive data sources
        └── /presentation
            ├── /view_model    → Logic and state management
            └── /view          → UI widgets and screens
```

---

## 🧠 Clean Architecture Overview

### 🧩 Feature Layer

Each feature (e.g., `home`, `splash`) includes:

#### 1. Presentation Layer
- **Location:** `/feature/[feature_name]/presentation/`
- **/view:** Displays UI (Flutter widgets)
- **/view_model:** Handles business logic and state (uses repository)

> ❗ Presentation does **not** directly call APIs or databases.

#### 2. Data Layer
- **Location:** `/feature/[feature_name]/data/`
- **/models:** Dart models (e.g., `Photo`)
- **/data_source:** Handles remote (Dio) or local (Hive) access
- **/repo:** Abstracts data source access and provides feature logic

> 🧠 Repositories act as a **middleman** between ViewModels and raw data sources.

---

### 🛠 Core Layer

**Location:** `/core/`  
Contains shared services, constants, and utilities:

| Folder             | Purpose                                 |
|--------------------|------------------------------------------|
| `api_service/`      | Handles Dio HTTP requests + constants   |
| `network/`          | Checks internet connectivity            |
| `di/`               | Sets up dependency injection            |
| `failure/`          | Defines app-wide error handling         |
| `routes/`           | Global route management                 |
| `widgets/`, `helpers/` | Shared UI and utility functions     |

---

## 🚀 Getting Started (Local Setup)

Follow these steps to set up and run the project locally:

### 🔹 1. Install dependencies

```bash
flutter pub get
```

### 🔹 2. Run code generation

Generates all `injectable`, `hive`, and `build_runner`-based files:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 🔹 3. Run the app

```bash
flutter run
```

> ✅ Make sure Hive is initialized in `main.dart` and all adapters are registered.

---

## 📦 Tech Stack

- `flutter_bloc` for state management
- `injectable` + `get_it` for DI
- `hive` for local cache
- `dio` for network calls
- `dartz` for functional error handling
- `connectivity_plus` for network checks

---

## 📌 Notes

- All layers are **loosely coupled** and follow **Clean Architecture**.
- Adding a new feature is as simple as creating a new `/feature/xyz` module with `data` and `presentation`.

---