// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CreateTaskInputTearOff {
  const _$CreateTaskInputTearOff();

  _CreateTaskInput call(
      {required String title,
      String? description,
      required int createAt,
      String? imagePath,
      required String status}) {
    return _CreateTaskInput(
      title: title,
      description: description,
      createAt: createAt,
      imagePath: imagePath,
      status: status,
    );
  }
}

/// @nodoc
const $CreateTaskInput = _$CreateTaskInputTearOff();

/// @nodoc
mixin _$CreateTaskInput {
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get createAt => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateTaskInputCopyWith<CreateTaskInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTaskInputCopyWith<$Res> {
  factory $CreateTaskInputCopyWith(
          CreateTaskInput value, $Res Function(CreateTaskInput) then) =
      _$CreateTaskInputCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String? description,
      int createAt,
      String? imagePath,
      String status});
}

/// @nodoc
class _$CreateTaskInputCopyWithImpl<$Res>
    implements $CreateTaskInputCopyWith<$Res> {
  _$CreateTaskInputCopyWithImpl(this._value, this._then);

  final CreateTaskInput _value;
  // ignore: unused_field
  final $Res Function(CreateTaskInput) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? createAt = freezed,
    Object? imagePath = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createAt: createAt == freezed
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as int,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CreateTaskInputCopyWith<$Res>
    implements $CreateTaskInputCopyWith<$Res> {
  factory _$CreateTaskInputCopyWith(
          _CreateTaskInput value, $Res Function(_CreateTaskInput) then) =
      __$CreateTaskInputCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String? description,
      int createAt,
      String? imagePath,
      String status});
}

/// @nodoc
class __$CreateTaskInputCopyWithImpl<$Res>
    extends _$CreateTaskInputCopyWithImpl<$Res>
    implements _$CreateTaskInputCopyWith<$Res> {
  __$CreateTaskInputCopyWithImpl(
      _CreateTaskInput _value, $Res Function(_CreateTaskInput) _then)
      : super(_value, (v) => _then(v as _CreateTaskInput));

  @override
  _CreateTaskInput get _value => super._value as _CreateTaskInput;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? createAt = freezed,
    Object? imagePath = freezed,
    Object? status = freezed,
  }) {
    return _then(_CreateTaskInput(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createAt: createAt == freezed
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as int,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CreateTaskInput implements _CreateTaskInput {
  const _$_CreateTaskInput(
      {required this.title,
      this.description,
      required this.createAt,
      this.imagePath,
      required this.status});

  @override
  final String title;
  @override
  final String? description;
  @override
  final int createAt;
  @override
  final String? imagePath;
  @override
  final String status;

  @override
  String toString() {
    return 'CreateTaskInput(title: $title, description: $description, createAt: $createAt, imagePath: $imagePath, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateTaskInput &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.createAt, createAt) &&
            const DeepCollectionEquality().equals(other.imagePath, imagePath) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(createAt),
      const DeepCollectionEquality().hash(imagePath),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$CreateTaskInputCopyWith<_CreateTaskInput> get copyWith =>
      __$CreateTaskInputCopyWithImpl<_CreateTaskInput>(this, _$identity);
}

abstract class _CreateTaskInput implements CreateTaskInput {
  const factory _CreateTaskInput(
      {required String title,
      String? description,
      required int createAt,
      String? imagePath,
      required String status}) = _$_CreateTaskInput;

  @override
  String get title;
  @override
  String? get description;
  @override
  int get createAt;
  @override
  String? get imagePath;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$CreateTaskInputCopyWith<_CreateTaskInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$UpdateTaskInputTearOff {
  const _$UpdateTaskInputTearOff();

  _UpdateTaskInput call(
      {required String id,
      required String title,
      String? description,
      required int createAt,
      String? image,
      required String status}) {
    return _UpdateTaskInput(
      id: id,
      title: title,
      description: description,
      createAt: createAt,
      image: image,
      status: status,
    );
  }
}

/// @nodoc
const $UpdateTaskInput = _$UpdateTaskInputTearOff();

/// @nodoc
mixin _$UpdateTaskInput {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get createAt => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateTaskInputCopyWith<UpdateTaskInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTaskInputCopyWith<$Res> {
  factory $UpdateTaskInputCopyWith(
          UpdateTaskInput value, $Res Function(UpdateTaskInput) then) =
      _$UpdateTaskInputCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      String? description,
      int createAt,
      String? image,
      String status});
}

/// @nodoc
class _$UpdateTaskInputCopyWithImpl<$Res>
    implements $UpdateTaskInputCopyWith<$Res> {
  _$UpdateTaskInputCopyWithImpl(this._value, this._then);

  final UpdateTaskInput _value;
  // ignore: unused_field
  final $Res Function(UpdateTaskInput) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? createAt = freezed,
    Object? image = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createAt: createAt == freezed
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UpdateTaskInputCopyWith<$Res>
    implements $UpdateTaskInputCopyWith<$Res> {
  factory _$UpdateTaskInputCopyWith(
          _UpdateTaskInput value, $Res Function(_UpdateTaskInput) then) =
      __$UpdateTaskInputCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String? description,
      int createAt,
      String? image,
      String status});
}

/// @nodoc
class __$UpdateTaskInputCopyWithImpl<$Res>
    extends _$UpdateTaskInputCopyWithImpl<$Res>
    implements _$UpdateTaskInputCopyWith<$Res> {
  __$UpdateTaskInputCopyWithImpl(
      _UpdateTaskInput _value, $Res Function(_UpdateTaskInput) _then)
      : super(_value, (v) => _then(v as _UpdateTaskInput));

  @override
  _UpdateTaskInput get _value => super._value as _UpdateTaskInput;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? createAt = freezed,
    Object? image = freezed,
    Object? status = freezed,
  }) {
    return _then(_UpdateTaskInput(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createAt: createAt == freezed
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateTaskInput implements _UpdateTaskInput {
  const _$_UpdateTaskInput(
      {required this.id,
      required this.title,
      this.description,
      required this.createAt,
      this.image,
      required this.status});

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final int createAt;
  @override
  final String? image;
  @override
  final String status;

  @override
  String toString() {
    return 'UpdateTaskInput(id: $id, title: $title, description: $description, createAt: $createAt, image: $image, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateTaskInput &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.createAt, createAt) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(createAt),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$UpdateTaskInputCopyWith<_UpdateTaskInput> get copyWith =>
      __$UpdateTaskInputCopyWithImpl<_UpdateTaskInput>(this, _$identity);
}

abstract class _UpdateTaskInput implements UpdateTaskInput {
  const factory _UpdateTaskInput(
      {required String id,
      required String title,
      String? description,
      required int createAt,
      String? image,
      required String status}) = _$_UpdateTaskInput;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  int get createAt;
  @override
  String? get image;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$UpdateTaskInputCopyWith<_UpdateTaskInput> get copyWith =>
      throw _privateConstructorUsedError;
}
