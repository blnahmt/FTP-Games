import 'package:flutter/material.dart';

class DarkTheme {
  ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: NordColors.outerSpace,
        backgroundColor: NordColors.outerSpace,
        brightness: Brightness.dark,
        indicatorColor: NordColors.independence,
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        cardColor: NordColors.charcoal,
        textTheme: const TextTheme().copyWith(
            headlineSmall: const TextStyle(color: NordColors.brightGrayLight)),
        iconTheme: const IconThemeData(color: Colors.white),
        appBarTheme: const AppBarTheme(
            elevation: 0, backgroundColor: Colors.transparent),
      );
}

class NordColors {
  //Polar Night
  static const Color outerSpace = Color(0xff2E3440);
  static const Color charcoal = Color(0xff3B4252);
  static const Color policeBlue = Color(0xff434C5E);
  static const Color independence = Color(0xff4C566A);

  //Light
  static const Color gainsboro = Color(0xffd8dee9);
  static const Color brightGray = Color(0xffe5e9f0);
  static const Color brightGrayLight = Color(0xffeceff4);

  //Frost
  static const Color pewterBlue = Color(0xff8fbcbb);
  static const Color darkSkyBlue = Color(0xff88c0d0);
  static const Color darkPastelBlue = Color(0xff81a1c1);
  static const Color rackley = Color(0xff5e81ac);
}
