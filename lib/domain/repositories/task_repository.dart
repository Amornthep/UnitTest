import '../../../../domain/entities/task.dart';

abstract class TaskRepository {
  Future<List<Task>> loadTasks();

  Future<void> updateTask(Task task);

  Future<void> deleteTask(String id);

  Future<void> addTask(Task task);

  Future<Task?> getTask(String id);
}
