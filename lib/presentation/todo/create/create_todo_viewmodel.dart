import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/task.dart';
import '../../../domain/usecase/task/create_task_usecase.dart';
import '../../../domain/usecase/task/input.dart';

final createTodoViewModelProvider =
    Provider.autoDispose<CreateTodoViewModel>((ref) => CreateTodoViewModel(
          ref.read(createTaskUseCaseProvider),
        ));

class CreateTodoViewModel {
  CreateTodoViewModel(
    this._createTaskUseCase,
  );

  final CreateTaskUseCase _createTaskUseCase;

  Future<Task?> createTodo({
    required CreateTaskInput input,
  }) async {
    final result = await _createTaskUseCase.call(input);
    return result;
  }
}
