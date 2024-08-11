import 'package:diaries_mobile/modules/navigator/presentation/provider/navigator_controller.dart';
import 'package:diaries_mobile/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigatorBottomBar extends ConsumerWidget {
  const NavigatorBottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizes = MediaQuery.sizeOf(context);
    int barIndex = ref.watch(bottomBarControllerProvider);
    final indicatorWidth = sizes.width / 2;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        BottomNavigationBar(
          unselectedItemColor: const Color.fromARGB(255, 175, 172, 172),
          backgroundColor: Theme.of(context).colorScheme.background,
          unselectedLabelStyle: const TextStyle(fontFamily: "tajawal"),
          selectedLabelStyle: const TextStyle(
              fontFamily: "tajawal", fontWeight: FontWeight.bold),
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12.sp,
          unselectedFontSize: 10.sp,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          iconSize: 30.r,
          currentIndex: barIndex,
          onTap: (index) {
            ref
                .read(bottomBarControllerProvider.notifier)
                .setIndex(index: index);
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.home),
              label: 'home'.tr(),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.settings),
              label: 'settings'.tr(),
            ),
          ],
        ),
        Positioned(
          top: 0, // Position the indicator just above the BottomNavigationBar
          left: Utils.appOnAr ? null : barIndex * indicatorWidth,
          right: Utils.appOnAr ? barIndex * indicatorWidth : null,
          child: Container(
            width: indicatorWidth,
            height: 5.0,
            color:
                Theme.of(context).colorScheme.primary, // Color of the indicator
          ),
        ),
      ],
    );
  }
}
