import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late SharedPreferences sharedPreferences;

  SharedPrefs._();

  static SharedPrefs instance = SharedPrefs._();

  factory SharedPrefs() {
    return instance;
  }

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  saveThemeMode(ThemeMode themeMode) async {
    await sharedPreferences.setString(
      "themeMode",
      themeMode == ThemeMode.light ? "light" : "dark",
    );
  }

   String get themeMode {
    return sharedPreferences.getString("themeMode")??"light";
  }
}
