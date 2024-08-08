import 'package:diaries_mobile/theme/dark_theme.dart';
import 'package:diaries_mobile/theme/light_theme.dart';
import 'package:diaries_mobile/utils/utils.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightTheme;

  ThemeData getThemeData() {
    if (Utils.appOnLight) {
      return _themeData;
    } else {
      return darkTheme;
    }
  }

  set themeData(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  void toggleTheme() {
    if (Utils.appOnLight) {
      themeData = lightTheme;
    } else {
      themeData = darkTheme;
    }
  }
}
