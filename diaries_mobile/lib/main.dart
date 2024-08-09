import 'package:diaries_mobile/modules/authentication/presentation/screen/splash_screen.dart';
import 'package:diaries_mobile/shared/local_storage.dart';
import 'package:diaries_mobile/theme/theme_provider.dart';
import 'package:diaries_mobile/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:supabase_flutter/supabase_flutter.dart' show Supabase;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await LocalStorage.initApp();
  await Supabase.initialize(
    url: dotenv.get("supabaseUrl"),
    anonKey: dotenv.get("supabaseAnonKey"),
  );
  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'SA'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      startLocale:
          Utils.appOnAr ? const Locale('ar', 'SA') : const Locale('en', 'US'),
      saveLocale: true,
      child: ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
          child: const ProviderScope(child: MyApp()))));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 930),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'diaries',
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        theme: Provider.of<ThemeProvider>(context).getThemeData(),
        home: SplashScreen(),
      ),
    );
  }
}
