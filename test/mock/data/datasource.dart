import 'package:mocktail/mocktail.dart';

import 'package:todo/data/datasources/local/task/task_datasource.dart';
import 'package:todo/data/datasources/local/theme/theme_datasource.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/domain/repositories/task_repository.dart';
import 'package:todo/external/local_storage/preference_local_storage.dart';

class MockTaskLocalDataSource extends Mock implements TaskDataSource {}

class MockThemeLocalDataSource extends Mock implements ThemeDataSource {}

class MockPreferenceStorage extends Mock implements PreferenceStorage {}

class MockTaskRepository extends Mock implements TaskRepository {}

class FakeTask extends Fake implements Task {}
