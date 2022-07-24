import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo/constancts.dart';
import 'package:todo/data/datasources/local/task/task_local_datasource.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/external/local_storage/preference_local_storage.dart';

import '../../../../mock/data/datasource.dart';

void main() {
  const String _listTask = 'key_listTask';

  setUp(() {});

  test('should load tasks successfully', () async {
    final mockLocalStorage = MockPreferenceStorage();
    final container =
        ProviderContainer(overrides: [preferenceLocalStorageProvider.overrideWithValue(mockLocalStorage)]);
    const id = 'key123';
    const task = Task(id: id, title: 'title', createAt: 0, status: Constants.COMPLETED);
    final taskLocalDataSource = container.read(taskLocalDataSourceProvider);

    when(() => mockLocalStorage.getListString(_listTask)).thenAnswer((_) async => [id]);
    when(() => mockLocalStorage.getString(id)).thenAnswer((_) async => jsonEncode(
          task.toJson(),
        ));

    final result = await taskLocalDataSource.loadTasks();
    expect(result, [task]);
  });

  test('should set tasks successfully', () async {
    final mockLocalStorage = MockPreferenceStorage();
    final container =
        ProviderContainer(overrides: [preferenceLocalStorageProvider.overrideWithValue(mockLocalStorage)]);
    const id = 'key123';
    const task = Task(id: id, title: 'title', createAt: 0, status: Constants.COMPLETED);
    final taskLocalDataSource = container.read(taskLocalDataSourceProvider);

    when(() => mockLocalStorage.setString(
          key: id,
          value: jsonEncode(task.toJson()),
        )).thenAnswer((_) async {});
    when(() => mockLocalStorage.setListString(
          key: _listTask,
          value: [id],
        )).thenAnswer((_) async {});
    when(() => mockLocalStorage.getListString(
          _listTask,
        )).thenAnswer((_) async => []);

    await taskLocalDataSource.addTask(task);

    verify(() => mockLocalStorage.getListString(_listTask)).called(1);
    verify(() => mockLocalStorage.setString(key: id, value: jsonEncode(task.toJson()))).called(1);
    verify(() => mockLocalStorage.setListString(key: _listTask, value: [id])).called(1);
  });

  test('should delete task successfully', () async {
    final mockLocalStorage = MockPreferenceStorage();
    final container =
        ProviderContainer(overrides: [preferenceLocalStorageProvider.overrideWithValue(mockLocalStorage)]);
    const id = 'key123';
    final taskLocalDataSource = container.read(taskLocalDataSourceProvider);

    when(() => mockLocalStorage.remove(id)).thenAnswer((_) async {});
    when(() => mockLocalStorage.setListString(
          key: _listTask,
          value: [],
        )).thenAnswer((_) async {});
    when(() => mockLocalStorage.getListString(
          _listTask,
        )).thenAnswer((_) async => [id]);

    await taskLocalDataSource.deleteTask(id);

    verify(() => mockLocalStorage.getListString(_listTask)).called(1);
    verify(() => mockLocalStorage.remove(id)).called(1);
    verify(() => mockLocalStorage.setListString(key: _listTask, value: [])).called(1);
  });

  test('should update task successfully', () async {
    final mockLocalStorage = MockPreferenceStorage();
    final container =
        ProviderContainer(overrides: [preferenceLocalStorageProvider.overrideWithValue(mockLocalStorage)]);
    const id = 'key123';
    const task = Task(id: id, title: 'title', createAt: 0, status: Constants.COMPLETED);
    final taskLocalDataSource = container.read(taskLocalDataSourceProvider);

    when(() => mockLocalStorage.setString(
          key: id,
          value: jsonEncode(task.toJson()),
        )).thenAnswer((_) async {});

    await taskLocalDataSource.updateTask(task);

    verify(() => mockLocalStorage.setString(key: id, value: jsonEncode(task.toJson()))).called(1);
  });
}
