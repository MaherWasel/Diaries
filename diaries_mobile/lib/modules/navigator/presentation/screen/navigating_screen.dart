import 'package:diaries_mobile/modules/home/presentation/screen/home_screen.dart';
import 'package:diaries_mobile/modules/home/presentation/widget/home_header.dart';
import 'package:diaries_mobile/modules/navigator/presentation/provider/navigator_controller.dart';
import 'package:diaries_mobile/modules/navigator/presentation/widget/navigate_buttom_bar.dart';
import 'package:diaries_mobile/modules/settings/presentation/screen/settings_screen.dart';
import 'package:diaries_mobile/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigatingScreen extends ConsumerWidget {
  const NavigatingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(bottomBarControllerProvider);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            height: 400,
            padding: const EdgeInsets.only(top: 32, right: 8, left: 8),
            child: const Center(child: HomeHeader())),
      ),
      body: Container(
        width: double.infinity,
        decoration:
            BoxDecoration(gradient: getLinearGradient(context: context)),
        child: Builder(builder: (context) {
          if (currentPage == 1) {
            return SettingsScreen();
          }
          return HomeScreen();
        }),
      ),
      bottomNavigationBar: const NavigatorBottomBar(),
    );
  }
}
