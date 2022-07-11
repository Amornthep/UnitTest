import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'component/unfocus.dart';
import 'theme/app_theme.dart';
import 'todo/todo_page.dart';

class Application extends StatefulHookConsumerWidget {
  const Application({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ApplicationState();
}

class _ApplicationState extends ConsumerState<Application> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = ref.read(appThemeNotifierProvider);
    final themeMode = ref.watch(
      appThemeNotifierProvider.select((value) => value.setting),
    );

    useFuture(useMemoized(appTheme.themeMode, [themeMode]),
        initialData: ThemeMode.light);

    return GetMaterialApp(
      title: 'TODO',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home: const TodoPage(),
      builder: (context, child) {
        return Stack(
          children: [
            Unfocus(child: child!),
          ],
        );
      },
    );
  }
}
