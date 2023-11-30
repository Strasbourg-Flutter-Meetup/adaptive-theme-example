// Project: Adaptive Theme Example
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231130085720
// 30.11.2023 08:57
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:adaptive_theme_example/screen/homepage.dart';
import 'package:flutter/material.dart';

/// `SeedColorThemeApp` is a stateless widget that acts as the root of a Flutter
/// application, implementing seed color-based adaptive theming.
///
/// This widget uses seed color-based theming to create ThemeData for both light and dark
/// modes. It leverages the `ColorScheme.fromSeed` method to generate color schemes
/// for the themes based on a specified seed color.
///
/// Constructor:
///   `key` - (optional) The key for the widget.
///
/// In the `build` method, two ThemeData instances are created:
///   - `lightMode`: Configured with a light color scheme derived from a blue-grey seed color.
///   - `darkMode`: Configured with a dark color scheme derived from the same blue-grey seed color.
///
/// The `AdaptiveTheme` widget is then utilized to apply these themes, with the initial
/// theme mode set to light. The `AdaptiveTheme` builder creates a `MaterialApp` with:
///   - `title`: Set to 'Adaptive Theme Example'.
///   - `debugShowCheckedModeBanner`: Disabled (set to false).
///   - `theme`: Set to the current light theme.
///   - `darkTheme`: Set to the current dark theme.
///   - `home`: Set to `MyHomePage` with a title.
///
/// Example Usage:
/// ```
/// const SeedColorThemeApp()
/// ```
///
/// This class is particularly useful for creating cohesive light and dark themes
/// automatically from a single seed color, simplifying theme management while
/// providing visually appealing results.
class SeedColorThemeApp extends StatelessWidget {
  const SeedColorThemeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final lightMode = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: Colors.blueGrey,
      ),
    );

    final darkMode = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: Colors.blueGrey,
      ),
    );

    return AdaptiveTheme(
      initial: AdaptiveThemeMode.light,
      light: lightMode,
      dark: darkMode,
      builder: (lightTheme, darkTheme) => MaterialApp(
        title: 'Adaptive Theme Example',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const MyHomePage(title: 'Adaptive Theme Example'),
      ),
    );
  }
}
