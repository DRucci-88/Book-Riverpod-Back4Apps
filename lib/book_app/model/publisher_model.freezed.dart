// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'publisher_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PublisherModel {
  String get objectId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PublisherModelCopyWith<PublisherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublisherModelCopyWith<$Res> {
  factory $PublisherModelCopyWith(
          PublisherModel value, $Res Function(PublisherModel) then) =
      _$PublisherModelCopyWithImpl<$Res, PublisherModel>;
  @useResult
  $Res call({String objectId, String name});
}

/// @nodoc
class _$PublisherModelCopyWithImpl<$Res, $Val extends PublisherModel>
    implements $PublisherModelCopyWith<$Res> {
  _$PublisherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PublisherModelCopyWith<$Res>
    implements $PublisherModelCopyWith<$Res> {
  factory _$$_PublisherModelCopyWith(
          _$_PublisherModel value, $Res Function(_$_PublisherModel) then) =
      __$$_PublisherModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String objectId, String name});
}

/// @nodoc
class __$$_PublisherModelCopyWithImpl<$Res>
    extends _$PublisherModelCopyWithImpl<$Res, _$_PublisherModel>
    implements _$$_PublisherModelCopyWith<$Res> {
  __$$_PublisherModelCopyWithImpl(
      _$_PublisherModel _value, $Res Function(_$_PublisherModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = null,
    Object? name = null,
  }) {
    return _then(_$_PublisherModel(
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PublisherModel implements _PublisherModel {
  const _$_PublisherModel({required this.objectId, required this.name});

  @override
  final String objectId;
  @override
  final String name;

  @override
  String toString() {
    return 'PublisherModel(objectId: $objectId, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PublisherModel &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, objectId, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PublisherModelCopyWith<_$_PublisherModel> get copyWith =>
      __$$_PublisherModelCopyWithImpl<_$_PublisherModel>(this, _$identity);
}

abstract class _PublisherModel implements PublisherModel {
  const factory _PublisherModel(
      {required final String objectId,
      required final String name}) = _$_PublisherModel;

  @override
  String get objectId;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_PublisherModelCopyWith<_$_PublisherModel> get copyWith =>
      throw _privateConstructorUsedError;
}
