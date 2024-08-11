import 'package:diaries_mobile/modules/home/presentation/widget/home_header.dart';
import 'package:diaries_mobile/shared/main_text.dart';
import 'package:diaries_mobile/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainText(Utils.userId),
      ],
    );
  }
}
