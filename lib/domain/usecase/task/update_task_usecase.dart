import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/repositories/task_repository.dart';
import '../../entities/task.dart';
import '../../repositories/task_repository.dart';
import 'input.dart';

final updateTaskCaseProvider = Provider<UpdateTaskUseCase>(
    (ref) => UpdateTaskUseCase(ref.read(taskRepositoryProvider)));

class UpdateTaskUseCase {
  UpdateTaskUseCase(this._taskRepository);

  final TaskRepository _taskRepository;

  Future<Task> call(UpdateTaskInput input) async {
    final task = Task(
      id: input.id,
      title: input.title,
      createAt: input.createAt,
      status: input.status,
      description: input.description,
      image: input.image,
    );
    await _taskRepository.updateTask(task);
    return task;
  }
}
