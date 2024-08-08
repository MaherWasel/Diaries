import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 110, 127, 234),
    primary: Color.fromARGB(255, 110, 127, 234),
    brightness: Brightness.dark,
    background: Color.fromRGBO(29, 29, 29, 1), // Zinc color background
    surface: Color.fromARGB(255, 29, 29, 29), // Zinc color surface
  ),
  scaffoldBackgroundColor:
      Color.fromARGB(255, 29, 29, 29), // Zinc color scaffold background
  brightness: Brightness.dark,
);
