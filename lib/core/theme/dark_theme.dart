import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkTheme {
  TextTheme textTheme = ThemeData.dark().textTheme;
  ThemeData get theme => ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(textTheme),
        iconTheme: IconThemeData(color: Colors.white),
        cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        appBarTheme:
            AppBarTheme(elevation: 0, backgroundColor: Colors.transparent),
      );
}
