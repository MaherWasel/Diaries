import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateProvider =
    StateNotifierProvider<DateNotifier, DateTime?>((ref) => DateNotifier());

class DateNotifier extends StateNotifier<DateTime?> {
  DateNotifier() : super(null);

  void setDate(DateTime date) {
    state = date;
  }
}
