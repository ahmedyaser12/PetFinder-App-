# 🐾 Find Your Forever Pet

A beautiful and intuitive Flutter application for pet adoption, helping users discover and connect with their perfect furry, feathered, or scaly companion.

## 📱 Features

- **Browse Pets**: View available pets with detailed information
- **Category Filtering**: Filter pets by type (Cats, Dogs, Birds, Fish, Reptiles)
- **Search Functionality**: Quick search to find specific pets
- **Favorites**: Save your favorite pets for later
- **Messaging**: Chat with pet owners or shelters
- **User Profile**: Manage your adoption profile
- **Distance Display**: See how far away each pet is from you
- **Responsive Design**: Beautiful UI that works on all screen sizes

## 🏗️ Architecture

This project follows clean architecture principles with clear separation of concerns:

```
lib/
├── main.dart                 # App entry point
├── screens/
│   ├── main_screen.dart      # Main navigation container
│   ├── home_screen.dart      # Pet listing screen
│   ├── favorite_screen.dart  # Saved pets
│   ├── chat_screen.dart      # Messages
│   └── profile_screen.dart   # User profile
├── widgets/
│   ├── header_section.dart   # App header
│   ├── search_bar.dart       # Search component
│   ├── category_section.dart # Category filters
│   ├── category_chip.dart    # Individual category
│   ├── pet_list_section.dart # Pet list container
│   ├── pet_card.dart         # Individual pet card
│   └── bottom_nav_bar.dart   # Navigation bar
├── models/
│   └── pet.dart              # Pet data model
├── services/
│   └── pet_service.dart      # Pet data service (to be implemented)
└── utils/
    └── constants.dart        # App constants (to be implemented)
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- Android Studio / VS Code with Flutter extensions
- iOS Simulator / Android Emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/ahmedyaser12/PetFinder-App-.git
   cd find-your-forever-pet
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 🧪 Testing

### Unit Tests
Unit tests are located in `test/unit/` directory.

```bash
# Run all unit tests
flutter test test/unit/

# Run specific test file
flutter test test/unit/models/pet_test.dart

# Run with coverage
flutter test --coverage
```

### Integration Tests
Integration tests are located in `integration_test/` directory.

```bash
# Run all integration tests
flutter test integration_test/

# Run specific integration test
flutter test integration_test/app_test.dart
```

### Widget Tests
Widget tests ensure UI components render correctly.

```bash
# Run widget tests
flutter test test/widgets/
```

### Test Coverage
Generate and view test coverage report:

```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## 📂 Project Structure

### Screens
- **MainScreen**: Container managing bottom navigation and screen switching
- **HomeScreen**: Main pet discovery interface with search and filters

### Widgets
- **Reusable Components**: All UI elements are broken into small, testable widgets
- **Stateful/Stateless**: Proper use of state management
- **Responsive Design**: Adaptive layouts for different screen sizes

### Models
- **Pet Model**: Data structure for pet information
    - Name, Gender, Age
    - Distance from user
    - Image URL
    - Additional metadata

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Coding Standards
- Follow Dart style guide
- Write meaningful commit messages
- Add tests for new features
- Update documentation
- Keep widgets small and focused

## 🐛 Known Issues

- Images load from external URLs (placeholder implementation)
- Category filtering not yet connected to data
- Search functionality not implemented
- Favorite action has no backend connection

## 👥 Authors

- **Ahmed Yaser** - *Initial work* - [Your GitHub Profile](https://github.com/ahmedyaser12)

