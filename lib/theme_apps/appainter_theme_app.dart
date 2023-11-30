// Project: Adaptive Theme Example
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231130093505
// 30.11.2023 09:35
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:adaptive_theme_example/screen/homepage.dart';
import 'package:flutter/material.dart';

/// `AppainterThemeApp` is a stateless widget that provides an adaptive theming
/// experience for a Flutter application.
///
/// This widget acts as the root of the application and is responsible for setting
/// up the light and dark themes using the `AdaptiveTheme` package. It dynamically
/// switches between the provided light and dark themes based on the system settings
/// or user preferences.
///
/// Constructor Parameters:
///   `key` - (optional) The key for the widget.
///   `light` - A `ThemeData` object representing the light theme of the application.
///   `dark` - A `ThemeData` object representing the dark theme of the application.
///
/// Both `light` and `dark` themes are required and are used to configure the adaptive
/// theme settings.
///
/// The `build` method of this widget returns an `AdaptiveTheme` widget that wraps a
/// `MaterialApp`. It sets the `theme` and `darkTheme` properties of `MaterialApp` to
/// the provided `light` and `dark` theme data respectively.
///
/// The `MaterialApp` has its title set to 'Adaptive Theme Example' and the home set to
/// `MyHomePage` with a title.
///
/// Example Usage:
/// ```
/// AppainterThemeApp(
///   light: myLightTheme,
///   dark: myDarkTheme,
/// )
/// ```

class AppainterThemeApp extends StatelessWidget {
  const AppainterThemeApp({
    super.key,
    required this.light,
    required this.dark,
  });

  final ThemeData light;
  final ThemeData dark;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.light,
      light: light,
      dark: dark,
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
