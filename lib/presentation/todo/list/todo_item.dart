import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constancts.dart';
import '../../../utils/datetime.dart';
import '../../theme/app_theme.dart';

class Todo {
  Todo({
    required this.id,
    required this.name,
    required this.createAt,
    required this.status,
    this.desc,
  });

  final String id;
  final String name;
  final String? desc;
  final int createAt;
  final String status;
}

class TodoItem extends StatelessWidget {
  const TodoItem({
    Key? key,
    required this.item,
    this.onItemPressed,
    this.onStatusPressed,
    this.onDeletePressed,
  }) : super(key: key);

  final Todo item;
  final VoidCallback? onItemPressed;
  final VoidCallback? onStatusPressed;
  final VoidCallback? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).listTileTheme.tileColor,
      child: ListTile(
        isThreeLine: true,
        tileColor: Theme.of(context).listTileTheme.tileColor,
        title: Text(
          item.name,
          style: Theme.of(context).textTheme.subtitle1,
          maxLines: 2,
        ),
        leading: item.status == Constants.IN_PROGRESS
            ? const Icon(
                Icons.work,
                color: yellow,
                size: 24,
              )
            : const Icon(
                Icons.work,
                color: green,
                size: 24,
              ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PopupMenuButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              iconSize: 24,
              icon: const Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: Text(
                    item.status == Constants.COMPLETED ? 'Inprogress' : 'Complete',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  value: 0,
                ),
                PopupMenuItem(
                  child: Text(
                    'Delete',
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Theme.of(context).errorColor),
                  ),
                  value: 1,
                ),
              ],
              onSelected: (value) {
                switch (value) {
                  case 0:
                    onStatusPressed?.call();
                    break;
                  case 1:
                    onDeletePressed?.call();
                    break;
                  default:
                }
              },
            ),
            const SizedBox(),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.desc != null)
              Text(
                item.desc!,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6)),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            Text(
              'Create at: ${DateFormat.yMMMEd().add_Hm().format(DateTimeUtil.fromSecondsSinceEpoch(item.createAt))}',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6)),
            ),
          ],
        ),
        onTap: onItemPressed,
      ),
    );
  }
}
