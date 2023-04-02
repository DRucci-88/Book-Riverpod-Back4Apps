import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

part 'author_model.freezed.dart';

@freezed
class AuthorModel with _$AuthorModel {
  const factory AuthorModel({
    required String objectId,
    required String name,
  }) = _AuthorModel;

  factory AuthorModel.fromParseObject(ParseObject parseObject) {
    return AuthorModel(
      objectId: parseObject.get<String>('objectId')!,
      name: parseObject.get<String>('name')!,
    );
  }
}
