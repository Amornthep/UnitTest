import '../../../../domain/entities/task.dart';

abstract class TaskDataSource {
  Future<List<Task>> loadTasks();

  Future<void> updateTask(Task task);

  Future<void> deleteTask(String id);

  Future<void> addTask(Task task);
}
