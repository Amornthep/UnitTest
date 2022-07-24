import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constancts.dart';
import '../../../domain/entities/task.dart';
import '../../../domain/usecase/task/delete_task_usecase.dart';
import '../../../domain/usecase/task/get_tasks_usecase.dart';
import '../../../domain/usecase/task/input.dart';
import '../../../domain/usecase/task/update_task_usecase.dart';

final todoViewModelProvider = Provider.autoDispose<TodoViewModel>((ref) => TodoViewModel(
      ref.read(getTasksCaseProvider),
      ref.read(deleteTaskCaseProvider),
      ref.read(updateTaskCaseProvider),
    ));

class TodoViewModel {
  TodoViewModel(this._getTasksUseCase, this._deleteTaskUseCase, this._updateTaskUseCase);

  final GetTasksUseCase _getTasksUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;

  Future<List<Task>> getTasks() async {
    final result = await _getTasksUseCase.call();
    return result;
  }

  Future<void> deleteTask(String id) async {
    await _deleteTaskUseCase.call(id);
  }

  Future<void> updateTask(Task task) async {
    final updateInput = UpdateTaskInput(
      id: task.id,
      status: task.status,
      title: task.title,
      description: task.description,
      image: task.image,
      createAt: task.createAt,
    );
    await _updateTaskUseCase.call(updateInput);
  }

  List<Task> sortList({
    required Sortby sortby,
    required List<Task> tasks,
    String? query,
  }) {
    final newTasks = List.of(tasks);

    switch (sortby) {
      case Sortby.date:
        newTasks.sort((a, b) => b.createAt.compareTo(a.createAt));
        break;
      case Sortby.title:
        newTasks.sort((a, b) => a.title.compareTo(b.title));
        break;
      case Sortby.status:
        newTasks.sort((a, b) => b.status.compareTo(a.status));
        break;
      default:
    }

    if (query != null) {
      return newTasks.where((e) => e.title.contains(query) || (e.description?.contains(query) ?? false)).toList();
    }
    return newTasks;
  }
}
