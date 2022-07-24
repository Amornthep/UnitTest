// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodoListStateTearOff {
  const _$TodoListStateTearOff();

  _TodoListStateData data({required List<Task> todos}) {
    return _TodoListStateData(
      todos: todos,
    );
  }

  _TodoListStateeError error(String? error) {
    return _TodoListStateeError(
      error,
    );
  }

  _TodoListStateInitial initial() {
    return const _TodoListStateInitial();
  }

  _TodoListStateLoading loading() {
    return const _TodoListStateLoading();
  }
}

/// @nodoc
const $TodoListState = _$TodoListStateTearOff();

/// @nodoc
mixin _$TodoListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Task> todos) data,
    required TResult Function(String? error) error,
    required TResult Function() initial,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Task> todos)? data,
    TResult Function(String? error)? error,
    TResult Function()? initial,
    TResult Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Task> todos)? data,
    TResult Function(String? error)? error,
    TResult Function()? initial,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodoListStateData value) data,
    required TResult Function(_TodoListStateeError value) error,
    required TResult Function(_TodoListStateInitial value) initial,
    required TResult Function(_TodoListStateLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TodoListStateData value)? data,
    TResult Function(_TodoListStateeError value)? error,
    TResult Function(_TodoListStateInitial value)? initial,
    TResult Function(_TodoListStateLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoListStateData value)? data,
    TResult Function(_TodoListStateeError value)? error,
    TResult Function(_TodoListStateInitial value)? initial,
    TResult Function(_TodoListStateLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoListStateCopyWith<$Res> {
  factory $TodoListStateCopyWith(
          TodoListState value, $Res Function(TodoListState) then) =
      _$TodoListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TodoListStateCopyWithImpl<$Res>
    implements $TodoListStateCopyWith<$Res> {
  _$TodoListStateCopyWithImpl(this._value, this._then);

  final TodoListState _value;
  // ignore: unused_field
  final $Res Function(TodoListState) _then;
}

/// @nodoc
abstract class _$TodoListStateDataCopyWith<$Res> {
  factory _$TodoListStateDataCopyWith(
          _TodoListStateData value, $Res Function(_TodoListStateData) then) =
      __$TodoListStateDataCopyWithImpl<$Res>;
  $Res call({List<Task> todos});
}

/// @nodoc
class __$TodoListStateDataCopyWithImpl<$Res>
    extends _$TodoListStateCopyWithImpl<$Res>
    implements _$TodoListStateDataCopyWith<$Res> {
  __$TodoListStateDataCopyWithImpl(
      _TodoListStateData _value, $Res Function(_TodoListStateData) _then)
      : super(_value, (v) => _then(v as _TodoListStateData));

  @override
  _TodoListStateData get _value => super._value as _TodoListStateData;

  @override
  $Res call({
    Object? todos = freezed,
  }) {
    return _then(_TodoListStateData(
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc

class _$_TodoListStateData extends _TodoListStateData {
  const _$_TodoListStateData({required this.todos}) : super._();

  @override
  final List<Task> todos;

  @override
  String toString() {
    return 'TodoListState.data(todos: $todos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoListStateData &&
            const DeepCollectionEquality().equals(other.todos, todos));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(todos));

  @JsonKey(ignore: true)
  @override
  _$TodoListStateDataCopyWith<_TodoListStateData> get copyWith =>
      __$TodoListStateDataCopyWithImpl<_TodoListStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Task> todos) data,
    required TResult Function(String? error) error,
    required TResult Function() initial,
    required TResult Function() loading,
  }) {
    return data(todos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Task> todos)? data,
    TResult Function(String? error)? error,
    TResult Function()? initial,
    TResult Function()? loading,
  }) {
    return data?.call(todos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Task> todos)? data,
    TResult Function(String? error)? error,
    TResult Function()? initial,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(todos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodoListStateData value) data,
    required TResult Function(_TodoListStateeError value) error,
    required TResult Function(_TodoListStateInitial value) initial,
    required TResult Function(_TodoListStateLoading value) loading,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TodoListStateData value)? data,
    TResult Function(_TodoListStateeError value)? error,
    TResult Function(_TodoListStateInitial value)? initial,
    TResult Function(_TodoListStateLoading value)? loading,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoListStateData value)? data,
    TResult Function(_TodoListStateeError value)? error,
    TResult Function(_TodoListStateInitial value)? initial,
    TResult Function(_TodoListStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _TodoListStateData extends TodoListState {
  const factory _TodoListStateData({required List<Task> todos}) =
      _$_TodoListStateData;
  const _TodoListStateData._() : super._();

  List<Task> get todos;
  @JsonKey(ignore: true)
  _$TodoListStateDataCopyWith<_TodoListStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TodoListStateeErrorCopyWith<$Res> {
  factory _$TodoListStateeErrorCopyWith(_TodoListStateeError value,
          $Res Function(_TodoListStateeError) then) =
      __$TodoListStateeErrorCopyWithImpl<$Res>;
  $Res call({String? error});
}

/// @nodoc
class __$TodoListStateeErrorCopyWithImpl<$Res>
    extends _$TodoListStateCopyWithImpl<$Res>
    implements _$TodoListStateeErrorCopyWith<$Res> {
  __$TodoListStateeErrorCopyWithImpl(
      _TodoListStateeError _value, $Res Function(_TodoListStateeError) _then)
      : super(_value, (v) => _then(v as _TodoListStateeError));

  @override
  _TodoListStateeError get _value => super._value as _TodoListStateeError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_TodoListStateeError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TodoListStateeError extends _TodoListStateeError {
  const _$_TodoListStateeError(this.error) : super._();

  @override
  final String? error;

  @override
  String toString() {
    return 'TodoListState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoListStateeError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$TodoListStateeErrorCopyWith<_TodoListStateeError> get copyWith =>
      __$TodoListStateeErrorCopyWithImpl<_TodoListStateeError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Task> todos) data,
    required TResult Function(String? error) error,
    required TResult Function() initial,
    required TResult Function() loading,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Task> todos)? data,
    TResult Function(String? error)? error,
    TResult Function()? initial,
    TResult Function()? loading,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Task> todos)? data,
    TResult Function(String? error)? error,
    TResult Function()? initial,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodoListStateData value) data,
    required TResult Function(_TodoListStateeError value) error,
    required TResult Function(_TodoListStateInitial value) initial,
    required TResult Function(_TodoListStateLoading value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TodoListStateData value)? data,
    TResult Function(_TodoListStateeError value)? error,
    TResult Function(_TodoListStateInitial value)? initial,
    TResult Function(_TodoListStateLoading value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoListStateData value)? data,
    TResult Function(_TodoListStateeError value)? error,
    TResult Function(_TodoListStateInitial value)? initial,
    TResult Function(_TodoListStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _TodoListStateeError extends TodoListState {
  const factory _TodoListStateeError(String? error) = _$_TodoListStateeError;
  const _TodoListStateeError._() : super._();

  String? get error;
  @JsonKey(ignore: true)
  _$TodoListStateeErrorCopyWith<_TodoListStateeError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TodoListStateInitialCopyWith<$Res> {
  factory _$TodoListStateInitialCopyWith(_TodoListStateInitial value,
          $Res Function(_TodoListStateInitial) then) =
      __$TodoListStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$TodoListStateInitialCopyWithImpl<$Res>
    extends _$TodoListStateCopyWithImpl<$Res>
    implements _$TodoListStateInitialCopyWith<$Res> {
  __$TodoListStateInitialCopyWithImpl(
      _TodoListStateInitial _value, $Res Function(_TodoListStateInitial) _then)
      : super(_value, (v) => _then(v as _TodoListStateInitial));

  @override
  _TodoListStateInitial get _value => super._value as _TodoListStateInitial;
}

/// @nodoc

class _$_TodoListStateInitial extends _TodoListStateInitial {
  const _$_TodoListStateInitial() : super._();

  @override
  String toString() {
    return 'TodoListState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _TodoListStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Task> todos) data,
    required TResult Function(String? error) error,
    required TResult Function() initial,
    required TResult Function() loading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Task> todos)? data,
    TResult Function(String? error)? error,
    TResult Function()? initial,
    TResult Function()? loading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Task> todos)? data,
    TResult Function(String? error)? error,
    TResult Function()? initial,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodoListStateData value) data,
    required TResult Function(_TodoListStateeError value) error,
    required TResult Function(_TodoListStateInitial value) initial,
    required TResult Function(_TodoListStateLoading value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TodoListStateData value)? data,
    TResult Function(_TodoListStateeError value)? error,
    TResult Function(_TodoListStateInitial value)? initial,
    TResult Function(_TodoListStateLoading value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoListStateData value)? data,
    TResult Function(_TodoListStateeError value)? error,
    TResult Function(_TodoListStateInitial value)? initial,
    TResult Function(_TodoListStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _TodoListStateInitial extends TodoListState {
  const factory _TodoListStateInitial() = _$_TodoListStateInitial;
  const _TodoListStateInitial._() : super._();
}

/// @nodoc
abstract class _$TodoListStateLoadingCopyWith<$Res> {
  factory _$TodoListStateLoadingCopyWith(_TodoListStateLoading value,
          $Res Function(_TodoListStateLoading) then) =
      __$TodoListStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$TodoListStateLoadingCopyWithImpl<$Res>
    extends _$TodoListStateCopyWithImpl<$Res>
    implements _$TodoListStateLoadingCopyWith<$Res> {
  __$TodoListStateLoadingCopyWithImpl(
      _TodoListStateLoading _value, $Res Function(_TodoListStateLoading) _then)
      : super(_value, (v) => _then(v as _TodoListStateLoading));

  @override
  _TodoListStateLoading get _value => super._value as _TodoListStateLoading;
}

/// @nodoc

class _$_TodoListStateLoading extends _TodoListStateLoading {
  const _$_TodoListStateLoading() : super._();

  @override
  String toString() {
    return 'TodoListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _TodoListStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Task> todos) data,
    required TResult Function(String? error) error,
    required TResult Function() initial,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Task> todos)? data,
    TResult Function(String? error)? error,
    TResult Function()? initial,
    TResult Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Task> todos)? data,
    TResult Function(String? error)? error,
    TResult Function()? initial,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodoListStateData value) data,
    required TResult Function(_TodoListStateeError value) error,
    required TResult Function(_TodoListStateInitial value) initial,
    required TResult Function(_TodoListStateLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TodoListStateData value)? data,
    TResult Function(_TodoListStateeError value)? error,
    TResult Function(_TodoListStateInitial value)? initial,
    TResult Function(_TodoListStateLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoListStateData value)? data,
    TResult Function(_TodoListStateeError value)? error,
    TResult Function(_TodoListStateInitial value)? initial,
    TResult Function(_TodoListStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _TodoListStateLoading extends TodoListState {
  const factory _TodoListStateLoading() = _$_TodoListStateLoading;
  const _TodoListStateLoading._() : super._();
}
