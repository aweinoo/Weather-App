import 'package:flutter/material.dart';
import 'weather_screen.dart';

// --- Define Custom Colors ---
const Color _appDarkColor = Color(0xFF2C1D27);
const Color _appBeigeColor = Color(0xFFE5D1AE);
const Color _appRedAccentColor = Color(0xFFBF2E1B);

// ---- Light theme colors -----
const Color _darkCoffeeColor = Color(0xFF1a1715);
const Color _lightBeigeColor = Color(0xFFf4f0de);
const Color _cinnamonBrownColor = Color(0xFF925223);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // --- Theme Building Logic ---
  AppBarTheme _buildAppBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      backgroundColor:
          colorScheme.primary, // Use primary color from updated ColorScheme
      foregroundColor: colorScheme.onPrimary,

      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: colorScheme.onPrimary, // explicitly set title color
      ),
      iconTheme: IconThemeData(
        color: colorScheme.onPrimary,
      ), // ensure icons follow color
    );
  }

  CardTheme _buildCardTheme(Color cardColor) {
    return CardTheme(color: cardColor);
  }

  ThemeData _buildDarkTheme() {
    final baseTheme = ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
    );
    final darkColorScheme = baseTheme.colorScheme.copyWith(
      brightness: Brightness.dark,
      primary: _appDarkColor, // AppBar background
      onPrimary: _appBeigeColor, // AppBar text/icons
      secondary: _appRedAccentColor,
      onSecondary: Colors.white,
      surface: _appRedAccentColor,
      onSurface: Colors.white,
      error: _appRedAccentColor,
      onError: Colors.white,
    );
    return baseTheme.copyWith(
      colorScheme: darkColorScheme,
      scaffoldBackgroundColor: _appDarkColor,
      appBarTheme: _buildAppBarTheme(darkColorScheme),
      cardTheme: _buildCardTheme(_appRedAccentColor),
      textTheme: baseTheme.textTheme
          .apply(bodyColor: _appBeigeColor, displayColor: _appBeigeColor)
          .copyWith(
            titleLarge: const TextStyle(
              fontWeight: FontWeight.bold,
              color: _appBeigeColor,
            ),
          ),
      iconTheme: const IconThemeData(color: _appBeigeColor),
    );
  }

  ThemeData _buildLightTheme() {
    final baseTheme = ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
    );
    final lightColorScheme = baseTheme.colorScheme.copyWith(
      brightness: Brightness.light,
      primary: _lightBeigeColor, // AppBar background
      onPrimary: _darkCoffeeColor, // AppBar text/icons
      secondary: _lightBeigeColor,
      onSecondary: Colors.white,
      surface: Colors.white,
      onSurface: _darkCoffeeColor,
      error: _cinnamonBrownColor,
      onError: Colors.white,
    );
    return baseTheme.copyWith(
      colorScheme: lightColorScheme,
      scaffoldBackgroundColor: _lightBeigeColor,
      appBarTheme: _buildAppBarTheme(lightColorScheme),
      cardTheme: _buildCardTheme(_lightBeigeColor),
      textTheme: baseTheme.textTheme
          .apply(bodyColor: _cinnamonBrownColor, displayColor: _darkCoffeeColor)
          .copyWith(
            titleLarge: const TextStyle(
              fontWeight: FontWeight.bold,
              color: _cinnamonBrownColor,
            ),
          ),
      iconTheme: const IconThemeData(color: _cinnamonBrownColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light, // still forces dark mode
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      home: const WeatherScreen(),
    );
  }
}
