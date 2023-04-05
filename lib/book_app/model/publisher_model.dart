import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:parse_learning/book_app/model/registration_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

// part 'publisher_model.freezed.dart';

// @freezed
// class PublisherModel with _$PublisherModel {
//   @Implements<IRegistrationModel>()
//   const factory PublisherModel({
//     required String objectId,
//     required String name,
//   }) = _PublisherModel;

//   factory PublisherModel.fromParseObject(ParseObject parseObject) {
//     return PublisherModel(
//       objectId: parseObject.get<String>('objectId')!,
//       name: parseObject.get<String>('name')!,
//     );
//   }
// }

@immutable
class PublisherModel extends RegistrationModel {
  const PublisherModel({required super.objectId, required super.name});

  factory PublisherModel.fromRegisterModel(RegistrationModel model) {
    return PublisherModel(
      objectId: model.objectId,
      name: model.name,
    );
  }

  factory PublisherModel.fromParseObject(ParseObject parseObject) {
    return PublisherModel(
      objectId: parseObject.get<String>('objectId')!,
      name: parseObject.get<String>('name')!,
    );
  }
}
