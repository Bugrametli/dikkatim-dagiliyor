// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppEntity _$AppEntityFromJson(Map<String, dynamic> json) {
  return _AppEntity.fromJson(json);
}

/// @nodoc
mixin _$AppEntity {
  String get id => throw _privateConstructorUsedError; // Bundle ID or Token
  String get name => throw _privateConstructorUsedError;
  String get iconUrl =>
      throw _privateConstructorUsedError; // Placeholder for now
  int get dangerLevel =>
      throw _privateConstructorUsedError; // 0: Unknown, 1: Safe, 2: Warning, 3: Dangerous
  String? get category => throw _privateConstructorUsedError;

  /// Serializes this AppEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppEntityCopyWith<AppEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEntityCopyWith<$Res> {
  factory $AppEntityCopyWith(AppEntity value, $Res Function(AppEntity) then) =
      _$AppEntityCopyWithImpl<$Res, AppEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      String iconUrl,
      int dangerLevel,
      String? category});
}

/// @nodoc
class _$AppEntityCopyWithImpl<$Res, $Val extends AppEntity>
    implements $AppEntityCopyWith<$Res> {
  _$AppEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconUrl = null,
    Object? dangerLevel = null,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      dangerLevel: null == dangerLevel
          ? _value.dangerLevel
          : dangerLevel // ignore: cast_nullable_to_non_nullable
              as int,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppEntityImplCopyWith<$Res>
    implements $AppEntityCopyWith<$Res> {
  factory _$$AppEntityImplCopyWith(
          _$AppEntityImpl value, $Res Function(_$AppEntityImpl) then) =
      __$$AppEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String iconUrl,
      int dangerLevel,
      String? category});
}

/// @nodoc
class __$$AppEntityImplCopyWithImpl<$Res>
    extends _$AppEntityCopyWithImpl<$Res, _$AppEntityImpl>
    implements _$$AppEntityImplCopyWith<$Res> {
  __$$AppEntityImplCopyWithImpl(
      _$AppEntityImpl _value, $Res Function(_$AppEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconUrl = null,
    Object? dangerLevel = null,
    Object? category = freezed,
  }) {
    return _then(_$AppEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      dangerLevel: null == dangerLevel
          ? _value.dangerLevel
          : dangerLevel // ignore: cast_nullable_to_non_nullable
              as int,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppEntityImpl implements _AppEntity {
  const _$AppEntityImpl(
      {required this.id,
      required this.name,
      required this.iconUrl,
      this.dangerLevel = 0,
      this.category});

  factory _$AppEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppEntityImplFromJson(json);

  @override
  final String id;
// Bundle ID or Token
  @override
  final String name;
  @override
  final String iconUrl;
// Placeholder for now
  @override
  @JsonKey()
  final int dangerLevel;
// 0: Unknown, 1: Safe, 2: Warning, 3: Dangerous
  @override
  final String? category;

  @override
  String toString() {
    return 'AppEntity(id: $id, name: $name, iconUrl: $iconUrl, dangerLevel: $dangerLevel, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.dangerLevel, dangerLevel) ||
                other.dangerLevel == dangerLevel) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, iconUrl, dangerLevel, category);

  /// Create a copy of AppEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppEntityImplCopyWith<_$AppEntityImpl> get copyWith =>
      __$$AppEntityImplCopyWithImpl<_$AppEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppEntityImplToJson(
      this,
    );
  }
}

abstract class _AppEntity implements AppEntity {
  const factory _AppEntity(
      {required final String id,
      required final String name,
      required final String iconUrl,
      final int dangerLevel,
      final String? category}) = _$AppEntityImpl;

  factory _AppEntity.fromJson(Map<String, dynamic> json) =
      _$AppEntityImpl.fromJson;

  @override
  String get id; // Bundle ID or Token
  @override
  String get name;
  @override
  String get iconUrl; // Placeholder for now
  @override
  int get dangerLevel; // 0: Unknown, 1: Safe, 2: Warning, 3: Dangerous
  @override
  String? get category;

  /// Create a copy of AppEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppEntityImplCopyWith<_$AppEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
