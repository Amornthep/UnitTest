import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// A widget that unfocus everything when tapped.

// This implements the "Unfocus when tapping in empty space" behavior for the
// entire application.
class Unfocus extends ConsumerWidget {
  const Unfocus({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
