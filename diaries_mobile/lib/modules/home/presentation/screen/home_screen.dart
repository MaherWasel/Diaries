import 'package:diaries_mobile/main.dart';
import 'package:diaries_mobile/modules/home/presentation/provider/diaries_controller.dart';
import 'package:diaries_mobile/modules/home/presentation/widget/add_diarie_date.dart';
import 'package:diaries_mobile/modules/home/presentation/widget/dates_drawer.dart';
import 'package:diaries_mobile/shared/main_text.dart';
import 'package:diaries_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diariesState = ref.watch(diariesStateControllerProvider);
    Future.microtask(() => {
          if (diariesState is HomeInitial)
            {
              ref
                  .read(diariesStateControllerProvider.notifier)
                  .loadDiaires(userId: Utils.userId)
            }
        });
    if (diariesState is HomeLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      key: _key,
      drawer: DatesDrawer(),
      backgroundColor: Colors.transparent,
      body: RefreshIndicator(
        onRefresh: () async {
          ref
              .read(diariesStateControllerProvider.notifier)
              .loadDiaires(userId: Utils.userId);
        },
        child: ListView(
          children: [
            const AddDiarieDate(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Utils.appOnAr
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: IconButton(
                    onPressed: () {
                      _key.currentState!.openDrawer();
                      // showModalBottomSheet(context: context, builder: (context)=>DatesDrawer());
                    },
                    icon: Icon(
                      Icons.menu,
                      size: 32.sp,
                    )),
              ),
            )
          ],
        ).animate().fadeIn(),
      ),
    );
  }
}
