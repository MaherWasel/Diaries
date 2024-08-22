import 'package:diaries_mobile/modules/authentication/presentation/widget/language_icon.dart';
import 'package:diaries_mobile/modules/home/presentation/provider/date_controller.dart';
import 'package:diaries_mobile/shared/main_button.dart';
import 'package:diaries_mobile/shared/main_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddDiarieDate extends ConsumerWidget {
  const AddDiarieDate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider);

    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Theme.of(context).colorScheme.primary)),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                if (newDate != null) {
                  ref.read(dateProvider.notifier).setDate(newDate);
                }
              },
              style: TextButton.styleFrom(
                alignment:
                    Alignment.centerLeft, // Align button content to the left
              ),
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 14.h),
                        MainText(
                          selectedDate != null
                              ? "${selectedDate.toLocal().toShortDateString()}"
                              : "Select Date",
                          fontsize: 18.sp,
                        ),
                      ],
                    ),
                    Icon(
                      Icons.calendar_month,
                      size: 24.sp,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          SizedBox(
            height: 50.h,
            child: MainButton(
              child: MainText("confirm".tr()),
              onPressed: () {
                // Handle confirm action
              },
            ),
          ),
        ],
      ),
    );
  }
}

extension on DateTime {
  String toShortDateString() {
    return "${this.day}/${this.month}/${this.year}";
  }
}
