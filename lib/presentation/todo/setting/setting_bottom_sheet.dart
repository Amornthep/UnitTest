import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constancts.dart';
import '../../setting_notifier.dart';
import '../../theme/app_theme.dart';

class SettingBottomSheet extends StatefulHookConsumerWidget {
  const SettingBottomSheet({Key? key}) : super(key: key);

  @override
  _SettingBottomSheetState createState() => _SettingBottomSheetState();
}

class _SettingBottomSheetState extends ConsumerState<SettingBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Wrap(
            children: [
              getHeaderView(),
              Container(
                child: Column(children: [
                  const Gap(24),
                  getSortbySection(),
                  const Gap(24),
                  getThemeSection(),
                  const Gap(40),
                ]),
                padding: const EdgeInsets.symmetric(horizontal: 16),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getThemeSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Dark Mode',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        HookBuilder(builder: (context) {
          final currentTheme = ref.watch(
            appThemeNotifierProvider.select((value) => value.setting),
          );

          return Switch(
              value: currentTheme == ThemeMode.dark,
              onChanged: (value) async {
                await ref.read(appThemeNotifierProvider).toggle();
              });
        }),
      ],
    );
  }

  Widget getSortbySection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Sortby',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        HookBuilder(builder: (context) {
          final sortby = useState(ref.read(settingNotifierProvider).sortby);

          return ToggleButtons(
            isSelected: [
              sortby.value == Sortby.date,
              sortby.value == Sortby.title,
              sortby.value == Sortby.status,
            ],
            onPressed: (index) {
              switch (index) {
                case 0:
                  sortby.value = Sortby.date;
                  break;
                case 1:
                  sortby.value = Sortby.title;
                  break;
                case 2:
                  sortby.value = Sortby.status;
                  break;
                default:
              }
              ref.read(settingNotifierProvider).setSortby(sortby.value);
            },
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Date',
                  style: Theme.of(context).textTheme.button?.copyWith(
                        color: sortby.value == Sortby.date
                            ? Colors.white
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Title',
                  style: Theme.of(context).textTheme.button?.copyWith(
                        color: sortby.value == Sortby.title
                            ? Colors.white
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Status',
                  style: Theme.of(context).textTheme.button?.copyWith(
                        color: sortby.value == Sortby.status
                            ? Colors.white
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
            ],
          );
        }),
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
                'Setting',
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
