# 🐾 PawPal - Veterinary Pet Management App

A modern Flutter application designed to help veterinary clinics manage pet information, appointments, and medical records with a beautiful, intuitive interface.

## 📱 Current Features

### Core Functionality
- **Pet Profile Management**: View detailed information about pets including breed, age, weight, and owner details
- **Health Status Tracking**: Monitor pet health status (Healthy, Under Treatment, Needs Checkup)
- **Vaccination Records**: Track vaccination history for each pet
- **Search & Filter**: Search pets by name, breed, or owner name
- **Responsive Design**: Optimized for both mobile and tablet devices

### User Experience
- **Modern UI/UX**: Clean, intuitive interface with smooth animations
- **Dark/Light Theme**: Automatic theme switching based on system preferences
- **Haptic Feedback**: Tactile responses for better user interaction
- **Gradient Design**: Beautiful sunset-inspired color palette
- **Card-based Layout**: Organized information display with visual hierarchy

### Technical Features
- **State Management**: BLoC pattern implementation for robust state handling
- **Clean Architecture**: Separation of concerns with domain, data, and presentation layers
- **Repository Pattern**: Abstracted data access layer for future backend integration
- **Responsive Layout**: Adaptive design that works across different screen sizes

## 🏗️ Architecture

The application follows Clean Architecture principles with a clear separation of concerns:

```
lib/
├── domain/           # Business logic and entities
│   ├── entities/     # Core business objects (Dog)
│   ├── models/       # Data models
│   └── repositories/ # Abstract interfaces
├── data/             # Data layer implementation
│   └── repositories/ # Concrete repository implementations
├── presentation/     # UI layer
│   ├── blocs/        # State management (DogBloc, ThemeBloc)
│   ├── screens/      # App screens and pages
│   ├── theme/        # App theming and styling
│   └── widgets/      # Reusable UI components
└── configuration/    # App configuration files
```

### Key Components

- **Dog Entity**: Core data model representing a pet with comprehensive information
- **DogBloc**: Manages pet data state, search functionality, and selection
- **ThemeBloc**: Handles app theming with system theme detection
- **MockDogRepository**: Provides sample data for development and testing

## 🎨 Design System

### Color Palette
- **Primary**: Warm coral (#FF6B6B) and peach (#FFEAA7)
- **Backgrounds**: Soft, warm tones for light theme; deep, rich colors for dark theme
- **Status Colors**: Semantic colors for health status indicators
- **Text**: High contrast ratios for accessibility

### Typography
- **Headings**: Bold, clear hierarchy for easy scanning
- **Body Text**: Readable font sizes with appropriate line spacing
- **Status Labels**: Distinct styling for health status information

### Components
- **Cards**: Rounded corners with subtle shadows and borders
- **Buttons**: Consistent styling with hover states and feedback
- **Input Fields**: Modern form controls with focus states
- **Navigation**: Clean app bar with intuitive back navigation

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (^3.8.1)
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- Android emulator or physical device

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd PawPal
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

### Dependencies

The application uses the following key packages:

- **flutter_bloc**: State management using BLoC pattern
- **equatable**: Value equality for immutable objects
- **flutter_lints**: Code quality and style enforcement

## 📱 Screenshots

*Note: Screenshots will be added as the application progresses*

## 🔮 Roadmap

### Phase 1 (Current) ✅
- [x] Basic pet information display
- [x] Search and filter functionality
- [x] Theme switching (light/dark/system)
- [x] Responsive design implementation
- [x] Mock data repository

### Phase 2 (Planned)
- [ ] Pet profile editing
- [ ] Appointment scheduling system
- [ ] Medical records management
- [ ] Photo upload and management
- [ ] Owner contact information

### Phase 3 (Future)
- [ ] Backend integration
- [ ] User authentication
- [ ] Push notifications
- [ ] Offline data sync
- [ ] Multi-language support

## 🧪 Testing

The application includes a comprehensive testing strategy:

- **Unit Tests**: Business logic and BLoC testing
- **Widget Tests**: UI component testing
- **Integration Tests**: End-to-end user flow testing

Run tests with:
```bash
flutter test
```

## 📊 Performance

- **Fast Rendering**: Optimized widget tree for smooth scrolling
- **Memory Management**: Efficient state management with BLoC
- **Responsive UI**: Adaptive layouts for different screen sizes
- **Theme Switching**: Instant theme changes without performance impact

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Team

- **Developer**: [Your Name]
- **Design**: [Designer Name]
- **Project Manager**: [PM Name]

## 📞 Support

For support and questions:
- Create an issue in the repository
- Contact the development team
- Check the documentation

---

**PawPal** - Making veterinary care management simple and beautiful 🐾
