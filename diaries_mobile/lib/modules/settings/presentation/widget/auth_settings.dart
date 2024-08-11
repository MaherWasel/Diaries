import 'package:diaries_mobile/modules/settings/presentation/widget/click_able_elements.dart';
import 'package:diaries_mobile/shared/main_text.dart';
import 'package:diaries_mobile/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthSettings extends ConsumerWidget {
  const AuthSettings({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Align(
            alignment:
                Utils.appOnAr ? Alignment.centerRight : Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: MainText(
                "authSettings".tr(),
                weight: FontWeight.bold,
              ).animate().scaleXY(begin: 1, end: 1.2),
            )),
        ClickAbleElements(
                icon: (Icon(
                  Icons.password,
                  color: Theme.of(context).colorScheme.primary,
                )),
                onPressed: () {},
                text: "resetPassword".tr())
            .animate(
              onComplete: (controller) => controller.repeat(reverse: true),
            )
            .shimmer(
              delay: 2.seconds,
            ),
      ],
    );
  }
}
