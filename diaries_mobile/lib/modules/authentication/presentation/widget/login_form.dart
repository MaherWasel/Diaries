import 'package:diaries_mobile/modules/authentication/presentation/provider/auth_controller.dart';
import 'package:diaries_mobile/modules/authentication/presentation/widget/person_logo.dart';
import 'package:diaries_mobile/shared/main_button.dart';
import 'package:diaries_mobile/shared/main_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final userNameFormController =
        AnimationController(vsync: this, duration: 1250.milliseconds);
    final signOrRegisterState = ref.watch(registerOrSignInControllerProvider);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PersonLogo(),
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: TextFormField(
              validator: (value) {
                if (value == null || !value.contains("@")) {
                  return "login".tr();
                }
                return null;
              },
              decoration: InputDecoration(
                  label: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MainText(
                      "email".tr(),
                      weight: FontWeight.bold,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r))),
            ),
          ),
          if (signOrRegisterState)
            Animate(
              effects: const [FadeEffect()],
              controller: userNameFormController,
              child: Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: TextFormField(
                    decoration: InputDecoration(
                        label: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MainText(
                            "userName".tr(),
                            weight: FontWeight.bold,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.r))),
                  )),
            ),
          Padding(
              padding: EdgeInsets.all(8.0.r),
              child: TextFormField(
                decoration: InputDecoration(
                    label: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MainText(
                        "password".tr(),
                        weight: FontWeight.bold,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r))),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainText(!signOrRegisterState
                    ? "dontHaveAccount?".tr()
                    : "haveAnAccount?".tr()),
                TextButton(
                    onPressed: () async {
                      if (signOrRegisterState) {
                        await userNameFormController.reverse();
                      } else {
                        userNameFormController.forward();
                      }

                      ref
                          .read(registerOrSignInControllerProvider.notifier)
                          .swap();
                    },
                    child: MainText(
                        !signOrRegisterState ? "register".tr() : "login".tr())),
              ],
            ),
          ),
          SizedBox(
              width: 400.w,
              height: 80.h,
              child: MainButton(
                  child: MainText(signOrRegisterState
                      ? "createAccount".tr()
                      : "login".tr()),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  }))
        ],
      ).animate().fadeIn(),
    );
  }
}
