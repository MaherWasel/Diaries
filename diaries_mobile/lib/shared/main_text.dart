import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  const MainText(
    this.text, {
    Key? key,
    this.color,
    this.fontsize,
    this.weight,
    this.align,
    this.style,
    this.decoration,
    this.overflow,
    this.maxLine,
  }) : super(key: key);
  final String text;

  final Color? color;
  final double? fontsize;

  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final TextAlign? align;
  final FontWeight? weight;
  final TextStyle? style;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? TextAlign.start,
      maxLines: maxLine,
      style: style ??
          TextStyle(
              fontFamily: "tajawal",
              color: color,
              fontSize: fontsize,
              decoration: decoration,
              fontWeight: weight),
    );
  }
}
