import 'package:freezed_annotation/freezed_annotation.dart';

part 'input.freezed.dart';

@freezed
class CreateTaskInput with _$CreateTaskInput {
  const factory CreateTaskInput({
    required String title,
    String? description,
    required int createAt,
    String? imagePath,
    required String status,
  }) = _CreateTaskInput;
}

@freezed
class UpdateTaskInput with _$UpdateTaskInput {
  const factory UpdateTaskInput({
    required String id,
    required String title,
    String? description,
    required int createAt,
    String? image,
    required String status,
  }) = _UpdateTaskInput;
}
