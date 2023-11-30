import 'dart:convert';

import 'package:adaptive_theme_example/theme_apps/appainter_theme_app.dart';
import 'package:adaptive_theme_example/theme_apps/default_theme_app.dart';
import 'package:adaptive_theme_example/theme_apps/flex_color_scheme_theme_app.dart';
import 'package:adaptive_theme_example/theme_apps/seed_color_theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';

/// Enumeration representing different application modes for theme selection.
///
/// This enum defines various application modes that determine the theme to be
/// applied to the Flutter application. Each mode corresponds to a specific theme
/// configuration for the app.
///
/// - [defaultApp]: The default application mode that uses the standard theme.
/// - [seedColor]: The seed color application mode for custom theme customization.
/// - [appainter]: The Appainter application mode with dynamically loaded themes.
/// - [flexColorScheme]: The FlexColorScheme application mode for theme customization.
enum ApplicationMode {
  /// Default application mode.
  defaultApp,

  /// Seed color application mode.
  seedColor,

  /// Appainter application mode.
  appainter,

  /// FlexColorScheme application mode.
  flexColorScheme,
}

/// The selected [ApplicationMode] for the Flutter application.
///
/// This variable determines the application's theme configuration based on the
/// chosen [ApplicationMode] enum value. The selected mode specifies which theme
/// will be applied to the Flutter app when it is initialized.
ApplicationMode _applicationMode = ApplicationMode.flexColorScheme;
/// Initializes and runs a Flutter application with dynamic theming capabilities.
///
/// This function serves as the entry point of the application. It starts by
/// ensuring that the Flutter engine is properly initialized.
///
/// The application then decides which theme to use based on the value of the global
/// variable `_applicationMode`. This variable is of type `ApplicationMode`, an enum
/// that specifies various theming modes.
///
/// Depending on the value of `_applicationMode`, the application sets `themeApp` to
/// a specific StatelessWidget that represents the selected theme:
/// - `ApplicationMode.seedColor`: Sets `themeApp` to `SeedColorThemeApp`, which uses
///   a theme based on seed colors.
/// - `ApplicationMode.appainter`: Sets `themeApp` to `AppainterThemeApp` with custom
///   light and dark themes obtained from `_getAppainterThemeData`.
/// - `ApplicationMode.flexColorScheme`: Sets `themeApp` to `FlexColorSchemeThemeApp`,
///   a theme based on FlexColorScheme.
/// - `ApplicationMode.defaultApp` or in the default case: Sets `themeApp` to
///   `DefaultThemeApp`, which is the default theme of the app.
///
/// Finally, the application is run with the selected theme by calling `runApp` with
/// `themeApp` as the argument.
///
/// Note: This function is asynchronous due to the potential async operation in
/// loading custom themes for the `appainter` mode.

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  StatelessWidget themeApp = const Placeholder();

  switch (_applicationMode) {
    case ApplicationMode.seedColor:
      themeApp = const SeedColorThemeApp();
      break;
    case ApplicationMode.appainter:
      final appainterThemes = await _getAppainterThemeData();

      themeApp = AppainterThemeApp(
        light: appainterThemes.$1,
        dark: appainterThemes.$2,
      );
      break;
    case ApplicationMode.flexColorScheme:
      themeApp = const FlexColorSchemeThemeApp();
      break;
    case ApplicationMode.defaultApp:
    default:
      themeApp = const DefaultThemeApp();
  }

  runApp(themeApp);
}

/// Asynchronously retrieves the light and dark theme data for the appainter mode.
///
/// This function loads theme data from two JSON files: one for the light theme and
/// one for the dark theme. It utilizes the `_loadThemeData` helper function to
/// asynchronously load and decode theme data from these files.
///
/// Returns a Dart record containing two `ThemeData` objects:
/// - The first element represents the light theme data.
/// - The second element represents the dark theme data.
///
/// The returned record is a tuple-like structure, making it convenient to handle
/// multiple related values as a single unit.
///
/// Example Usage:
/// ```
/// final appainterThemes = await _getAppainterThemeData();
/// ```
///
/// Returns:
///   A `Future` that resolves to a record `(ThemeData, ThemeData)`, where the first
///   item is the light theme and the second item is the dark theme.
Future<(ThemeData, ThemeData)> _getAppainterThemeData() async {
  final themeLight = await _loadThemeData(
    'appainter_theme_light.json',
  );

  final themeDark = await _loadThemeData(
    'appainter_theme_dark.json',
  );
  return (
    themeLight,
    themeDark,
  );
}

/// Asynchronously loads and decodes theme data from a specified JSON file.
///
/// This function is a utility to assist in dynamically setting the theme of the application.
/// It takes the name of a theme JSON file, loads the file content, and decodes it into
/// a `ThemeData` object using the `ThemeDecoder`.
///
/// The JSON file is expected to be located in the `appainter` directory. The function
/// concatenates the directory path with the provided file name to locate the file.
///
/// Parameter:
///   `themeFileName` - A `String` representing the name of the theme file. This file
///                     should be a valid JSON file containing theme data.
///
/// Returns:
///   A `Future` that resolves to a `ThemeData` object representing the theme data
///   decoded from the specified JSON file.
///
/// Throws:
///   An error if the JSON file is not found, or if the file content is not a valid
///   JSON format for theme data.
///
/// Example Usage:
/// ```
/// final theme = await _loadThemeData('light_theme.json');
/// ```
Future<ThemeData> _loadThemeData(String themeFileName) async {
  final jsonString = await rootBundle.loadString('appainter/$themeFileName');
  final jsonMap = jsonDecode(jsonString);
  return ThemeDecoder.decodeThemeData(jsonMap)!;
}
