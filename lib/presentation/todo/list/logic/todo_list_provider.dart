import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/presentation/todo/list/logic/todo_list_state.dart';

import '../../../../constancts.dart';
import '../../../../domain/entities/task.dart';
import '../../../../domain/usecase/task/delete_task_usecase.dart';
import '../../../../domain/usecase/task/get_tasks_usecase.dart';
import '../../../../domain/usecase/task/input.dart';
import '../../../../domain/usecase/task/update_task_usecase.dart';

part 'todo_list_state_notifier.dart';

final todoListProvider = StateNotifierProvider.autoDispose<TodoListStateNotifier, TodoListState>((ref) {
  return TodoListStateNotifier(
    deleteTaskUseCase: ref.watch(deleteTaskCaseProvider),
    getTasksUseCase: ref.watch(getTasksCaseProvider),
    updateTaskUseCase: ref.watch(updateTaskCaseProvider),
  );
});
