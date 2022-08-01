import 'package:flutter/material.dart';
import 'package:ftp_games/core/theme/dark_theme.dart';
import 'package:ftp_games/core/theme/themes_enum.dart';

class ThemeManager extends ChangeNotifier {
  ThemeData theme = DarkTheme().theme;

  void changeTheme(AppThemes newTheme) {
    theme = newTheme.theme();
    notifyListeners();
  }
}
