import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/domain/entities/task.dart';

part 'todo_list_state.freezed.dart';

@freezed
abstract class TodoListState with _$TodoListState {
  const TodoListState._();

  /// Data is present state
  const factory TodoListState.data({
    required List<Task> todos,
  }) = _TodoListStateData;

  /// Error when loading data state
  const factory TodoListState.error(String? error) = _TodoListStateeError;

  /// Initial/default state
  const factory TodoListState.initial() = _TodoListStateInitial;

  /// Data is loading state
  const factory TodoListState.loading() = _TodoListStateLoading;

  bool get isLoading => this is _TodoListStateLoading;
}
