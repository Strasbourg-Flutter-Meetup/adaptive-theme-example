// Project: Adaptive Theme Example
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231130085541
// 30.11.2023 08:55

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

/// Global string variable that holds the current theme mode of the app.
///
/// `currentMode` is initialized as an empty string and is updated to either 'dark' or 'light'
/// based on the user's theme preference. This variable is used throughout the application
/// to determine and switch between the current theme modes.
String currentMode = '';

/// Constant string used as a standard identifier for the dark theme mode.
///
/// `dark` is used in comparison and assignment operations to set or evaluate the theme mode
/// of the application as dark. It works in conjunction with `currentMode` to manage theme settings.
const String dark = 'dark';

/// Constant string used as a standard identifier for the light theme mode.
///
/// `light` serves a similar purpose as `dark`, but for the light theme mode. It is used in
/// various parts of the application to compare, set, or check if the current theme mode is light.
const String light = 'light';


/// `MyHomePage` is a StatefulWidget that serves as the primary screen of the application.
///
/// This widget displays a counter and a button to increment it. It also includes an
/// AppBar with an action to toggle between light and dark modes.
///
/// Constructor Parameters:
///   `key` - (optional) The key for the widget.
///   `title` - A `String` representing the title displayed in the AppBar.
///
/// The state of this widget (`_MyHomePageState`) manages:
///   - The counter value (`_counter`), which is displayed in the center of the screen.
///   - The current theme mode (`currentMode`), which can be toggled between `dark` and
///     `light` using an IconButton in the AppBar.
///
/// The AppBar's IconButton switches the theme mode of the application using
/// `AdaptiveTheme.of(context).setLight()` or `.setDark()` and updates the `currentMode`
/// accordingly. The icon of the IconButton changes to reflect the current theme mode.
///
/// The body of the widget consists of a column displaying the number of times the
/// increment button (a FloatingActionButton) has been pressed.
///
/// Example Usage:
/// ```
/// MyHomePage(title: 'Adaptive Theme Example')
/// ```
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (currentMode == dark) {
                  AdaptiveTheme.of(context).setLight();
                  currentMode = light;
                } else {
                  AdaptiveTheme.of(context).setDark();
                  currentMode = dark;
                }
              });
            },
            icon: Icon(
              currentMode == dark ? Icons.light_mode : Icons.dark_mode,
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
