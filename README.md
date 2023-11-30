# Adaptive Theme Example App

This Flutter application demonstrates dynamic theming capabilities using various theme modes. It
allows users to switch between light and dark themes and showcases different theming approaches.

## Getting Started

To get started with this project, clone the repository to your local machine. Ensure that you have
Flutter installed and set up. You can follow the official
Flutter [installation guide](https://flutter.dev/docs/get-started/install) for assistance.

### Prerequisites

- Flutter SDK
- Dart SDK
- An IDE (e.g., Android Studio, VS Code)

### Installation

1. Clone the repository:

git clone [https://github.com/Strasbourg-Flutter-Meetup/adaptive-theme-example.git]

2. Navigate to the project directory:

```cd adaptive_theme_example```

3. Run the app on a web browser:

```flutter run``` and select your browser

## Application Structure

The application demonstrates the usage of adaptive theming with different theme modes. Here's a
breakdown of the main components:

### Constants

- `String currentMode`: Manages the current theme mode of the application.
- `const String dark`: Standard identifier for the dark theme mode.
- `const String light`: Standard identifier for the light theme mode.

### Main Entry Point

- `main()`: The entry point of the application. It initializes the Flutter app and sets the theme
  based on the current mode.

### Theme Mode Classes

1. `AppainterThemeApp`: A widget that uses custom themes for light and dark modes.
2. `DefaultThemeApp`: Implements a basic adaptive theme.
3. `FlexColorSchemeThemeApp`: Utilizes FlexColorScheme for more sophisticated theming.
4. `SeedColorThemeApp`: Generates light and dark themes from a seed color.

### Home Page

- `MyHomePage`: The primary screen of the application. It includes a counter and a theme toggle
  button in the AppBar.

## Contributing

Contributions to this project are welcome. Please follow the standard fork-and-pull request
workflow.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

- Flutter team for the amazing framework.
- Contributors to the FlexColorScheme and AdaptiveTheme packages.

---

For more information on Flutter development,
visit [Flutter's official documentation](https://flutter.dev/docs).
