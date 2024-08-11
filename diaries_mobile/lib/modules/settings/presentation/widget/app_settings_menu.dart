import 'package:diaries_mobile/modules/settings/presentation/widget/click_able_elements.dart';
import 'package:diaries_mobile/shared/local_storage.dart';
import 'package:diaries_mobile/shared/main_button.dart';
import 'package:diaries_mobile/shared/main_text.dart';
import 'package:diaries_mobile/theme/theme_provider.dart';
import 'package:diaries_mobile/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class AppSettingsMenu extends StatelessWidget {
  const AppSettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment:
                Utils.appOnAr ? Alignment.centerRight : Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: MainText(
                "appSettings".tr(),
                weight: FontWeight.bold,
              )
                  .animate(autoPlay: true)
                  .scaleXY(begin: 1, end: 1.2)
                  .then(delay: 1250.milliseconds),
            )),
        ClickAbleElements(
          twoButton: true,
          icon: Icon(
            Icons.language,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {},
          text: "selectLanguage".tr(),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MainButton(
                  selected: !Utils.appOnAr,
                  child: MainText(
                    "english".tr(),
                    color: Utils.appOnAr
                        ? null
                        : Theme.of(context).colorScheme.background,
                  ),
                  onPressed: () async {
                    if (Utils.appOnAr) {
                      await LocalStorage.storeAppLanguage(
                          appLanguage: !Utils.appOnAr);
                      // ignore: use_build_context_synchronously
                      await context.setLocale(const Locale(
                          'en', "US")); // change `easy_localization` locale
                      Get.updateLocale(const Locale('en', "US"));
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MainButton(
                  selected: Utils.appOnAr,
                  child: MainText(
                    "arabic".tr(),
                    color: Utils.appOnAr
                        ? Theme.of(context).colorScheme.background
                        : null,
                  ),
                  onPressed: () async {
                    if (!Utils.appOnAr) {
                      await LocalStorage.storeAppLanguage(
                          appLanguage: !Utils.appOnAr);
                      // ignore: use_build_context_synchronously
                      await context.setLocale(const Locale(
                          'ar', "SA")); // change `easy_localization` locale
                      Get.updateLocale(const Locale('ar', "SA"));
                    }
                  }),
            )
          ],
        )
            .animate(
              onComplete: (controller) => controller.repeat(reverse: true),
            )
            .shimmer(
              delay: 2.seconds,
            ),
        ClickAbleElements(
          twoButton: true,
          icon: Icon(
            Icons.style,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {},
          text: "appTheme".tr(),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MainButton(
                  selected: !Utils.appOnLight,
                  child: MainText(
                    "dark".tr(),
                    color: Utils.appOnLight
                        ? null
                        : Theme.of(context).colorScheme.background,
                  ),
                  onPressed: () async {
                    await LocalStorage.storeTheme(appOnLightTheme: false);
                    // ignore: use_build_context_synchronously
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MainButton(
                  selected: Utils.appOnLight,
                  child: MainText(
                    "light".tr(),
                    color: Utils.appOnLight
                        ? Theme.of(context).colorScheme.background
                        : null,
                  ),
                  onPressed: () async {
                    await LocalStorage.storeTheme(appOnLightTheme: true);
                    // ignore: use_build_context_synchronously
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  }),
            )
          ],
        )
            .animate(
              onComplete: (controller) => controller.repeat(reverse: true),
            )
            .shimmer(
              delay: 2.seconds,
            )
      ],
    );
  }
}
