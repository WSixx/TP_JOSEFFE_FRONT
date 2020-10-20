import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tp_final/constants/colors.dart';

ThemeData light = ThemeData(
  brightness: kBrightnessLight,
  primarySwatch: kIndigo,
  accentColor: kPink,
  scaffoldBackgroundColor: kWhite,
);

ThemeData dark = ThemeData(
  brightness: kBrightnessDark,
  primarySwatch: kIndigo,
  accentColor: kPink,
);

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences _prefs;
  bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, _darkTheme);
  }
}
