import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  int _selectedTheme = 0;

  int get selectedTheme => _selectedTheme;

  void changeSelectedTheme(int selected) {
    _selectedTheme = selected;
    notifyListeners();
  }
}
