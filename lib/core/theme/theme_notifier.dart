import 'package:flutter/material.dart';
import 'package:ftp_games/core/cache/prefs_manager.dart';
import 'package:ftp_games/core/theme/dark_theme.dart';
import 'package:ftp_games/core/theme/themes_enum.dart';

class ThemeManager extends ChangeNotifier {
  ThemeData theme = DarkTheme().theme;
  bool isDark = true;

  ThemeManager() {
    init();
  }

  void init() async {
    isDark = PrefsManager.instance.getBool(PrefsSetting.theme) ?? true;
    changeTheme(isDark ? AppThemes.dark : AppThemes.light);
  }

  void changeTheme(AppThemes newTheme) async {
    isDark = newTheme == AppThemes.dark;
    theme = newTheme.theme();
    await PrefsManager.instance.saveBool(PrefsSetting.theme, isDark);
    notifyListeners();
  }
}
