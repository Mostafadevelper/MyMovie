# 🎬 MyMovie App

MyMovie is a modular SwiftUI application that showcases trending movies. It's built using SwiftUI and Combine, follows Clean Architecture principles, and is structured into independent Swift Packages to ensure scalability, maintainability, and testability.

---

## 🧱 Project Architecture

This project follows a **Clean Architecture** style using modularization. It is divided into the following Swift Packages:

### 📦 1. **Presentation**
- **Responsibility**: Handles all UI logic using `SwiftUI`.
- **Includes**:
  - ViewModels
  - Views
  - Builders (e.g., `MovieViewModelsBuilder`)
  - User interactions and state management

---

### 📦 2. **Domain**
- **Responsibility**: Defines the core business logic and app rules.
- **Includes**:
  - `Entities`: Models without any dependency
  - `UseCases`: Application-specific business logic
  - `Protocols`: For UseCases and Repositories (Dependency Inversion)

---

### 📦 3. **Data**
- **Responsibility**: Responsible for data handling and implementation of repositories.
- **Includes**:
  - `Repositories`: Implements domain protocols
  - `NetWork`: Remote data source logic
  - `DataSource`: Local persistence or API services

---

### 📦 4. **Core**
- **Responsibility**: Shared utilities and helpers across modules.
- **Includes**:
  - Common helpers
  - Main UseCases and Repository implementations
  - Shared Models

---

## 🚀 Features

- Trending movies list
- Local genre filtering via chips
- Search bar for local filtering
- Pagination support
- Works offline (local caching)
- SwiftUI + Combine
- Clean Architecture + SPM modularization

---

## 🛠 Tools & Technologies

- **SwiftUI**
- **Combine**
- **Swift Package Manager (SPM)**
- **URLSession / Network Layer**

---

## 📁 Folder Structure Overview
MyMovie/
│
├── Core/
│ └── Sources/Core/
│ ├── Core
│ ├── RepositoryMain
│ └── UseCaseMain
│
├── Presentation/
│ └── Sources/Presentation/
│ └── ...
│
├── Domain/
│ └── Sources/Domain/
│ ├── Entity
│ ├── UseCases
│ ├── RepositoryProtocols
│ └── UseCasesProtocols
│
├── Data/
│ └── Sources/Data/
│ ├── DataSource
│ ├── NetWork
│ └── Repositories
│
└── MyMovie/
└── Builders/
└── MovieViewModelsBuilder.swift

## 📌 How to Run

1. Clone the repository.
2. Open `MyMovie.xcodeproj` or `MyMovie.xcworkspace`.
3. Build & Run using any simulator or device.


