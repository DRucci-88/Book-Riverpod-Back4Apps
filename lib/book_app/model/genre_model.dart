import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:parse_learning/book_app/model/registration_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

// part 'genre_model.freezed.dart';

// @freezed
// class GenreModel with _$GenreModel {
//   @Implements<IRegistrationModel>()
//   const factory GenreModel({
//     required String objectId,
//     required String name,
//   }) = _GenreModel;

//   factory GenreModel.fromParseObject(ParseObject parseObject) {
//     return GenreModel(
//         objectId: parseObject.get<String>('objectId')!,
//         name: parseObject.get<String>('name')!);
//   }
// }

@immutable
class GenreModel extends RegistrationModel {
  const GenreModel({required super.objectId, required super.name});

  factory GenreModel.fromParseObject(ParseObject parseObject) {
    return GenreModel(
        objectId: parseObject.get<String>('objectId')!,
        name: parseObject.get<String>('name')!);
  }
}
