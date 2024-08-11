import 'package:diaries_mobile/shared/icons_path.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      IconsPath.appIconPath,
      fit: BoxFit.fill,
    );
  }
}
