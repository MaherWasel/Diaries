import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      this.selected = false,
      required this.child,
      required this.onPressed});

  final void Function()? onPressed;
  final Widget child;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: selected
              ? (Theme.of(context).colorScheme.primary)
              : Theme.of(context).colorScheme.background,
          side: BorderSide(
              color: selected
                  ? Colors.transparent
                  : Theme.of(context).colorScheme.primary,
              width: 1)),
      child: child,
    );
  }
}
