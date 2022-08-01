import 'package:flutter/material.dart';
import 'package:ftp_games/core/theme/dark_theme.dart';
import 'package:ftp_games/core/theme/light_theme.dart';

enum AppThemes { light, dark }

extension AppThemesExtention on AppThemes {
  ThemeData theme() {
    switch (this) {
      case AppThemes.light:
        return LightTheme().theme;

      case AppThemes.dark:
        return DarkTheme().theme;
    }
  }
}
