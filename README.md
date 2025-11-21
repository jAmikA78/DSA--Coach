# DSA Coach

A comprehensive Flutter application designed to help Data Structure and Algorithms (DSA) learners, trainers, and competitive programmers master algorithmic concepts and track their problem-solving progress.

## Overview

DSA Coach is an educational platform that combines structured learning materials with practical problem-solving tracking. Whether you're a beginner learning DSA fundamentals or an advanced competitive programmer, this app provides all the resources you need in one place.

## Features

### 📚 Comprehensive Learning Materials

- **Blogs & Articles**: In-depth written explanations for each DSA topic
- **Video Tutorials**: Embedded video content explaining concepts visually
- **Structured Guides**: Step-by-step tutorials for understanding algorithms and data structures
- **Problem Collections**: Curated sets of practice problems for each topic

### 📊 Progress Tracking

- **Problem Solving Tracker**: Monitor problems you've solved across different DSA topics
- **Statistics Dashboard**: View your learning progress and problem-solving statistics
- **Performance Analytics**: Track your improvement over time

### 🎨 User Experience

- **Multiple Themes**: Light and dark mode support for comfortable learning
- **Intuitive Navigation**: Easy-to-use interface for browsing topics and problems
- **Customizable Settings**: Personalize your learning experience

## Getting Started

### Prerequisites

- Flutter SDK (version 3.3.0 or higher)
- Dart SDK (version 3.3.0 or higher)
- Android SDK (for Android development)
- Xcode (for iOS development)

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/jAmikA78/DSA--Coach.git
   cd dsa_coach
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the application**

   ```bash
   flutter run
   ```

### Build for Release

**Android:**

```bash
flutter build apk --release
```

**iOS:**

```bash
flutter build ios --release
```

## Project Structure

```bash
lib/
├── main.dart              # Application entry point
├── pages/                 # UI pages and screens
│   ├── HomePage.dart      # Main home screen
│   ├── TopicView.dart     # Topic details view
│   ├── SolvingView.dart   # Problem solving interface
│   ├── AddTopic.dart      # Add new topic functionality
│   ├── Statictics.dart    # Statistics and progress dashboard
│   └── Setting.dart       # Application settings
├── widgets/               # Reusable UI components
├── theme/                 # Theme configuration and styling
├── const/                 # Constants and static data
└── models/                # Data models (if any)

assets/
├── images/                # Application images and icons
└── JSON/                  # Data files and configurations
```

## Dependencies

Key packages used in this project:

- **flutter**: Core Flutter framework
- **theme_provider** (^0.6.0): Theme management
- **youtube_player_flutter** (^9.0.1): Embedded video support
- **url_launcher** (^6.2.6): Launch URLs
- **flutter_expandable_fab** (^2.0.0): Floating action button
- **text_area** (^0.0.3): Text input components
- **flutter_native_splash** (^2.4.0): Native splash screen

For the complete list of dependencies, see `pubspec.yaml`.

## Usage

### Home Screen

Browse all available DSA topics and start learning.

### Topic View

Access comprehensive materials including articles, videos, and explanations for each topic.

### Problem Solving

Solve practice problems and track your solutions.

### Statistics

View your progress metrics and learning statistics.

### Settings

Customize your theme preference and app settings.

## Contributing

We welcome contributions! If you'd like to contribute to DSA Coach:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Team

DSA Coach was developed by a dedicated team of passionate educators and developers:

- **Ahmed Ibrahim** - [GitHub](https://github.com/jAmikA78)
- **Ahmed Abbas** - [GitHub](https://github.com/3bbaas)
- **Mostafa Khatab** - [GitHub](https://github.com/Mostafa-khatab)
- **Ahmed Hammad** - [GitHub](https://github.com/Ahmed-Hammaad)

## License

MIT License

## Support

If you encounter any issues or have suggestions for improvement, please open an issue on our [GitHub repository](https://github.com/jAmikA78/DSA--Coach/issues).

---

**Happy Learning! 🚀**
