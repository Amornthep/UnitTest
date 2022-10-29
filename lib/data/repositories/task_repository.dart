import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/local/task/task_datasource.dart';
import '../datasources/local/task/task_local_datasource.dart';

final taskRepositoryProvider =
    Provider<TaskRepository>((ref) => TaskRepositoryImpl(ref.read(taskLocalDataSourceProvider)));

class TaskRepositoryImpl extends TaskRepository {
  final TaskDataSource _taskDataSource;

  TaskRepositoryImpl(this._taskDataSource);

  @override
  Future<void> addTask(Task task) {
    return _taskDataSource.addTask(task);
  }

  @override
  Future<void> deleteTask(String id) {
    return _taskDataSource.deleteTask(id);
  }

  @override
  Future<List<Task>> loadTasks() {
    return _taskDataSource.loadTasks();
  }

  @override
  Future<void> updateTask(Task task) {
    return _taskDataSource.updateTask(task);
  }

  @override
  Future<Task?> getTask(String id) {
    return _taskDataSource.getTask(id);
  }
}
