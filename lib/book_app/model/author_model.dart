// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import 'package:parse_learning/book_app/model/registration_model.dart';

// part 'author_model.freezed.dart';

// @freezed
// class AuthorModel with _$AuthorModel {
//   @Implements<IRegistrationModel>()
//   const factory AuthorModel({
//     required String objectId,
//     required String name,
//   }) = _AuthorModel;

//   factory AuthorModel.fromParseObject(ParseObject parseObject) {
//     return AuthorModel(
//       objectId: parseObject.get<String>('objectId')!,
//       name: parseObject.get<String>('name')!,
//     );
//   }
// }

// @immutable
// class AuthorModel extends RegistrationModel {
//   const AuthorModel({required super.objectId, required super.name});

//   factory AuthorModel.fromParseObject(ParseObject parseObject) {
//     return AuthorModel(
//       objectId: parseObject.get<String>('objectId')!,
//       name: parseObject.get<String>('name')!,
//     );
//   }
// }

@immutable
class AuthorModel extends RegistrationModel {
  const AuthorModel({required super.objectId, required super.name});

  factory AuthorModel.fromRegisterModel(RegistrationModel model) {
    return AuthorModel(
      objectId: model.objectId,
      name: model.name,
    );
  }

  factory AuthorModel.fromParseObject(ParseObject parseObject) {
    return AuthorModel(
      objectId: parseObject.get<String>('objectId')!,
      name: parseObject.get<String>('name')!,
    );
  }
}

@immutable
class BabiModel {
  final String objectId;
  final String name;
  const BabiModel({
    required this.objectId,
    required this.name,
  });

  factory BabiModel.fromParseObject(ParseObject parseObject) {
    return BabiModel(
      objectId: parseObject.get<String>('objectId')!,
      name: parseObject.get<String>('name')!,
    );
  }

  BabiModel copyWith({
    String? objectId,
    String? name,
  }) {
    return BabiModel(
      objectId: objectId ?? this.objectId,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'objectId': objectId,
      'name': name,
    };
  }

  factory BabiModel.fromMap(Map<String, dynamic> map) {
    return BabiModel(
      objectId: map['objectId'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BabiModel.fromJson(String source) =>
      BabiModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BabiModel(objectId: $objectId, name: $name)';

  @override
  bool operator ==(covariant BabiModel other) {
    if (identical(this, other)) return true;

    return other.objectId == objectId && other.name == name;
  }

  @override
  int get hashCode => objectId.hashCode ^ name.hashCode;
}
