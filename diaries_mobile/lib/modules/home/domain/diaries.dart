import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Diaries {
  final String id;
  final DateTime date;
  Diaries({
    required this.id,
    required this.date,
  });

  factory Diaries.fromMap(Map<String, dynamic> map) {
    return Diaries(
      id: map['id'],
      date: DateTime.parse(map["date"]),
    );
  }

  factory Diaries.fromJson(String source) =>
      Diaries.fromMap(json.decode(source) as Map<String, dynamic>);
}
