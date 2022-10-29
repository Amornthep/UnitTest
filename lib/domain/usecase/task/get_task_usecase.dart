import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/repositories/task_repository.dart';
import '../../entities/task.dart';
import '../../repositories/task_repository.dart';

final getTaskCaseProvider = Provider<GetTaskUseCase>((ref) => GetTaskUseCase(ref.read(taskRepositoryProvider)));

class GetTaskUseCase {
  GetTaskUseCase(this._taskRepository);

  final TaskRepository _taskRepository;

  Future<Task?> call(String id) async {
    return _taskRepository.getTask(id);
  }
}
