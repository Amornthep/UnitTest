import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/repositories/task_repository.dart';
import '../../entities/task.dart';
import '../../repositories/task_repository.dart';

final getTasksCaseProvider = Provider<GetTasksUseCase>(
    (ref) => GetTasksUseCase(ref.read(taskRepositoryProvider)));

class GetTasksUseCase {
  GetTasksUseCase(this._taskRepository);

  final TaskRepository _taskRepository;

  Future<List<Task>> call() async {
    return _taskRepository.loadTasks();
  }
}
