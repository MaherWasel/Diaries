import 'package:diaries_mobile/modules/authentication/presentation/widget/language_icon.dart';
import 'package:diaries_mobile/modules/authentication/presentation/widget/login_form.dart';
import 'package:diaries_mobile/shared/constants.dart';
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
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary.withOpacity(0.8),
                Theme.of(context).colorScheme.primary.withOpacity(0.85),
                Theme.of(context).colorScheme.primary.withOpacity(0.9),
                Theme.of(context).colorScheme.primary.withOpacity(0.95),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Spacer(),
              LanguageIcon(),
              Image.asset(
                IconsPath.appIconPath,
                width: 50.w,
                height: 50.h,
              )
            ],
          ).animate().fadeIn(),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: getLinearGradient(context: context),
        ),
        child: const Center(
            child: const SingleChildScrollView(child: LoginForm())),
      ),
    );
  }
}
