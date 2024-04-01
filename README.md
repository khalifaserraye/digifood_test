# Digifood Flutter App

## Introduction

Welcome to the Digifood Flutter app! This app provides a platform for managing products.

## Installation

To run the app, follow these steps:

1. Make sure you have Flutter installed on your system.
2. Clone this repository to your local machine.
3. Open the project in your preferred IDE or text editor.
4. Run `flutter pub get` to install dependencies.
5. Connect an Android device (6+) or set up an emulator.
6. Run `flutter run` to compile and run the app on your device or emulator.

## Usage

Once the app is running, you will be presented with the home screen. From there, you can navigate to the product list screen to view available products and add them to your cart. You can also add new products using the provided form.

## Folder Structure

The project follows a scalable folder structure to maintain code organization and readability:

- **lib/buisness_logic**: Contains the business logic of the app, including BLoCs for managing product-related functionality.
- **lib/data**: Manages data handling, including repositories and web services for fetching and manipulating product data.
- **lib/presentation**: The presentation layer.
- **lib/presentation/screens**: Contains the screens of the app, such as the home screen and product list screen.
- **lib/presentation/widgets**: Houses reusable widgets used throughout the app, like product tiles and forms.
- **lib/presentation/constants**: Stores constants used throughout the app, such as colors and URLs.
- **lib/presentation/utils**: Provides utility functions, such as toast messages for displaying notifications.

## State Management

The app utilizes the BLoC (Business Logic Component) pattern for state management, facilitated by the `flutter_bloc` package. Each screen or feature has its corresponding BLoC to manage its state and interact with repositories.

## Credits

This app was developed by Khalifa Serraye as part of the Digifood Flutter Frontend Technical Test. For any inquiries or assistance, please contact [khalifa.serraye@gmail.com](mailto:khalifa.serraye@gmail.com).