import 'package:diaries_mobile/modules/home/presentation/widget/add_diarie_date.dart';
import 'package:diaries_mobile/shared/main_text.dart';
import 'package:diaries_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AddDiarieDate(),
        MainText(Utils.userId),
      ],
    ).animate().fadeIn();
  }
}
