# Car Rental App - Modern Login/Signup UI

A modern Flutter application featuring an elegant login and signup interface for a car rental service. The app showcases beautiful animations, glassmorphism effects, and social media integration.

## Features

- 🎨 Modern UI with glassmorphism effects and gradient overlays
- 🚗 HD car background images with smooth transitions
- ✨ Smooth animations using animate_do package
- 🔐 Secure Login and Signup screens
- 🌐 Social media login integration (Google, Facebook, Instagram)
- 📱 Fully responsive design for all screen sizes
- 🎯 Material 3 design implementation with custom themes
- 🔤 Custom Google Fonts (Poppins) integration
- 🎭 Custom animated backgrounds
- 🔒 Form validation and error handling

## Project Structure

```plaintext
lib/
├── config/
│   ├── routes.dart          # App navigation routes
│   └── constants.dart        # Global constants and configurations
├── screens/
│   ├── auth/
│   │   ├── login_screen.dart    # Login screen implementation
│   │   └── signup_screen.dart   # Signup screen implementation
│   └── splash_screen.dart       # Initial loading screen
├── widgets/
│   ├── auth/
│   │   ├── custom_text_field.dart   # Custom input fields
│   │   └── social_login_button.dart # Social media login buttons
│   └── common/
│       └── animated_background.dart # Animated background implementation
├── utils/
│   └── theme.dart           # Custom theme configurations
└── main.dart               # App entry point

assets/
├── animations/            # Lottie animation files
└── images/
    └── social/           # Social media icons
        ├── google.png
        ├── facebook.png
        └── instagram.png