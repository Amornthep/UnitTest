import 'dart:convert';
import 'dart:io' as io;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../data/repositories/task_repository.dart';
import '../../entities/task.dart';
import '../../repositories/task_repository.dart';
import 'input.dart';

final createTaskUseCaseProvider = Provider<CreateTaskUseCase>(
    (ref) => CreateTaskUseCase(ref.read(taskRepositoryProvider)));

class CreateTaskUseCase {
  CreateTaskUseCase(this._taskRepository);

  final TaskRepository _taskRepository;

  Future<Task> call(CreateTaskInput input) async {
    final uuid = const Uuid().v1();
    String? imageEncode;
    if (input.imagePath != null) {
      final bytes = await io.File(input.imagePath!).readAsBytes();
      imageEncode = base64Encode(bytes);
    }
    final task = Task(
      id: uuid,
      title: input.title,
      createAt: input.createAt,
      status: input.status,
      description: input.description,
      image: imageEncode,
    );
    await _taskRepository.addTask(task);
    return task;
  }
}
