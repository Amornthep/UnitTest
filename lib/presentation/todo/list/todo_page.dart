import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../constancts.dart';
import '../../../domain/entities/task.dart';
import '../../component/dialog.dart';
import '../../component/empty_state.dart';
import '../../component/search_bar.dart';
import '../../setting_notifier.dart';
import '../create/create_todo_bottom_sheet.dart';
import '../setting/setting_bottom_sheet.dart';
import 'logic/todo_list_provider.dart';
import 'todo_item.dart';
import '../update/update_todo_bottom_sheet.dart';

class TodoPage extends StatefulHookConsumerWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends ConsumerState<TodoPage> {
  final controller = PagingController<String?, TodoItem>(firstPageKey: null);

  String? storeId;
  String? query;
  bool isSearching = false;

  late final SearchBar searchBar = _buildSearchBar();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    controller.addPageRequestListener((pageKey) {
      _searchTask(
        storeId: storeId ?? '',
        controller: controller,
        query: query,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sortby = ref.watch(settingNotifierProvider.select((value) => value.sortby));

    ref.watch(todoListProvider).whenOrNull(data: (data) {
      final items = data.map((e) => convertTaskToTodoItem(e)).toList();
      controller.itemList = items;
      controller.nextPageKey = null;
    });

    useEffect(() {
      controller.refresh();
      return;
    }, [sortby]);

    return Scaffold(
      appBar: searchBar.build(context),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.settings),
        onPressed: () => showSettingBottomSheet(),
      ),
      body: SafeArea(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: RefreshIndicator(
            onRefresh: () async {
              controller.refresh();
            },
            child: PagedListView<String?, TodoItem>.separated(
              pagingController: controller,
              padding: const EdgeInsets.only(top: 8),
              builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (context, item, index) => item,
                noItemsFoundIndicatorBuilder: (_) => isSearching == false
                    ? EmptyState(
                        image: Icon(
                          Icons.task,
                          color: Theme.of(context).iconTheme.color,
                          size: 100,
                        ),
                        title: 'Empty Task',
                        subtitle: 'Add new task and it show up here.',
                      )
                    : EmptyState(
                        image: Icon(
                          Icons.task,
                          color: Theme.of(context).iconTheme.color,
                          size: 100,
                        ),
                        title: 'No result',
                      ),
              ),
              separatorBuilder: (context, _) => const Divider(
                height: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }

  SearchBar _buildSearchBar() {
    return SearchBar(
      setState: setState,
      closeOnSubmit: false,
      hintText: 'Title, Description',
      onChanged: (value) {
        isSearching = true;
        EasyDebounce.debounce(
          'onChanged',
          const Duration(milliseconds: 300),
          () => _onSearchBarTextChanged(value),
        );
      },
      onClosed: () {
        isSearching = false;
        _onSearchBarTextChanged(null);
      },
      onCleared: () => _onSearchBarTextChanged(null),
      buildDefaultAppBar: _buildAppBar,
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Todo',
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: [
        searchBar.getSearchAction(context),
        IconButton(
          icon: const Icon(Icons.add),
          color: Theme.of(context).iconTheme.color,
          onPressed: () => showCreateTaskBottomSheet(),
        )
      ],
    );
  }

  void _onSearchBarTextChanged(String? text) {
    if (text == query) return;
    query = text;
    controller.refresh();
  }

  Future<void> _searchTask({
    required PagingController<String?, TodoItem> controller,
    required String storeId,
    String? query,
  }) async {
    try {
      final todoListProviderNotifier = ref.read(todoListProvider.notifier);
      final sortby = ref.read(settingNotifierProvider).sortby;
      await todoListProviderNotifier.getTasks();
      todoListProviderNotifier.sortList(
        sortby: sortby,
        query: query,
      );
    } catch (error) {
      rethrow;
    }
  }

  TodoItem convertTaskToTodoItem(Task task) {
    final item = Todo(
      id: task.id,
      name: task.title,
      createAt: task.createAt,
      status: task.status,
      desc: task.description,
    );
    return TodoItem(
      item: item,
      onItemPressed: () => showUpdateTaskBottomSheet(task),
      onDeletePressed: () => showConfirmDeleteCustomerDialog(task),
      onStatusPressed: () => changeStatus(task),
    );
  }

  void showUpdateTaskBottomSheet(Task task) async {
    final result = await showModalBottomSheet<Task>(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      isScrollControlled: true,
      builder: (context) => UpdateTodoBottomSheet(
        task: task,
      ),
    );

    if (result != null) {
      controller.refresh();
    }
  }

  void showCreateTaskBottomSheet() async {
    final result = await showModalBottomSheet<Task>(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      isScrollControlled: true,
      builder: (context) => const CreateTodoBottomSheet(),
    );

    if (result != null) {
      controller.refresh();
    }
  }

  void showConfirmDeleteCustomerDialog(Task task) {
    showSimpleDialog(
      context,
      title: 'Delete Task',
      text: 'Are you sure you want to delete?',
      positiveButtonText: 'DELETE',
      hideNegativeButton: false,
      onPressed: () async {
        Get.back();
        await ref.read(todoListProvider.notifier).deleteTask(task.id);
      },
    );
  }

  Future<void> changeStatus(Task task) async {
    final updateTask = task.copyWith(
      status: task.status == Constants.IN_PROGRESS ? Constants.COMPLETED : Constants.IN_PROGRESS,
    );
    await ref.read(todoListProvider.notifier).updateTask(updateTask);
  }

  void showSettingBottomSheet() async {
    await showModalBottomSheet(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      isScrollControlled: true,
      builder: (context) => const SettingBottomSheet(),
    );
  }
}
