   ---

# 🎓 UniQuest – College Finder for International Students

**UniQuest** is a cross-platform mobile and web application designed to help international students discover universities that match their profiles based on GPA, test scores, and other academic criteria. Built using **Flutter**, the app offers a clean and responsive experience for users exploring higher education opportunities globally.

---

## 🌍 Purpose

Many international students struggle to find suitable universities due to lack of centralized guidance. **UniQuest** bridges that gap by:

* Letting users input academic information (e.g., GPA, GRE, IELTS)
* Matching them with relevant universities based on historical admission data
* Providing filters and sorting options to refine their college list

---

## 📱 Platforms Supported

* ✅ Android
* ✅ iOS
* ✅ Web
* ✅ Windows, macOS, Linux (desktop support via Flutter)

---

## 🗃️ Backend Architecture

This project is backed by a relational database (defined in the [`uniquest_schema`](https://github.com/whoseunassailable/uniquest_schema) repository) with entities for:

* Users
* Universities
* Admission Statistics
* Academic Scores
* Application History

🔗 Backend services (API layer) can be built using Node.js, Firebase, or any stack of your choice to connect the app with the database.

---

## 🛠️ Features

* 🧮 GPA-to-College Matching
* 📊 Profile-based University Recommendations
* 🔍 Advanced Filters (location, tuition, acceptance rate)
* ❤️ Favorites and Shortlisting
* 🌐 Multi-platform support (Flutter-based)

---

## 🚀 Getting Started

### Prerequisites

* [Flutter SDK](https://flutter.dev/docs/get-started/install)
* Dart >= 3.0
* IDE (VS Code / Android Studio)
* Emulator or device connected

### Clone and Run

```bash
git clone https://github.com/whoseunassailable/uni_quest_project.git
cd uni_quest_project
flutter pub get
flutter run
```

---

## 🧪 Testing

```bash
flutter test
```

---

## 📁 Project Structure

```
uni_quest_project/
├── android/
├── assets/
├── ios/
├── lib/
│   ├── main.dart
│   ├── models/
│   ├── screens/
│   ├── widgets/
│   └── ...
├── test/
├── web/
├── pubspec.yaml
└── README.md

```

---

## 📄 License

MIT License — see [LICENSE](LICENSE) for details.

---

## 🙋‍♀️ Future Enhancements

* 🔐 Firebase Auth Integration
* 🌎 Multi-language support
* 📱 Push Notifications for deadlines
* 💬 In-app counseling or chatbot

---

## ✨ Credits

Developed as a college project with the goal of supporting international students in their educational journey.

---