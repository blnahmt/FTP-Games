import 'package:flutter/material.dart';

class LightTheme {
  TextTheme textTheme = ThemeData.light().textTheme;
  ThemeData get theme => ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        textTheme: const TextTheme(),
        iconTheme: const IconThemeData(color: Colors.black),
        scaffoldBackgroundColor: Colors.grey[100],
        cardTheme: const CardTheme(
          color: Colors.white,
        ),
        tabBarTheme: const TabBarTheme(labelColor: Colors.black),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent, elevation: 0),
      );
}
