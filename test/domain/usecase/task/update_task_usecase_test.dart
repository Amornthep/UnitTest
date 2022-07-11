import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo/constancts.dart';
import 'package:todo/data/repositories/task_repository.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/domain/usecase/task/input.dart';
import 'package:todo/domain/usecase/task/update_task_usecase.dart';

import '../../../mock/data/datasource.dart';

void main() {
  setUp(() {});

  test('should update tasks successfully', () async {
    final mockTaskRepository = MockTaskRepository();
    final container = ProviderContainer(overrides: [
      taskRepositoryProvider.overrideWithValue(mockTaskRepository)
    ]);
    const id = 'key123';
    const task =
        Task(id: id, title: 'title', createAt: 0, status: Constants.COMPLETED);
    final updateTaskUsecase = container.read(updateTaskCaseProvider);

    when(() => mockTaskRepository.updateTask(task)).thenAnswer((_) async => {});

    final input = UpdateTaskInput(
      title: task.title,
      createAt: task.createAt,
      status: task.status,
      id: id,
    );

    final result = await updateTaskUsecase.call(input);
    expect(result.status, task.status);
    expect(result.title, task.title);
    expect(result.createAt, task.createAt);
  });
}
