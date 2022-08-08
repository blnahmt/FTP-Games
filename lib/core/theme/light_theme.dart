import 'package:flutter/material.dart';
import 'package:ftp_games/core/theme/dark_theme.dart';

class LightTheme {
  TextTheme textTheme = ThemeData.light().textTheme;
  ThemeData get theme => ThemeData(
        brightness: Brightness.light,
        backgroundColor: NordColors.brightGray,
        primaryColor: Colors.blue,
        textTheme: const TextTheme(),
        iconTheme: const IconThemeData(color: Colors.black),
        scaffoldBackgroundColor: NordColors.brightGray,
        cardTheme: const CardTheme(
          color: NordColors.gainsboro,
        ),
        tabBarTheme: const TabBarTheme(labelColor: Colors.black),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent, elevation: 0),
      );
}
