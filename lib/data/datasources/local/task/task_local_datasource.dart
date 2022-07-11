import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/task.dart';
import '../../../../external/local_storage/local_storage.dart';
import '../../../../external/local_storage/preference_local_storage.dart';
import 'task_datasource.dart';

final taskLocalDataSourceProvider = Provider<TaskLocalDataSource>(
    (ref) => TaskLocalDataSource(ref.read(preferenceLocalStorageProvider)));

class TaskLocalDataSource extends TaskDataSource {
  TaskLocalDataSource(this._localStorage);
  static const String _listTask = 'key_listTask';

  final LocalStorage _localStorage;

  @override
  Future<void> deleteTask(String id) async {
    await _localStorage.remove(id);
    final List<String> taskIds =
        await _localStorage.getListString(_listTask) ?? [];
    taskIds.remove(id);
    await _localStorage.setListString(key: _listTask, value: taskIds);
  }

  @override
  Future<List<Task>> loadTasks() async {
    final List<String> taskIds =
        await _localStorage.getListString(_listTask) ?? [];
    List<Task> tasks = [];
    for (String taskId in taskIds) {
      final taskJson = await _localStorage.getString(taskId);
      if (taskJson != null) {
        Map<String, dynamic> json = jsonDecode(taskJson);
        final item = Task.fromJson(json);
        tasks.add(item);
      }
    }
    return tasks;
  }

  @override
  Future<void> updateTask(Task task) async {
    await _localStorage.setString(
        key: task.id,
        value: jsonEncode(
          task.toJson(),
        ));
  }

  @override
  Future<void> addTask(Task task) async {
    await _localStorage.setString(
      key: task.id,
      value: jsonEncode(task.toJson()),
    );
    final List<String> taskIds =
        await _localStorage.getListString(_listTask) ?? [];
    taskIds.add(task.id);
    await _localStorage.setListString(
      key: _listTask,
      value: taskIds,
    );
  }
}
