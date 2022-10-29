import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/task.dart';
import '../../../domain/usecase/task/get_task_usecase.dart';
import '../../../domain/usecase/task/input.dart';
import '../../../domain/usecase/task/update_task_usecase.dart';

final updateTodoViewModelProvider =
    ChangeNotifierProvider.autoDispose<UpdateTodoViewModel>((ref) => UpdateTodoViewModel(
          ref.read(updateTaskCaseProvider),
          ref.read(getTaskCaseProvider),
        ));

class UpdateTodoViewModel extends ChangeNotifier {
  final UpdateTaskUseCase _updateTaskUseCase;
  final GetTaskUseCase _getTaskUseCase;

  Task _task = Task.empty();
  Task get task => _task;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _titleValidater;
  String? get titleValidater => _titleValidater;

  UpdateTodoViewModel(
    this._updateTaskUseCase,
    this._getTaskUseCase,
  );

  bool validateInput(String title) {
    _titleValidater = title.trim().isEmpty ? 'Title is required.' : null;
    notifyListeners();
    return _titleValidater == null;
  }

  Future<Task?> updateTodo({
    required UpdateTaskInput input,
  }) async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    try {
      final result = await _updateTaskUseCase.call(input);
      return result;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getTodo({
    required String id,
  }) async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    final result = await _getTaskUseCase.call(id);
    _isLoading = false;
    if (result != null) {
      _task = result;
      notifyListeners();
    } else {
      throw 'Not found';
    }
  }
}
