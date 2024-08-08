import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  MainButton({required this.child, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.background,
            side: BorderSide(
                color: Theme.of(context).colorScheme.primary, width: 2)),
        onPressed: () => onPressed(),
        child: child);
  }
}
