import 'package:diaries_mobile/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static initApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final appOnAr = prefs.getBool('appOnAr');

    if (appOnAr != null) {
      Utils.appOnAr = appOnAr;
    }
    final appOnLightTheme = prefs.getBool('appOnLight');
    if (appOnLightTheme != null) {
      Utils.appOnLight = appOnLightTheme;
    }
    final userId = prefs.getString("userId");
    if (userId != null) {
      Utils.userId = userId;
    }
  }

  static Future storeAppLanguage({required bool appLanguage}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('appOnAr', appLanguage);
    Utils.appOnAr = appLanguage;
  }

  static Future storeTheme({required bool appOnLightTheme}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('appOnLight', appOnLightTheme);
    Utils.appOnLight = appOnLightTheme;
  }

  static Future storeUserId({required String userId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
    Utils.userId = userId;
  }
}
