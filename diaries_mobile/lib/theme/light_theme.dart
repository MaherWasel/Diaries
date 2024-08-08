import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 106, 74, 232),
    primary: Color.fromARGB(255, 106, 74, 232),

    background: Color.fromRGBO(250, 250, 250, 1), // Light grey color background
    surface: Color.fromRGBO(255, 255, 255, 1), // Light grey color surface
  ),
  scaffoldBackgroundColor:
      Color.fromRGBO(250, 250, 250, 1), // Light grey color scaffold background
  brightness: Brightness.light,
);
