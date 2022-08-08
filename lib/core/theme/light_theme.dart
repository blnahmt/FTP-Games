import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';

class LightTheme {
  static Future<ThemeData> getThemeData() async {
    final themeStr =
        await rootBundle.loadString('assets/themes/light_theme.json');
    final themeJson = jsonDecode(themeStr);
    final theme = ThemeDecoder.decodeThemeData(themeJson)!;
    return theme;
  }
}
