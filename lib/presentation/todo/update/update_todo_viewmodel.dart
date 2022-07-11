import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/task.dart';
import '../../../domain/usecase/task/input.dart';
import '../../../domain/usecase/task/update_task_usecase.dart';

final updateTodoViewModelProvider =
    Provider.autoDispose<UpdateTodoViewModel>((ref) => UpdateTodoViewModel(
          ref.read(updateTaskCaseProvider),
        ));

class UpdateTodoViewModel {
  UpdateTodoViewModel(
    this._updateTaskUseCase,
  );

  final UpdateTaskUseCase _updateTaskUseCase;

  Future<Task?> updateTodo({
    required UpdateTaskInput input,
  }) async {
    final result = await _updateTaskUseCase.call(input);
    return result;
  }
}
