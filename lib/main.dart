import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'presentation/application.dart';
import 'presentation/component/dialog.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const ProviderScope(child: Application()));
  }, (error, stackTrace) async {
    showSimpleDialog(
      Get.key.currentContext!,
      title: 'Error',
      text: '$error',
      hideNegativeButton: true,
      onPressed: () => Get.back(),
    );
  });
}
