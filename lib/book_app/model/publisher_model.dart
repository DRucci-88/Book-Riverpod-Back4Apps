import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

part 'publisher_model.freezed.dart';

@freezed
class PublisherModel with _$PublisherModel {
  const factory PublisherModel({
    required String objectId,
    required String name,
  }) = _PublisherModel;

  factory PublisherModel.fromParseObject(ParseObject parseObject) {
    return PublisherModel(
      objectId: parseObject.get<String>('objectId')!,
      name: parseObject.get<String>('name')!,
    );
  }
}
