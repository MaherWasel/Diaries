import 'package:diaries_mobile/modules/authentication/presentation/screen/auth_screen.dart';
import 'package:diaries_mobile/modules/home/presentation/screen/home_screen.dart';
import 'package:diaries_mobile/modules/navigator/presentation/screen/navigating_screen.dart';
import 'package:diaries_mobile/shared/main_text.dart';
import 'package:diaries_mobile/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Importing custom icons path
import 'package:diaries_mobile/shared/icons_path.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              IconsPath.appIconPath,
              width: 200.w,
              height: 200.h,
            )
                .animate(onComplete: (_) {
                  if (Utils.userId != "") {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NavigatingScreen()),
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AuthScreen()),
                    );
                  }
                })
                .fadeIn(duration: 0.5.seconds)
                .scaleXY(begin: 1, end: 1.2, duration: 0.5.seconds)
                .then(delay: const Duration(seconds: 1))
                .blurXY(),
            Padding(
                padding: const EdgeInsets.all(32.0),
                child: MainText(
                  "diaries".tr(),
                  fontsize: 32.sp,
                  weight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                )
                    .animate()
                    .fadeIn()
                    .scaleXY(begin: 1, end: 1.2)
                    .then(delay: const Duration(seconds: 1))
                    .fadeOut())
          ],
        )),
      ),
    );
  }
}
