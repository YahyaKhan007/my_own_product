import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import 'app_themes.dart';

class ThemeController extends GetxController {
  // Store the current theme mode (light or dark)
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;

  // Rx<ThemeMode> defaultThemeMode = ThemeMode.light.obs;

  Rx<ThemeData> selectedThemeData = AppThemes.lightTheme.obs;

  initializeSelectedTheme(ThemeData dynamicTheme) {}

  @override
  void onInit() async {
    super.onInit();
    loadTheme();
    // Example: Fetch data from an API
  }

  Future<bool> loadTheme() async {
    bool isDark = prefs.getBool('darkThemeEnabled') ?? false;

    themeMode.value = isDark ? ThemeMode.dark : ThemeMode.light;
    selectedThemeData.value = isDark ? AppThemes.darkTheme : AppThemes.lightTheme;
    updateUiStatusBar();

    return true;
  }

  // Toggle between light and dark mode
  void toggleTheme() async {
    themeMode.value = themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    selectedThemeData.value = themeMode.value == ThemeMode.dark
        ? AppThemes.darkTheme
        : AppThemes.lightTheme;

    bool isDark = themeMode.value == ThemeMode.dark;
    await prefs.setBool('darkThemeEnabled', isDark);
    updateUiStatusBar();
  }

  void updateUiStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,

        statusBarIconBrightness: themeMode.value == ThemeMode.dark
            ? Brightness
                  .light // Light icons for dark theme
            : Brightness.dark, // Dark icons for light theme
      ),
    );
  }
}
