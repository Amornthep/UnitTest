import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo/constancts.dart';
import 'package:todo/data/repositories/task_repository.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/domain/usecase/task/create_task_usecase.dart';
import 'package:todo/domain/usecase/task/input.dart';

import '../../../mock/data/datasource.dart';

void main() {
  setUp(() {
    registerFallbackValue(FakeTask());
  });

  test('should create taskssuccessfully', () async {
    final mockTaskRepository = MockTaskRepository();
    final container = ProviderContainer(overrides: [
      taskRepositoryProvider.overrideWithValue(mockTaskRepository)
    ]);
    const id = 'key123';
    const task =
        Task(id: id, title: 'title', createAt: 0, status: Constants.COMPLETED);
    final createTaskUsecase = container.read(createTaskUseCaseProvider);

    when(() => mockTaskRepository.addTask(any())).thenAnswer((_) async => {});

    final input = CreateTaskInput(
      title: task.title,
      createAt: task.createAt,
      status: task.status,
    );

    final result = await createTaskUsecase.call(input);
    expect(result.status, task.status);
    expect(result.title, task.title);
    expect(result.createAt, task.createAt);
  });
}
