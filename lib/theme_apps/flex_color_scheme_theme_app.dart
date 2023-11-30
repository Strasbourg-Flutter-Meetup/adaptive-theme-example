// Project: Adaptive Theme Example
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231130100037
// 30.11.2023 10:00
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:adaptive_theme_example/screen/homepage.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// `FlexColorSchemeThemeApp` is a stateless widget that serves as the root of a
/// Flutter application, utilizing FlexColorScheme for adaptive theming.
///
/// This widget leverages the `FlexColorScheme` package to create rich and customizable
/// light and dark themes. It provides a detailed configuration for both themes, including
/// color schemes, surface modes, blend levels, sub-theme data, and more.
///
/// Constructor:
///   `key` - (optional) The key for the widget.
///
/// In the `build` method, two ThemeData instances are created:
///   - `light`: Configured using `FlexThemeData.light`, with a set of detailed parameters
///     such as color scheme (red), surface mode, blend level, sub-theme data, and
///     platform-specific visual density. The theme also adopts Material 3 design
///     principles and includes legacy swaps on Material 3 components.
///   - `dark`: Similar to `light`, but using `FlexThemeData.dark`, and with different
///     blend levels and sub-theme data adjustments for dark mode aesthetics.
///
/// The `AdaptiveTheme` widget is then used to apply these themes, with the initial mode
/// set to light. The `AdaptiveTheme` builder provides a `MaterialApp` with:
///   - `title`: Set to 'Adaptive Theme Example'.
///   - `debugShowCheckedModeBanner`: Disabled (set to false).
///   - `theme`: Set to the current light theme.
///   - `darkTheme`: Set to the current dark theme.
///   - `home`: Set to `MyHomePage` with a title.
///
/// Example Usage:
/// ```
/// const FlexColorSchemeThemeApp()
/// ```
///
/// This class is ideal for applications seeking to implement a sophisticated theming
/// approach with fine control over color schemes, styles, and densities, while still
/// benefiting from the adaptive capabilities of `AdaptiveTheme`.
class FlexColorSchemeThemeApp extends StatelessWidget {
  const FlexColorSchemeThemeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final light = FlexThemeData.light(
      scheme: FlexScheme.red,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 7,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 10,
        blendOnColors: false,
        useTextTheme: true,
        useM2StyleDividerInM3: true,
        alignedDropdown: true,
        useInputDecoratorThemeInDialogs: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
    );

    final dark = FlexThemeData.dark(
      scheme: FlexScheme.red,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 13,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        useTextTheme: true,
        useM2StyleDividerInM3: true,
        alignedDropdown: true,
        useInputDecoratorThemeInDialogs: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
    );

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
