import 'package:diaries_mobile/main.dart';
import 'package:diaries_mobile/modules/home/domain/diaries.dart';
import 'package:diaries_mobile/modules/home/presentation/provider/date_controller.dart';
import 'package:diaries_mobile/modules/home/presentation/provider/diaries_controller.dart';
import 'package:diaries_mobile/shared/main_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatesDrawer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diariesState = ref.watch(diariesStateControllerProvider);
    if (diariesState is HomeSuccess<List<Diaries>>) {
      return Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: ListView.builder(
            itemCount: diariesState.data!.length,
            padding: EdgeInsets.all(8),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  ref
                      .read(dateProvider.notifier)
                      .setDate(diariesState.data![index].date);
                  Navigator.of(context).pop();
                },
                child: Center(
                    child: Container(
                        width: 220.w,
                        height: 80.h,
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).colorScheme.primary),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                            child: MainText(
                          diariesState.data![index].date.toShortDateString(),
                          color: Theme.of(context).colorScheme.primary,
                          weight: FontWeight.bold,
                          fontsize: 22.sp,
                        )))),
              );
            }),
      );
    }
    return SizedBox.shrink();
  }
}

extension on DateTime {
  String toShortDateString() {
    return "${this.day}/${this.month}/${this.year}";
  }
}
