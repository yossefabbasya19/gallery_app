import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/core/shared_pref/shared_prefs.dart';
import 'package:meta/meta.dart';

part 'toggle_theme_state.dart';

class ToggleThemeCubit extends Cubit<ToggleThemeState> {
  ToggleThemeCubit() : super(ToggleThemeInitial());
  ThemeMode themeMode = SharedPrefs().themeMode == "light"
      ? ThemeMode.light
      : ThemeMode.dark;

  void toggleThemeMode(ThemeMode newThemeMode) async {
    if (themeMode == newThemeMode) return;
    themeMode = newThemeMode;
    emit(ToggleTheme());
    await SharedPrefs().saveThemeMode(newThemeMode);
  }
}
