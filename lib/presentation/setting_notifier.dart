import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constancts.dart';

final settingNotifierProvider =
    ChangeNotifierProvider<SettingNotifier>((ref) => SettingNotifier());

class SettingNotifier extends ChangeNotifier {
  Sortby _sortby = Sortby.date;
  Sortby get sortby => _sortby;

  void setSortby(Sortby value) {
    _sortby = value;
    notifyListeners();
  }
}
