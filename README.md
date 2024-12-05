
# Codenesslab Task

![Flutter](https://img.shields.io/badge/Flutter-3.0-blue?logo=flutter) ![GetX](https://img.shields.io/badge/GetX-4.6.5-purple?logo=getx) ![Dart](https://img.shields.io/badge/Dart-2.18-blue?logo=dart)

This project is a task for Codenesslab built with **Flutter** and **GetX**. It demonstrates efficient state management, pagination, search functionality, and clean architecture.

## 📂 Project Structure

```
lib/
├── core/
│   ├── DI/
│   │   └── getx_di.dart
│   ├── error/
│   │   └── failures.dart
│   ├── services/
│   │   ├── app_router.dart
│   │   ├── service_locator.dart
│   │   └── web_services.dart
│   └── utils/
│       ├── constants/
│       │   ├── api_constants.dart
│       │   └── app_constant.dart
│       ├── theme/
│       │   ├── app_colors.dart
│       │   └── app_text_styles.dart
│       └── widgets/
│           ├── default_error_message.dart
│           ├── default_progress_indicator.dart
│           ├── page_bg_decoration.dart
│           └── snackbar_message.dart
├── features/
│   └── posts/
│       ├── data/
│       │   ├── models/
│       │   │   └── posts_model.dart
│       │   └── repos/
│       │       ├── posts_repo.dart
│       │       └── posts_repo_impl.dart
│       └── presentation/
│           ├── view_models/
│           │   └── posts_controller.dart
│           └── views/
│               ├── home_view.dart
│               ├── post_details_view.dart
│               └── search_view.dart
│           └── widgets/
│               ├── home_widgets/
│               └── post_details_widgets/
└── main.dart
test/
└── controllers/

```

## ✨ Features

- **GetX for State Management**: Efficient and easy-to-use reactive state management.
- **Pagination**: Infinite scrolling with data fetching.
- **Search Functionality**: Search through posts dynamically.
- **Error Handling**: Displays error messages for failed requests.
- **Refresh Control**: Pull-to-refresh to reload posts.

## 🚀 Getting Started

### Prerequisites

Ensure you have Flutter installed:

```bash
flutter doctor
```

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/AhmedBelal31/Codenesslab-Task.git
   cd Codenesslab-Task
   ```

2. Get dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## 🛠️ Key Components



### `HomeView`
Displays the list of posts with infinite scrolling and a search button.

### `SearchView`
Provides a search feature to filter posts dynamically.

### `PostDetailsView`
Displays detailed information about a selected post.


## 🧪 Testing

Run tests with:
```bash
flutter test
```

## 🤝 Contributing

1. Fork the repo.
2. Create your feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a pull request.

## 📝 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## 📧 Contact

For any inquiries or questions, feel free to reach out to **Ahmed Belal**:
- 📧 [ahmedbelal1.exe@gmail.com](mailto:ahmedbelal1.exe@gmail.com)
- 💼 [LinkedIn](https://www.linkedin.com/in/ahmedbelal31/)
- 🌐 [Portfolio](https://ahmedbelal31.github.io/MY-Portfolio/)


|  Home View | Post Details View | Search View |
|---------|---------|---------|
|![home](https://github.com/user-attachments/assets/4c26212c-2bf9-45f5-b905-c46518594403)|![post_details](https://github.com/user-attachments/assets/f10d42c4-f749-4ae2-b152-c4470b1a89c8)|![search](https://github.com/user-attachments/assets/5b799e75-28c9-438c-bdee-58b988b03674)|


