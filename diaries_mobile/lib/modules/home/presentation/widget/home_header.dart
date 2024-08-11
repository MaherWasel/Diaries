import 'package:diaries_mobile/modules/home/presentation/widget/app_logo.dart';
import 'package:diaries_mobile/shared/main_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

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
                  PopupMenuItem(child: MainText("text")),
                  PopupMenuItem(child: MainText("aaa"))
                ]),
        Spacer(),
        SizedBox(width: 50.w, height: 50.h, child: AppLogo())
      ],
    );
  }
}
