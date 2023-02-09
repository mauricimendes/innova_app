import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  bool _theme;

  ThemeNotifier(this._theme);

  getTheme() => _theme;

  setTheme(bool darkMode) async {
    _theme = darkMode;
    notifyListeners();
  }
}
