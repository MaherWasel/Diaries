import 'package:flutter/material.dart';

LinearGradient getLinearGradient({required BuildContext context}) =>
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Theme.of(context).colorScheme.primary.withOpacity(0.1),
        Theme.of(context).colorScheme.primary.withOpacity(0.12),
        Theme.of(context).colorScheme.primary.withOpacity(0.15),
        Theme.of(context).colorScheme.primary.withOpacity(0.2),
      ],
    );
