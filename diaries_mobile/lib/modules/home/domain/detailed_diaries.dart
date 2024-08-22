// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DetailedDiaries {
  final int id;
  final String? title;
  final String? description;
  final List<String> images;
  DetailedDiaries({
    required this.id,
    this.title,
    this.description,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'images': images,
    };
  }

  factory DetailedDiaries.fromMap(Map<String, dynamic> map) {
    return DetailedDiaries(
        id: map['id'],
        title: map['title'],
        description: map['description'],
        images: List<String>.from(
          (map['images'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory DetailedDiaries.fromJson(String source) =>
      DetailedDiaries.fromMap(json.decode(source) as Map<String, dynamic>);
}
