import 'package:diaries_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0.r),
      margin: EdgeInsets.all(8.0.r),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: Utils.appOnLight ? Colors.black : Colors.white, width: 2)),
      child: Icon(
        Icons.person,
        size: 150.sp,
        color: Utils.appOnLight ? Colors.black : Colors.white,
      ),
    );
  }
}
