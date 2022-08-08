import 'package:flutter/material.dart';
import 'package:ftp_games/core/cache/prefs_manager.dart';
import 'package:ftp_games/core/theme/dark_theme.dart';
import 'package:ftp_games/core/theme/light_theme.dart';
import 'package:ftp_games/core/theme/themes_enum.dart';

class ThemeManager extends ChangeNotifier {
  ThemeData currentTheme = ThemeData.dark();
  bool isDark = true;

  ThemeData? darkTheme;
  ThemeData? lightTheme;

  ThemeManager() {
    init();
  }

  void init() async {
    darkTheme = await DarkTheme.getThemeData();
    lightTheme = await LightTheme.getThemeData();
    isDark = PrefsManager.instance.getBool(PrefsSetting.theme) ?? true;
    changeTheme(isDark ? AppThemes.dark : AppThemes.light);
  }

  void changeTheme(AppThemes newTheme) async {
    isDark = newTheme == AppThemes.dark;
    currentTheme = newTheme == AppThemes.dark
        ? darkTheme ?? ThemeData.dark()
        : lightTheme ?? ThemeData.light();
    await PrefsManager.instance.saveBool(PrefsSetting.theme, isDark);
    notifyListeners();
  }
}
