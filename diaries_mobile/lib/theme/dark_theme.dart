import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color.fromARGB(255, 110, 127, 234),
      primary: Color.fromARGB(255, 110, 127, 234),

      brightness: Brightness.dark,
      background:
          Color.fromRGBO(29, 29, 29, 1), // Adjust this to your preferred shade
      surface: const Color.fromARGB(
          255, 29, 29, 29), // Adjust this to your preferred shade
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 29, 29, 29),
    brightness: Brightness.dark);
