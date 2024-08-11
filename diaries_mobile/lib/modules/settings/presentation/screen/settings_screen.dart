import 'package:diaries_mobile/modules/settings/presentation/widget/app_settings_menu.dart';
import 'package:diaries_mobile/modules/settings/presentation/widget/auth_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppSettingsMenu(),
        const AuthSettings(),
        const SizedBox(
          height: 10,
        )
      ],
    ).animate(onComplete: (_) => _.reverse()).blurXY(
          duration: Duration(milliseconds: 150),
        );
  }
}
