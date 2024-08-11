import 'package:diaries_mobile/shared/main_text.dart';
import 'package:flutter/material.dart';

class ClickAbleElements extends StatelessWidget {
  final Icon icon;
  final Function onPressed;
  final String text;
  final bool twoButton;
  final List<Widget>? children;
  const ClickAbleElements(
      {super.key,
      this.children,
      this.twoButton = false,
      required this.icon,
      required this.onPressed,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          trailing: twoButton
              ? Wrap(children: children!)
              : const Icon(Icons.arrow_forward),
          leading: icon,
          onTap: twoButton ? null : () => onPressed(),
          title: MainText(text),
        ),
        const Divider(
          thickness: 0.2,
        )
      ],
    );
  }
}
