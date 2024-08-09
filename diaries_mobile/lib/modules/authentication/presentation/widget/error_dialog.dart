import 'package:diaries_mobile/modules/authentication/presentation/provider/auth_controller.dart';
import 'package:diaries_mobile/shared/main_button.dart';
import 'package:diaries_mobile/shared/main_text.dart';
import 'package:diaries_mobile/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ErrorDialog extends ConsumerWidget {
  const ErrorDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize
              .min, // This will make the column take only the necessary height
          children: [
            Align(
                alignment: Utils.appOnAr
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MainText(
                    "error".tr(),
                    fontsize: 20.sp,
                    weight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onErrorContainer,
                  ),
                )),
            Builder(builder: (context) {
              if (authState is AuthFailure) {
                return MainText(authState.errorMessage ?? "unknownError".tr());
              }
              return MainText("unknownError".tr());
            }),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              height: 80.h,
              child: MainButton(
                  child: MainText("close".tr()),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
