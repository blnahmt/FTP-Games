import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  ThemeData get theme => ThemeData.light().copyWith(
        primaryColor: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
        iconTheme: IconThemeData(color: Colors.black),
        scaffoldBackgroundColor: Colors.grey[100],
        cardTheme: CardTheme(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        appBarTheme:
            AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            elevation: 0, backgroundColor: Colors.grey[100]),
      );
}
