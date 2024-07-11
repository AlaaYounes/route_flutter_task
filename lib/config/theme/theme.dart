import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData myTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
    ),
    scaffoldBackgroundColor: const Color(0xffFFFFFF),
    textTheme: TextTheme(
      bodyLarge: const TextStyle(
        color: Color(0xff06004F),
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
      ),
      labelLarge: TextStyle(

        fontFamily: 'Poppins',
        color: const Color(0xff06004F).withOpacity(0.6),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
