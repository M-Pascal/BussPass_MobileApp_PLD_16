# BussPass App Documentation

## Overview
BussPass is a mobile application built with Flutter that provides a comprehensive bus ticket booking and management system. The app offers features like user authentication, ticket booking, booking history viewing, and profile management through an intuitive interface.

## 🏗️ Architecture

### Project Structure
```
main.dart  
/pages
  ├── booking.dart         # Booking screen implementation
  ├── home_screen.dart     # Main home screen with featured content
  ├── login_page.dart      # User authentication screen
  ├── menu_screen.dart     # Navigation menu implementation
  ├── profile_screen.dart  # User profile management
  ├── tickets_screen.dart  # Ticket history and management
  └──          # Application entry point and navigation setup
```

### Core Components

#### 1. Navigation System
- Implements a bottom navigation bar with four main sections:
  - Home
  - Explore (Booking)
  - Tickets
  - Profile
- Uses `BottomNavigationBarType.fixed` for consistent navigation experience
- Custom styled with dark blue background (`Colors.blue[900]`)
- Responsive state management using `StatefulWidget`

#### 2. Screen Architecture
- **Login Screen**: Entry point for user authentication
- **Home Screen**: Dashboard with featured destinations and quick actions
- **Booking Screen**: Interface for searching and booking bus tickets
- **Tickets Screen**: Shows booking history and ticket management
- **Profile Screen**: User profile settings and preferences

## 🎨 UI/UX Design

### Key Features
1. **Authentication Flow**
   - Clean login interface
   - Sign-up capability
   - Password recovery option

2. **Booking System**
   - Search functionality
   - Date and route selection
   - Seat selection interface
   - Payment integration

3. **Ticket Management**
   - Digital ticket display
   - QR code generation
   - Booking history
   - Ticket status tracking

4. **Profile Management**
   - User information management
   - Settings configuration
   - Preferences customization

### Design System
- **Color Scheme**
  - Primary: Dark Blue (`Colors.blue[900]`)
  - Secondary: White for selected items
  - Tertiary: Light Grey for unselected items
- **Navigation**
  - Fixed bottom navigation bar
  - Intuitive icons for main features
  - Consistent layout across screens

## 💻 Technical Implementation

### Main Application Structure
```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Root widget with MaterialApp configuration
  // Handles theme and initial route
}

class MainScreen extends StatefulWidget {
  // Manages navigation state
  // Houses bottom navigation bar
}
```

### State Management
- Uses Flutter's built-in state management with `StatefulWidget`
- Page index tracking for navigation
- Screen state preservation during navigation

### Navigation Flow
1. Application starts at `LoginPage()`
2. After authentication, redirects to `MainScreen()`
3. `MainScreen` manages navigation between four main sections:
   - `HomeScreen()`
   - `Booking()`
   - `TicketHistoryScreen()`
   - `ProfilePage()`

## 🚀 Getting Started

### Prerequisites
- Flutter SDK
- Dart SDK
- Android Studio/VS Code with Flutter plugins

### Installation
1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Ensure you have a connected device or emulator
4. Run `flutter run` to start the application

### Branch Management
Based on the repository structure:
- `main`: Production-ready code
- `chrisostome`: Feature development branch
- `pasco`: Feature development branch
- `mutabazi`: Feature development branch
- `geu`: Feature development branch
- `kuir`: Feature development branch
- `madol`: Feature development branch

## 🔧 Development Guidelines

### Code Style
- Follow Flutter/Dart style guidelines
- Use consistent naming conventions
- Implement proper widget separation
- Maintain clean architecture principles

### Best Practices
1. Use constants for repeated values
2. Implement proper error handling
3. Follow material design guidelines
4. Write clean, maintainable code
5. Document complex logic
6. Use proper widget keys for testing

## 📱 Features & Screens

### Login Page
- User authentication
- Form validation
- Error handling
- Remember me functionality

### Home Screen
- Featured destinations
- Quick booking options
- Special offers
- Recent searches

### Booking
- Route selection
- Date picker
- Seat selection
- Fare calculator
- Payment integration

### Tickets
- Digital ticket display
- QR code generation
- Booking history
- Cancel/Modify options

### Profile
- User information
- Settings management
- Preferences
- Logout functionality
