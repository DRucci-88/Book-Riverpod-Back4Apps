// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

@immutable
class BookModel {
  final String objectId;
  final String title;
  final String year;
  const BookModel({
    required this.objectId,
    required this.title,
    required this.year,
  });

  factory BookModel.fromParseObject(ParseObject parseObject) {
    return BookModel(
      objectId: parseObject.get<String>('objectId')!,
      title: parseObject.get<String>('title')!,
      year: parseObject.get<String>('year')!,
    );
  }

  BookModel copyWith({
    String? objectId,
    String? title,
    String? year,
  }) {
    return BookModel(
      objectId: objectId ?? this.objectId,
      title: title ?? this.title,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'objectId': objectId,
      'title': title,
      'year': year,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      objectId: map['objectId'] as String,
      title: map['title'] as String,
      year: map['year'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) =>
      BookModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'BookModel(objectId: $objectId, title: $title, year: $year)';

  @override
  bool operator ==(covariant BookModel other) {
    if (identical(this, other)) return true;

    return other.objectId == objectId &&
        other.title == title &&
        other.year == year;
  }

  @override
  int get hashCode => objectId.hashCode ^ title.hashCode ^ year.hashCode;
}
