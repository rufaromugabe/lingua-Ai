import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  colorScheme: ThemeData.light().colorScheme.copyWith(
      primary: Color(0xFFECECEC),
      onPrimary: Colors.deepPurple,
      secondary: const Color.fromARGB(77, 33, 33, 33),
      onSecondary: Colors.white,
      background: Color(0xFFECECEC)),
  iconTheme: ThemeData.dark().iconTheme.copyWith(color: Colors.black),
  textTheme: GoogleFonts.poppinsTextTheme(
    ThemeData.light().textTheme,
  ).copyWith(
    bodyText1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    bodyText2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
  ),
);

final darkTheme = ThemeData.dark().copyWith(
  colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: Color(0xFF14213d),
        onPrimary: Colors.deepPurple,
        secondary: Color.fromARGB(246, 113, 109, 109),
        onSecondary: Colors.white,
      ),
  iconTheme: ThemeData.dark().iconTheme.copyWith(color: Colors.white),
  textTheme: GoogleFonts.poppinsTextTheme(
    ThemeData.light().textTheme,
  ).copyWith(
    bodyText1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    bodyText2: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline6: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
  ),
);
