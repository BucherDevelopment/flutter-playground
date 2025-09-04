import 'package:flutter_riverpod/flutter_riverpod.dart';

enum DisplaySetting { all, done, notDone }

class FiltersProvider extends StateNotifier<DisplaySetting> {
  FiltersProvider() : super(DisplaySetting.all);

  void setFilterSetting(DisplaySetting newSetting) {
    state = newSetting;
  }
}

final filtersProvider = StateNotifierProvider<FiltersProvider, DisplaySetting>(
  (ref) => FiltersProvider(),
);
