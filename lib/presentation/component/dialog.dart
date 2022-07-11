import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSimpleDialog(
  BuildContext context, {
  required String title,
  required String text,
  VoidCallback? onPressed,
  String? positiveButtonText,
  bool? hideNegativeButton,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(title),
        content: Text(text),
        actions: <Widget>[
          if (hideNegativeButton != true)
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () => Get.back(),
            ),
          TextButton(
            child: Text(positiveButtonText?.toUpperCase() ?? 'OK'),
            onPressed: onPressed,
          ),
        ],
      );
    },
  );
}

Future<DateTime?> showDateTimePickerDialog(
  BuildContext context, {
  DateTime? initialDateTime,
  DateTime? firstDate,
  DateTime? lastDate,
  bool isAllowFuture = false,
}) async {
  final now = DateTime.now();

  final date = await showDatePicker(
    context: context,
    initialDate: initialDateTime ?? now,
    firstDate: firstDate ?? DateTime(1970),
    lastDate: isAllowFuture ? (lastDate ?? now) : now,
  );
  if (date == null) return null;

  final time = await showTimePicker(
    context: context,
    initialTime: initialDateTime == null
        ? TimeOfDay.now()
        : TimeOfDay(
            hour: initialDateTime.hour,
            minute: initialDateTime.minute,
          ),
  );
  if (time == null) return null;

  return DateTime(
    date.year,
    date.month,
    date.day,
    time.hour,
    time.minute,
  );
}
