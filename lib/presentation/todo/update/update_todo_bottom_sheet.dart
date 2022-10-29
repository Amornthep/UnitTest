import 'dart:convert';
import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../constancts.dart';
import '../../../domain/entities/task.dart';
import '../../../domain/usecase/task/input.dart';
import '../../../utils/datetime.dart';
import '../../component/dialog.dart';
import 'update_todo_viewmodel.dart';

class UpdateTodoBottomSheet extends StatefulHookConsumerWidget {
  const UpdateTodoBottomSheet({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateTodoBottomSheetState();
}

class _UpdateTodoBottomSheetState extends ConsumerState<UpdateTodoBottomSheet> {
  final formKey = GlobalKey<FormState>();

  late ValueNotifier<String> statusSelected;
  late ValueNotifier<String?> imagePath;
  DateTime? createAt;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(updateTodoViewModelProvider)
          .getTodo(id: widget.task.id)
          .onError((error, stackTrace) => showErrorDialog());
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showErrorDialog() {
    showSimpleDialog(
      context,
      text: 'Not found task',
      title: 'Error',
      onPressed: () => Get.back(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final titleTextEditingController = useTextEditingController(text: '');
    final descTextEditingController = useTextEditingController(text: '');
    final createAtTextEditingController = useTextEditingController(text: '');

    return DraggableScrollableSheet(
        initialChildSize: 0.95,
        minChildSize: 0.7,
        maxChildSize: 0.95,
        expand: false,
        builder: (_, controller) {
          return SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      const HeaderView(),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  const Gap(24),
                                  Builder(builder: (context) {
                                    final task = ref.watch(updateTodoViewModelProvider.select((value) => value.task));
                                    WidgetsBinding.instance.addPostFrameCallback((_) {
                                      titleTextEditingController.value = TextEditingValue(text: task.title);
                                      descTextEditingController.value = TextEditingValue(text: task.description ?? '');
                                      createAtTextEditingController.value = TextEditingValue(
                                          text: DateFormat.yMMMMEEEEd()
                                              .format(DateTimeUtil.fromSecondsSinceEpoch(task.createAt)));
                                    });

                                    return Column(
                                      children: [
                                        UUIDSection(id: task.id),
                                        const Gap(24),
                                        TitleSection(controller: titleTextEditingController),
                                        const Gap(24),
                                        DescriptionSection(controller: descTextEditingController),
                                        const Gap(24),
                                        getStatusSection(task.status),
                                        const Gap(24),
                                        getCreateAtSection(createAtTextEditingController),
                                        const Gap(24),
                                        getSelectImageSection(task.image),
                                      ],
                                    );
                                  }),
                                  const Gap(40),
                                  getSaveButton(
                                    descController: descTextEditingController,
                                    titleController: titleTextEditingController,
                                  )
                                ],
                              ),
                            ),
                          ),
                          controller: controller,
                        ),
                      ),
                    ],
                  ),
                  const LoadingIndicator(),
                ],
              ),
            ),
          );
        });
  }

  Widget getSelectImageSection(String? image) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: HookBuilder(builder: (context) {
          imagePath = useState(null);
          return InkWell(
            borderRadius: BorderRadius.circular(46),
            onTap: () async {
              final image = await ImagePicker().pickImage(source: ImageSource.gallery);
              if (image != null) {
                imagePath.value = image.path;
              }
            },
            child: imagePath.value != null
                ? Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: Image.file(io.File(imagePath.value.toString())).image,
                      ),
                    ),
                  )
                : image != null
                    ? Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: Image.memory(base64Decode(image)).image,
                          ),
                        ),
                      )
                    : const Icon(
                        Icons.upload_file_rounded,
                        size: 90,
                      ),
          );
        }));
  }

  Widget getCreateAtSection(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        labelText: 'Create At',
        suffixIcon: Icon(
          Icons.expand_more,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      onTap: () async {
        final result = await showDateTimePickerDialog(
          context,
        );
        if (result != null) {
          createAt = result;
          controller.text = DateFormat.yMMMMEEEEd().format(result);
        }
      },
    );
  }

  Widget getSaveButton({
    required TextEditingController titleController,
    required TextEditingController descController,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: TextButton(
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          width: double.infinity,
          height: 40,
          alignment: Alignment.center,
          child: Text(
            'Save',
            style: Theme.of(context).textTheme.button?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        onPressed: () async {
          final viewModel = ref.read(updateTodoViewModelProvider);
          final isValid = viewModel.validateInput(titleController.text);

          if (isValid) {
            try {
              String? imageEncode;
              if (imagePath.value != null) {
                final bytes = await io.File(imagePath.value!).readAsBytes();
                imageEncode = base64Encode(bytes);
              }

              final input = UpdateTaskInput(
                createAt: createAt?.secondsSinceEpoch() ?? widget.task.createAt,
                status: statusSelected.value,
                title: titleController.text,
                description: descController.text.isEmpty ? null : descController.text,
                image: imageEncode ?? widget.task.image,
                id: widget.task.id,
              );

              final task = await viewModel.updateTodo(input: input);
              if (task != null) Get.back(result: task);
            } catch (error) {
              rethrow;
            }
          }
        },
      ),
    );
  }

  Widget getStatusSection(String status) {
    return HookBuilder(builder: (context) {
      statusSelected = useState(status);
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Status',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          ToggleButtons(
            isSelected: [
              statusSelected.value == Constants.IN_PROGRESS,
              statusSelected.value == Constants.COMPLETED,
            ],
            onPressed: (index) {
              statusSelected.value = index == 0 ? Constants.IN_PROGRESS : Constants.COMPLETED;
            },
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Inprogress',
                  style: Theme.of(context).textTheme.button?.copyWith(
                        color: statusSelected.value == Constants.IN_PROGRESS
                            ? Colors.white
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Completed',
                  style: Theme.of(context).textTheme.button?.copyWith(
                        color: statusSelected.value == Constants.COMPLETED
                            ? Colors.white
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}

class DescriptionSection extends ConsumerWidget {
  const DescriptionSection({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            labelText: 'Description',
          ),
          textInputAction: TextInputAction.next,
          minLines: 5,
          maxLines: 5,
          keyboardType: TextInputType.multiline,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

class TitleSection extends ConsumerWidget {
  const TitleSection({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleValidater = ref.watch(updateTodoViewModelProvider.select((value) => value.titleValidater));
    return Column(
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            labelText: 'Title',
            errorText: titleValidater,
          ),
          autofocus: true,
          textInputAction: TextInputAction.next,
          inputFormatters: [
            LengthLimitingTextInputFormatter(
              Constants.titleLimit,
            ),
          ],
        ),
      ],
    );
  }
}

class LoadingIndicator extends ConsumerWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(updateTodoViewModelProvider.select((value) => value.isLoading));
    return isLoading ? const Center(child: CircularProgressIndicator()) : const SizedBox();
  }
}

class UUIDSection extends StatelessWidget {
  const UUIDSection({Key? key, required this.id}) : super(key: key);

  final String id;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Id',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const Gap(24),
          ],
        ),
        Expanded(
          child: Text(
            id,
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

class HeaderView extends StatelessWidget {
  const HeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          child: Row(
            children: [
              Text(
                'Update Task',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
