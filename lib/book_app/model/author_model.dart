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
