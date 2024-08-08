import 'package:diaries_mobile/shared/icons_path.dart';
import 'package:diaries_mobile/shared/local_storage.dart';
import 'package:diaries_mobile/shared/main_text.dart';
import 'package:diaries_mobile/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Spacer(),
              IconButton(
                onPressed: () async {
                  if (Utils.appOnAr) {
                    await LocalStorage.storeAppLanguage(
                        appLanguage: !Utils.appOnAr);
                    // ignore: use_build_context_synchronously
                    await context.setLocale(const Locale(
                        'en', "US")); // change `easy_localization` locale
                    await Get.updateLocale(const Locale('en', "US"));
                  } else {
                    await LocalStorage.storeAppLanguage(
                        appLanguage: !Utils.appOnAr);
                    // ignore: use_build_context_synchronously
                    await context.setLocale(const Locale("ar", "SA"));
                    await Get.updateLocale(const Locale("ar", "SA"));
                  }
                },
                icon: Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 1.5,
                          color: Theme.of(context).colorScheme.primary)),
                  child: MainText(Utils.appOnAr ? "EN" : "ع"),
                ),
              ),
              Image.asset(
                IconsPath.appIconPath,
                width: 50.w,
                height: 50.h,
              )
            ],
          ).animate().fadeIn(),
        ),
      ),
    );
  }
}
