import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class RegistrationModel {
  final String objectId;
  final String name;
  const RegistrationModel({
    required this.objectId,
    required this.name,
  });

  RegistrationModel copyWith({
    String? objectId,
    String? name,
  }) {
    return RegistrationModel(
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

  factory RegistrationModel.fromMap(Map<String, dynamic> map) {
    return RegistrationModel(
      objectId: map['objectId'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistrationModel.fromJson(String source) =>
      RegistrationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RegistrationModel(objectId: $objectId, name: $name)';

  @override
  bool operator ==(covariant RegistrationModel other) {
    if (identical(this, other)) return true;

    return other.objectId == objectId && other.name == name;
  }

  @override
  int get hashCode => objectId.hashCode ^ name.hashCode;
}
