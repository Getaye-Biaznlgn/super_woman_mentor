import 'package:flutter/material.dart';
import 'package:super_woman_user/utils/constants.dart';
import '../services/storage_manager.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      fontFamily: 'poppins',
      backgroundColor: const Color(0xFF212121),
      scaffoldBackgroundColor: kDarkBlueColor,
      // accentColor: Colors.white,
      // accentIconTheme: IconThemeData(color: Colors.black),
      dividerColor: Colors.black12,
      appBarTheme:
          const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
      inputDecorationTheme: getInputDecorationTheme(const Color(0xffffffff)));

  final lightTheme = ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: const Color(0xffffffff),
      fontFamily: 'poppins',
      appBarTheme:
          const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
      // accentColor: Colors.black,
      // accentIconTheme: IconThemeData(color: Colors.white),
      dividerColor: Colors.white54,
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: getInputDecorationTheme(const Color(0xffd1d1d1)));

  static InputDecorationTheme getInputDecorationTheme(Color borderColor) {
    return InputDecorationTheme(
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffd1d1d1))),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor)),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor)),
        contentPadding: const EdgeInsets.only(top: 0.0, bottom: 0.0, left: 10.0));
  }

  ThemeData _themeData = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),

    // accentColor: Colors.black,
    // accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    appBarTheme:
        const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
  );
  ThemeData getTheme() => _themeData;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}
