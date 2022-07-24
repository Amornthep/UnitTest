import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/constancts.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/presentation/todo/list/todo_viewmodel.dart';

void main() {
  final tasks = [
    const Task(
      id: '1',
      title: 'b',
      description: 'desc1',
      createAt: 2,
      status: Constants.IN_PROGRESS,
    ),
    const Task(
      id: '2',
      title: 'a',
      description: 'desc',
      createAt: 1,
      status: Constants.COMPLETED,
    ),
    const Task(
      id: '3',
      title: 'c',
      description: 'descc',
      createAt: 0,
      status: Constants.IN_PROGRESS,
    ),
  ];
  group('sort()', () {
    test('should sortby title successfully', () async {
      final container = ProviderContainer();
      final todoViewModel = container.read(todoViewModelProvider);

      final sortTasks = todoViewModel.sortList(sortby: Sortby.title, tasks: tasks);
      expect(sortTasks[0].id, '2');
      expect(sortTasks[1].id, '1');
      expect(sortTasks[2].id, '3');
    });

    test('should sortby date successfully', () async {
      final container = ProviderContainer();
      final todoViewModel = container.read(todoViewModelProvider);

      final sortTasks = todoViewModel.sortList(sortby: Sortby.date, tasks: tasks);
      expect(sortTasks[0].id, '1');
      expect(sortTasks[1].id, '2');
      expect(sortTasks[2].id, '3');
    });

    test('should sortby status successfully', () async {
      final container = ProviderContainer();
      final todoViewModel = container.read(todoViewModelProvider);

      final sortTasks = todoViewModel.sortList(sortby: Sortby.status, tasks: tasks);
      expect(sortTasks[0].id, '1');
      expect(sortTasks[1].id, '3');
      expect(sortTasks[2].id, '2');
    });
  });

  group('search()', () {
    test('should search title successfully', () async {
      final container = ProviderContainer();
      final todoViewModel = container.read(todoViewModelProvider);

      const query = 'a';
      final searchTasks = todoViewModel.sortList(sortby: Sortby.title, tasks: tasks, query: query);
      expect(searchTasks.length, 1);
      expect(searchTasks[0].id, '2');
    });

    test('should search desc successfully', () async {
      final container = ProviderContainer();
      final todoViewModel = container.read(todoViewModelProvider);

      const query = 'descc';
      final searchTasks = todoViewModel.sortList(
        sortby: Sortby.date,
        tasks: tasks,
        query: query,
      );
      expect(searchTasks.length, 1);
      expect(searchTasks[0].id, '3');
    });

    test('should search and sort successfully', () async {
      final container = ProviderContainer();
      final todoViewModel = container.read(todoViewModelProvider);

      const query = 'desc';
      final searchTasks = todoViewModel.sortList(
        sortby: Sortby.date,
        tasks: tasks,
        query: query,
      );
      expect(searchTasks.length, 3);
      expect(searchTasks[0].id, '1');
      expect(searchTasks[1].id, '2');
      expect(searchTasks[2].id, '3');
    });
  });
}
