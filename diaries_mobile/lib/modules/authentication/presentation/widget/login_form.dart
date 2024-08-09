import 'package:diaries_mobile/modules/authentication/presentation/provider/auth_controller.dart';
import 'package:diaries_mobile/modules/authentication/presentation/widget/error_dialog.dart';
import 'package:diaries_mobile/modules/authentication/presentation/widget/person_logo.dart';
import 'package:diaries_mobile/modules/home/presentation/screen/home_screen.dart';
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
  String enteredEmail = "";
  String enteredUserName = "";
  String enteredPassword = "";
  late final AnimationController userNameFormController;
  late final AnimationController textInSubmitButtonController;

  @override
  void initState() {
    super.initState();
    userNameFormController =
        AnimationController(vsync: this, duration: 100.milliseconds);
    textInSubmitButtonController =
        AnimationController(vsync: this, duration: 100.milliseconds);
  }

  @override
  void dispose() {
    userNameFormController.dispose();
    textInSubmitButtonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    final signOrRegisterState = ref.watch(registerOrSignInControllerProvider);
    Future.microtask(() {
      if (ref.read(authControllerProvider) is AuthFailure) {
        showDialog(context: context, builder: (context) => const ErrorDialog());
      } else if (ref.read(authControllerProvider) is AuthSuccess) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });
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
                  return "invalidEmail".tr();
                }
                return null;
              },
              onChanged: (_) => enteredEmail = _,
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
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) => enteredUserName = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "invalidUserName".tr();
                      }
                      return null;
                    },
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
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) => enteredPassword = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "invalidPassword".tr();
                  }
                  return null;
                },
                obscureText: true,
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
                      if (authState is AuthLoading) {
                        return;
                      }
                      if (signOrRegisterState) {
                        await textInSubmitButtonController.reverse();
                        await userNameFormController.reverse();
                      } else {
                        await userNameFormController.reverse();
                        await textInSubmitButtonController.reverse();
                      }
                      ref.read(authControllerProvider.notifier).reset();
                      ref
                          .read(registerOrSignInControllerProvider.notifier)
                          .swap();
                      textInSubmitButtonController.forward();
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
                  child: Animate(
                    controller: textInSubmitButtonController,
                    effects: [const FadeEffect()],
                    child: Builder(builder: (context) {
                      if (authState is AuthLoading) {
                        return const Center(
                          child: const CircularProgressIndicator(),
                        );
                      }
                      return MainText(signOrRegisterState
                              ? "createAccount".tr()
                              : "login".tr())
                          .animate()
                          .fadeIn();
                    }),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (!signOrRegisterState) {
                        await textInSubmitButtonController.reverse();
                        ref.read(authControllerProvider.notifier).signIn(
                            email: enteredEmail, password: enteredPassword);
                        await textInSubmitButtonController.forward();
                      } else {
                        await textInSubmitButtonController.reverse();

                        ref.read(authControllerProvider.notifier).register(
                            email: enteredEmail,
                            userName: enteredUserName,
                            password: enteredPassword);
                        await textInSubmitButtonController.forward();
                      }
                    }
                  }))
        ],
      ).animate().fadeIn(),
    );
  }
}
