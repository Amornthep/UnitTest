import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo/constancts.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/domain/usecase/task/delete_task_usecase.dart';
import 'package:todo/domain/usecase/task/get_tasks_usecase.dart';
import 'package:todo/domain/usecase/task/input.dart';
import 'package:todo/domain/usecase/task/update_task_usecase.dart';
import 'package:todo/presentation/todo/list/logic/todo_list_provider.dart';
import 'package:todo/presentation/todo/list/logic/todo_list_state.dart';

class DeleteTaskUseCaseMock extends Mock implements DeleteTaskUseCase {}

class GetTasksUseCaseMock extends Mock implements GetTasksUseCase {}

class UpdateTaskUseCaseMock extends Mock implements UpdateTaskUseCase {}

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
    test(
        'GIVE User '
        'WHEN user sortby title '
        'THEN response list with sort successfully', () async {
      final getTasksUseCaseMock = GetTasksUseCaseMock();
      final notifier = TodoListStateNotifier(
        deleteTaskUseCase: DeleteTaskUseCaseMock(),
        getTasksUseCase: getTasksUseCaseMock,
        updateTaskUseCase: UpdateTaskUseCaseMock(),
      );

      when(() => getTasksUseCaseMock.call()).thenAnswer((_) async => tasks);

      TodoListState? todoListState;
      notifier.addListener((state) {
        todoListState = state;
      });
      await notifier.getTasks();
      notifier.sortList(sortby: Sortby.title);
      List<Task> sortTasks = [];
      todoListState?.whenOrNull(data: (data) {
        sortTasks = data;
      });

      expect(sortTasks[0].id, '2');
      expect(sortTasks[1].id, '1');
      expect(sortTasks[2].id, '3');
    });

    test(
        'GIVE User '
        'WHEN user sortby date '
        'THEN response list with sort successfully', () async {
      final getTasksUseCaseMock = GetTasksUseCaseMock();
      final notifier = TodoListStateNotifier(
        deleteTaskUseCase: DeleteTaskUseCaseMock(),
        getTasksUseCase: getTasksUseCaseMock,
        updateTaskUseCase: UpdateTaskUseCaseMock(),
      );

      when(() => getTasksUseCaseMock.call()).thenAnswer((_) async => tasks);

      TodoListState? todoListState;
      notifier.addListener((state) {
        todoListState = state;
      });
      await notifier.getTasks();
      notifier.sortList(sortby: Sortby.date);
      List<Task> sortTasks = [];
      todoListState?.whenOrNull(data: (data) {
        sortTasks = data;
      });

      expect(sortTasks[0].id, '1');
      expect(sortTasks[1].id, '2');
      expect(sortTasks[2].id, '3');
    });

    test(
        'GIVE User '
        'WHEN user sortby status '
        'THEN response list with sort successfully', () async {
      final getTasksUseCaseMock = GetTasksUseCaseMock();
      final notifier = TodoListStateNotifier(
        deleteTaskUseCase: DeleteTaskUseCaseMock(),
        getTasksUseCase: getTasksUseCaseMock,
        updateTaskUseCase: UpdateTaskUseCaseMock(),
      );

      when(() => getTasksUseCaseMock.call()).thenAnswer((_) async => tasks);

      TodoListState? todoListState;
      notifier.addListener((state) {
        todoListState = state;
      });
      await notifier.getTasks();
      notifier.sortList(sortby: Sortby.status);
      List<Task> sortTasks = [];
      todoListState?.whenOrNull(data: (data) {
        sortTasks = data;
      });

      expect(sortTasks[0].id, '1');
      expect(sortTasks[1].id, '3');
      expect(sortTasks[2].id, '2');
    });
  });

  group('search()', () {
    test(
        'GIVE User '
        'WHEN user search with title '
        'THEN response list with search successfully', () async {
      final getTasksUseCaseMock = GetTasksUseCaseMock();
      final notifier = TodoListStateNotifier(
        deleteTaskUseCase: DeleteTaskUseCaseMock(),
        getTasksUseCase: getTasksUseCaseMock,
        updateTaskUseCase: UpdateTaskUseCaseMock(),
      );

      when(() => getTasksUseCaseMock.call()).thenAnswer((_) async => tasks);

      TodoListState? todoListState;
      notifier.addListener((state) {
        todoListState = state;
      });
      await notifier.getTasks();
      const query = 'a';
      notifier.sortList(sortby: Sortby.status, query: query);
      List<Task> sortTasks = [];
      todoListState?.whenOrNull(data: (data) {
        sortTasks = data;
      });

      expect(sortTasks.length, 1);
      expect(sortTasks[0].id, '2');
    });

    test(
        'GIVE User '
        'WHEN user search with desc '
        'THEN response list with search successfully', () async {
      final getTasksUseCaseMock = GetTasksUseCaseMock();
      final notifier = TodoListStateNotifier(
        deleteTaskUseCase: DeleteTaskUseCaseMock(),
        getTasksUseCase: getTasksUseCaseMock,
        updateTaskUseCase: UpdateTaskUseCaseMock(),
      );

      when(() => getTasksUseCaseMock.call()).thenAnswer((_) async => tasks);

      TodoListState? todoListState;
      notifier.addListener((state) {
        todoListState = state;
      });
      await notifier.getTasks();
      const query = 'descc';
      notifier.sortList(sortby: Sortby.date, query: query);
      List<Task> sortTasks = [];
      todoListState?.whenOrNull(data: (data) {
        sortTasks = data;
      });
      expect(sortTasks.length, 1);
      expect(sortTasks[0].id, '3');
    });

    test(
        'GIVE User '
        'WHEN user search with desc and sort by date '
        'THEN response list with search successfully', () async {
      final getTasksUseCaseMock = GetTasksUseCaseMock();
      final notifier = TodoListStateNotifier(
        deleteTaskUseCase: DeleteTaskUseCaseMock(),
        getTasksUseCase: getTasksUseCaseMock,
        updateTaskUseCase: UpdateTaskUseCaseMock(),
      );

      when(() => getTasksUseCaseMock.call()).thenAnswer((_) async => tasks);

      TodoListState? todoListState;
      notifier.addListener((state) {
        todoListState = state;
      });
      await notifier.getTasks();
      const query = 'desc';
      notifier.sortList(sortby: Sortby.date, query: query);
      List<Task> sortTasks = [];
      todoListState?.whenOrNull(data: (data) {
        sortTasks = data;
      });
      expect(sortTasks.length, 3);
      expect(sortTasks[0].id, '1');
      expect(sortTasks[1].id, '2');
      expect(sortTasks[2].id, '3');
    });
  });

  test(
      'GIVE User '
      'WHEN user get tasks '
      'THEN response list successfully', () async {
    final getTasksUseCaseMock = GetTasksUseCaseMock();
    final notifier = TodoListStateNotifier(
      deleteTaskUseCase: DeleteTaskUseCaseMock(),
      getTasksUseCase: getTasksUseCaseMock,
      updateTaskUseCase: UpdateTaskUseCaseMock(),
    );

    when(() => getTasksUseCaseMock.call()).thenAnswer((_) async => tasks);

    TodoListState? todoListState;
    notifier.addListener((state) {
      todoListState = state;
    });
    await notifier.getTasks();
    List<Task> newTasks = [];
    todoListState?.whenOrNull(data: (data) {
      newTasks = data;
    });

    expect(newTasks.length, 3);
    expect(newTasks, tasks);
    expect(todoListState, TodoListState.data(todos: tasks));
  });

  test(
      'GIVE User '
      'WHEN user update task '
      'THEN response list successfully', () async {
    final getTasksUseCaseMock = GetTasksUseCaseMock();
    final updateTaskUseCaseMock = UpdateTaskUseCaseMock();
    final notifier = TodoListStateNotifier(
      deleteTaskUseCase: DeleteTaskUseCaseMock(),
      getTasksUseCase: getTasksUseCaseMock,
      updateTaskUseCase: updateTaskUseCaseMock,
    );

    const task = Task(id: '1', title: 'title', createAt: 0, status: Constants.COMPLETED);

    final input = UpdateTaskInput(
      title: task.title,
      createAt: task.createAt,
      status: task.status,
      id: task.id,
    );

    when(() => getTasksUseCaseMock.call()).thenAnswer((_) async => tasks);
    when(() => updateTaskUseCaseMock.call(input)).thenAnswer((_) async => task);

    TodoListState? todoListState;
    notifier.addListener((state) {
      todoListState = state;
    });
    await notifier.getTasks();
    await notifier.updateTask(task);

    List<Task> newTasks = [];
    todoListState?.whenOrNull(data: (data) {
      newTasks = data;
    });

    expect(newTasks.length, 3);
    final _task = newTasks.firstWhere((e) => e.id == '1');
    expect(_task, task);
  });

  test(
      'GIVE User '
      'WHEN user delete task '
      'THEN response list successfully', () async {
    final getTasksUseCaseMock = GetTasksUseCaseMock();
    final deleteTaskUseCaseMock = DeleteTaskUseCaseMock();

    final notifier = TodoListStateNotifier(
      deleteTaskUseCase: deleteTaskUseCaseMock,
      getTasksUseCase: getTasksUseCaseMock,
      updateTaskUseCase: UpdateTaskUseCaseMock(),
    );

    const id = '1';
    when(() => getTasksUseCaseMock.call()).thenAnswer((_) async => tasks);
    when(() => deleteTaskUseCaseMock.call(id)).thenAnswer((_) async => {});

    TodoListState? todoListState;
    notifier.addListener((state) {
      todoListState = state;
    });
    await notifier.getTasks();
    await notifier.deleteTask(id);

    List<Task> newTasks = [];
    todoListState?.whenOrNull(data: (data) {
      newTasks = data;
    });

    expect(newTasks.length, 2);
    final _tasks = newTasks.where((e) => e.id == id);
    expect(_tasks.length, 0);
  });
}
