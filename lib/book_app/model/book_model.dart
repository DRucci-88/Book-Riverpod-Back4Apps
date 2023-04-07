// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import 'package:parse_learning/book_app/model/genre_model.dart';
import 'package:parse_learning/book_app/model/publisher_model.dart';

@immutable
class BookModel {
  final String objectId;
  final String title;
  final String year;
  final GenreModel genre;
  final PublisherModel publisher;
  const BookModel({
    required this.objectId,
    required this.title,
    required this.year,
    required this.genre,
    required this.publisher,
  });

  factory BookModel.fromParseObject(ParseObject parseObject) {
    return BookModel(
      objectId: parseObject.get<String>('objectId')!,
      title: parseObject.get<String>('title')!,
      year: parseObject.get<String>('year')!,
      genre: GenreModel.fromParseObject(
        parseObject.get<ParseObject>('genre')!,
      ),
      publisher: PublisherModel.fromParseObject(
        parseObject.get<ParseObject>('publisher')!,
      ),
    );
  }

  BookModel copyWith({
    String? objectId,
    String? title,
    String? year,
    GenreModel? genre,
    PublisherModel? publisher,
  }) {
    return BookModel(
      objectId: objectId ?? this.objectId,
      title: title ?? this.title,
      year: year ?? this.year,
      genre: genre ?? this.genre,
      publisher: publisher ?? this.publisher,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'objectId': objectId,
      'title': title,
      'year': year,
      'genre': genre.toMap(),
      'publisher': publisher.toMap(),
    };
  }

  // factory BookModel.fromMap(Map<String, dynamic> map) {
  //   return BookModel(
  //     objectId: map['objectId'] as String,
  //     title: map['title'] as String,
  //     year: map['year'] as String,
  //     genre: GenreModel.fromMap(map['genre'] as Map<String, dynamic>),
  //     publisher:
  //         PublisherModel.fromMap(map['publisher'] as Map<String, dynamic>),
  //   );
  // }

  String toJson() => json.encode(toMap());

  // factory BookModel.fromJson(String source) =>
  //     BookModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookModel(objectId: $objectId, title: $title, year: $year, genre: $genre, publisher: $publisher)';
  }

  @override
  bool operator ==(covariant BookModel other) {
    if (identical(this, other)) return true;

    return other.objectId == objectId &&
        other.title == title &&
        other.year == year &&
        other.genre == genre &&
        other.publisher == publisher;
  }

  @override
  int get hashCode {
    return objectId.hashCode ^
        title.hashCode ^
        year.hashCode ^
        genre.hashCode ^
        publisher.hashCode;
  }
}
