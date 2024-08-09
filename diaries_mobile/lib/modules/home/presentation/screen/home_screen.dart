import 'package:diaries_mobile/shared/main_text.dart';
import 'package:diaries_mobile/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MainText(Utils.userId),
    );
  }
}
