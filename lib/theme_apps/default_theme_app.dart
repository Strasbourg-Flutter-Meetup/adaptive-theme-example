// Project: Adaptive Theme Example
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231130085532
// 30.11.2023 08:55

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:adaptive_theme_example/screen/homepage.dart';
import 'package:flutter/material.dart';

/// `DefaultThemeApp` is a stateless widget that serves as the root of a Flutter
/// application with a default adaptive theme.
///
/// This widget uses the `AdaptiveTheme` package to set up default light and dark
/// themes for the application. It initializes with a light theme and provides
/// an option to switch to a dark theme based on system settings or user preferences.
///
/// Constructor:
///   `key` - (optional) The key for the widget.
///
/// The `build` method returns an `AdaptiveTheme` widget wrapping a `MaterialApp`. The
/// `AdaptiveTheme` is configured with:
///   - `initial`: Set to `AdaptiveThemeMode.light` to initialize the app with a light theme.
///   - `light`: The light theme configuration using `ThemeData.light()` with `useMaterial3` set to true.
///   - `dark`: The dark theme configuration using `ThemeData.dark()` with `useMaterial3` set to true.
///
/// Inside the `AdaptiveTheme` builder, a `MaterialApp` is returned with the following properties:
///   - `title`: Set to 'Adaptive Theme Example'.
///   - `debugShowCheckedModeBanner`: Disabled (set to false).
///   - `theme`: Set to the current light theme.
///   - `darkTheme`: Set to the current dark theme.
///   - `home`: Set to `MyHomePage` with a title.
///
/// Example Usage:
/// ```
/// const DefaultThemeApp()
/// ```
///
/// This class is particularly useful for scenarios where a straightforward,
/// adaptive theming approach is desired without the need for custom theme data.
class DefaultThemeApp extends StatelessWidget {
  const DefaultThemeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => AdaptiveTheme(
        initial: AdaptiveThemeMode.light,
        light: ThemeData.light(useMaterial3: true),
        dark: ThemeData.dark(useMaterial3: true),
        builder: (lightTheme, darkTheme) => MaterialApp(
          title: 'Adaptive Theme Example',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: const MyHomePage(title: 'Adaptive Theme Example'),
        ),
      );
}
