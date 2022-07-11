import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/repositories/task_repository.dart';
import '../../repositories/task_repository.dart';

final deleteTaskCaseProvider = Provider<DeleteTaskUseCase>(
    (ref) => DeleteTaskUseCase(ref.read(taskRepositoryProvider)));

class DeleteTaskUseCase {
  DeleteTaskUseCase(this._taskRepository);

  final TaskRepository _taskRepository;

  Future<void> call(String id) async {
    await _taskRepository.deleteTask(id);
  }
}
