import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:queen_validators/queen_validators.dart';

import '../../../constancts.dart';
import '../../../domain/usecase/task/input.dart';
import '../../../utils/datetime.dart';
import '../../component/dialog.dart';
import 'create_todo_viewmodel.dart';

class CreateTodoBottomSheet extends StatefulHookConsumerWidget {
  const CreateTodoBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpdateTodoBottomSheetState();
}

class _UpdateTodoBottomSheetState extends ConsumerState<CreateTodoBottomSheet> {
  final formKey = GlobalKey<FormState>();

  late ValueNotifier<String> statusSelected;
  late ValueNotifier<String?> imagePath;
  DateTime createAt = DateTime.now();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final titleTextEditingController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final descTextEditingController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final createAtTextEditingController = useTextEditingController(
        text: DateFormat.yMMMMEEEEd().format(DateTime.now()));

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
              child: Column(
                children: [
                  getHeaderView(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              const Gap(24),
                              getTitleSection(
                                  controller: titleTextEditingController),
                              const Gap(24),
                              getDescriptionSection(
                                  controller: descTextEditingController),
                              const Gap(24),
                              getStatusSection(),
                              const Gap(24),
                              getCreateAtSection(createAtTextEditingController),
                              const Gap(24),
                              getSelectImageSection(),
                              const Gap(40),
                              getCreateButton(
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
            ),
          );
        });
  }

  Widget getSelectImageSection() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: HookBuilder(builder: (context) {
          imagePath = useState(null);
          return InkWell(
            borderRadius: BorderRadius.circular(46),
            onTap: () async {
              final image =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
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
                        image:
                            Image.file(File(imagePath.value.toString())).image,
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

  Widget getCreateButton({
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
            'Create',
            style: Theme.of(context).textTheme.button?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        onPressed: () async {
          final isValid = formKey.currentState!.validate();

          if (isValid) {
            try {
              final viewModel = ref.read(createTodoViewModelProvider);
              final input = CreateTaskInput(
                createAt: createAt.secondsSinceEpoch(),
                status: statusSelected.value,
                title: titleController.text,
                description:
                    descController.text.isEmpty ? null : descController.text,
                imagePath: imagePath.value,
              );
              final task = await viewModel.createTodo(input: input);
              if (task != null) Get.back(result: task);
            } catch (error) {
              rethrow;
            }
          }
        },
      ),
    );
  }

  Widget getTitleSection({
    required TextEditingController controller,
  }) {
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
            labelText: 'Title',
          ),
          autofocus: true,
          textInputAction: TextInputAction.next,
          inputFormatters: [
            LengthLimitingTextInputFormatter(
              Constants.titleLimit,
            ),
          ],
          validator: qValidator([
            const IsRequired(
              'Title is required.',
            ),
          ]),
        ),
      ],
    );
  }

  Widget getStatusSection() {
    return HookBuilder(builder: (context) {
      statusSelected = useState(Constants.IN_PROGRESS);
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
              statusSelected.value =
                  index == 0 ? Constants.IN_PROGRESS : Constants.COMPLETED;
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

  Widget getDescriptionSection({
    required TextEditingController controller,
  }) {
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

  Widget getHeaderView() {
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
                'Create Task',
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
