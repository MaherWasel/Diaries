import 'package:diaries_mobile/modules/authentication/presentation/screen/auth_screen.dart';
import 'package:diaries_mobile/modules/home/presentation/widget/app_logo.dart';
import 'package:diaries_mobile/shared/local_storage.dart';
import 'package:diaries_mobile/shared/main_text.dart';
import 'package:diaries_mobile/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigatorHeader extends StatelessWidget {
  const NavigatorHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.person),
        ),
        PopupMenuButton(
            itemBuilder: (context) => <PopupMenuEntry<String>>[
                  PopupMenuItem(child: MainText("profile".tr())),
                  PopupMenuItem(
                    child: MainText("logout".tr()),
                    onTap: () async {
                      await LocalStorage.storeUserId(userId: "");
                      if (Utils.userId.isEmpty) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => AuthScreen()));
                      }
                    },
                  )
                ]),
        Spacer(),
        SizedBox(width: 50.w, height: 50.h, child: AppLogo())
      ],
    );
  }
}
