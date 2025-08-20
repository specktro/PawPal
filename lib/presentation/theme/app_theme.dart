import 'package:flutter/material.dart';

enum AppThemeMode { light, dark, system }

class AppTheme {
  // Warm Sunset Color Palette
  static const Color primaryCoral = Color(0xFFFF6B6B);
  static const Color primaryPeach = Color(0xFFFFEAA7);
  static const Color secondaryOrange = Color(0xFFFAB1A0);
  
  // Light Theme Colors
  static const Color lightBackground = Color(0xFFFFF5F5);
  static const Color lightSurface = Color(0xFFFEF7F0);
  static const Color lightCardBackground = Color(0xFFFFFFFF);
  static const Color lightTextPrimary = Color(0xFF2D3436);
  static const Color lightTextSecondary = Color(0xFF636E72);
  
  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF1A1A1A);
  static const Color darkSurface = Color(0xFF2D2D2D);
  static const Color darkCardBackground = Color(0xFF3D3D3D);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFCCCCCC);
  
  // Status Colors
  static const Color healthyLight = Color(0xFFD1F2EB);
  static const Color healthyLightText = Color(0xFF0E6E4F);
  static const Color healthyDark = Color(0xFF4CAF50);
  static const Color healthyDarkText = Color(0xFF81C784);
  
  static const Color treatmentLight = Color(0xFFFCE4EC);
  static const Color treatmentLightText = Color(0xFFAD1457);
  static const Color treatmentDark = Color(0xFFFF9800);
  static const Color treatmentDarkText = Color(0xFFFFB74D);
  
  static const Color needsCheckupLight = Color(0xFFFFEBEE);
  static const Color needsCheckupLightText = Color(0xFFC62828);
  static const Color needsCheckupDark = Color(0xFFF44336);
  static const Color needsCheckupDarkText = Color(0xFFE57373);

  // Light Theme Data
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryCoral,
      brightness: Brightness.light,
      primary: primaryCoral,
      secondary: primaryPeach,
      background: lightBackground,
      surface: lightSurface,
      onPrimary: Colors.white,
      onSecondary: lightTextPrimary,
      onBackground: lightTextPrimary,
      onSurface: lightTextPrimary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryCoral,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    // HERE IS THE CARDTHEME DEFINITION FOR LIGHT MODE
    cardTheme: CardThemeData(
      color: lightCardBackground,
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: primaryCoral.withOpacity(0.2),
          width: 1,
        ),
      ),
      shadowColor: Colors.black.withOpacity(0.1),
      surfaceTintColor: lightSurface,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(color: primaryCoral.withOpacity(0.2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(color: primaryCoral, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      hintStyle: TextStyle(color: lightTextSecondary),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryCoral,
      foregroundColor: Colors.white,
      elevation: 6,
      shape: CircleBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryCoral,
        foregroundColor: Colors.white,
        elevation: 3,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryCoral,
        side: const BorderSide(color: primaryCoral, width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
  );

  // Dark Theme Data
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryCoral,
      brightness: Brightness.dark,
      primary: primaryCoral,
      secondary: primaryPeach,
      background: darkBackground,
      surface: darkSurface,
      onPrimary: Colors.white,
      onSecondary: darkTextPrimary,
      onBackground: darkTextPrimary,
      onSurface: darkTextPrimary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryCoral,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    // HERE IS THE CARDTHEME DEFINITION FOR DARK MODE
    cardTheme: CardThemeData(
      color: darkCardBackground,
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: primaryCoral.withOpacity(0.3),
          width: 1,
        ),
      ),
      shadowColor: Colors.black.withOpacity(0.3),
      surfaceTintColor: darkSurface,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkCardBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(color: primaryCoral.withOpacity(0.3)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(color: primaryCoral, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      hintStyle: TextStyle(color: darkTextSecondary),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryCoral,
      foregroundColor: Colors.white,
      elevation: 8,
      shape: CircleBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryCoral,
        foregroundColor: Colors.white,
        elevation: 4,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryCoral,
        side: const BorderSide(color: primaryCoral, width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
  );

  // Get status colors based on theme
  static Color getStatusBackgroundColor(String status, bool isDark) {
    switch (status.toLowerCase()) {
      case 'healthy':
        return isDark ? healthyDark.withOpacity(0.2) : healthyLight;
      case 'under treatment':
        return isDark ? treatmentDark.withOpacity(0.2) : treatmentLight;
      case 'needs checkup':
        return isDark ? needsCheckupDark.withOpacity(0.2) : needsCheckupLight;
      default:
        return isDark ? Colors.grey.withOpacity(0.2) : Colors.grey.shade100;
    }
  }

  static Color getStatusTextColor(String status, bool isDark) {
    switch (status.toLowerCase()) {
      case 'healthy':
        return isDark ? healthyDarkText : healthyLightText;
      case 'under treatment':
        return isDark ? treatmentDarkText : treatmentLightText;
      case 'needs checkup':
        return isDark ? needsCheckupDarkText : needsCheckupLightText;
      default:
        return isDark ? Colors.grey.shade400 : Colors.grey.shade600;
    }
  }

  static Color getStatusBorderColor(String status, bool isDark) {
    switch (status.toLowerCase()) {
      case 'healthy':
        return isDark ? healthyDark : healthyLightText;
      case 'under treatment':
        return isDark ? treatmentDark : treatmentLightText;
      case 'needs checkup':
        return isDark ? needsCheckupDark : needsCheckupLightText;
      default:
        return isDark ? Colors.grey.shade600 : Colors.grey.shade400;
    }
  }
}