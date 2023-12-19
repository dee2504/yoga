

# Yoga Class Registration App

## Overview

This application is a Flutter web-based solution for registering users for yoga classes. It offers a user-friendly interface for class enrollment, handling user data through Firebase Firestore.

## Features

- **Responsive UI**: A clean and responsive user interface compatible with various screen sizes.
- **User Registration Form**: A form to register users with fields for name, age, phone number, and batch selection.
- **Form Validation**: Ensures all data entered is valid, including a check for age and phone number format.
- **Firebase Firestore Integration**: Uses Firebase Firestore to store and retrieve user data.
- **Duplicate Handling**: Checks for existing registrations based on phone number and name.
- **Monthly Registration Check**: Allows users to register only if they haven't registered in the current month.
- **Error Handling**: Displays error messages through overlay cards with blur effects for better user interaction.
- **Animated Slogans**: Features animated text for yoga slogans, enhancing the visual appeal.

## Getting Started

### Prerequisites

- Flutter (Channel stable, latest version)
- Dart SDK
- An active Firebase project

### Installation

1. Clone the repo:
   ```sh
   git clone https://github.com/your_username_/yoga_class_registration.git
   ```
2. Navigate to the project directory and install dependencies:
   ```sh
   flutter pub get
   ```
3. Build the project for the web:
   ```sh
   flutter build web
   ```

### Running Locally

To run the application locally on your development machine:
```sh
flutter run -d chrome
```

### Deployment

The app is built for web deployment and can be hosted on platforms like Netlify or Firebase Hosting.

## Usage

The app can be used by yoga class providers for managing monthly class registrations. Users can enter their details, choose a batch, and register for the classes.

## Contributing

Contributions to enhance the app are welcome. Please read `CONTRIBUTING.md` for details on our code of conduct and the process for submitting pull requests.

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

Your Name - deepanshisingh2504@gmail.com

Project Link: [https://github.com/dee2504/yoga](https://github.com/dee2504/yoga)

---

