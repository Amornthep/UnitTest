part of 'todo_list_provider.dart';

class TodoListStateNotifier extends StateNotifier<TodoListState> {
  TodoListStateNotifier({
    TodoListState? state,
    required GetTasksUseCase getTasksUseCase,
    required DeleteTaskUseCase deleteTaskUseCase,
    required UpdateTaskUseCase updateTaskUseCase,
  })  : _getTasksUseCase = getTasksUseCase,
        _deleteTaskUseCase = deleteTaskUseCase,
        _updateTaskUseCase = updateTaskUseCase,
        super(state ?? const TodoListState.initial());

  final GetTasksUseCase _getTasksUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;

  List<Task> _currentTasks = [];

  Future<void> getTasks() async {
    final result = await _getTasksUseCase.call();
    _currentTasks = result;
    state = TodoListState.data(todos: result);
  }

  Future<void> deleteTask(String id) async {
    await _deleteTaskUseCase.call(id);
    _currentTasks.removeWhere((e) => e.id == id);
    state = TodoListState.data(todos: _currentTasks);
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
    final newTask = await _updateTaskUseCase.call(updateInput);
    final index = _currentTasks.indexWhere((e) => e.id == task.id);
    if (index != -1) {
      _currentTasks[index] = newTask;
      state = TodoListState.data(todos: _currentTasks);
    }
  }

  void sortList({
    required Sortby sortby,
    String? query,
  }) {
    final newTasks = List.of(_currentTasks);

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
      final result =
          newTasks.where((e) => e.title.contains(query) || (e.description?.contains(query) ?? false)).toList();
      state = TodoListState.data(todos: result);
    } else {
      state = TodoListState.data(todos: newTasks);
    }
  }
}
