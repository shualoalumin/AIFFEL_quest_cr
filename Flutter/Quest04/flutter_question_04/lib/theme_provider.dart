//theme
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  Locale _locale = Locale('en');

  bool get isDarkMode => themeMode == ThemeMode.dark;
  Locale get locale => _locale;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void toggleLanguage(bool isKorean) {
    _locale = isKorean ? Locale('ko') : Locale('en');
    notifyListeners();
  }
}
