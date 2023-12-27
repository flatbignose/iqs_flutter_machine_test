import 'package:flutter/material.dart';
import 'package:iqs_flutter_machine_test/core/colors.dart';

class MachineProvider extends ChangeNotifier {
  bool _isDark = false;
  toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
          backgroundColor: kwhite, titleTextStyle: TextStyle(color: kblack)));

  ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
          backgroundColor: kblack, titleTextStyle: TextStyle(color: kwhite)));
}
