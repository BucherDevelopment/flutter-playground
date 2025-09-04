import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_planner/providers/filters_provider.dart';

class MainDrawer extends ConsumerWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: Text('All Tasks'),
            onTap: () {
              ref
                  .read(filtersProvider.notifier)
                  .setFilterSetting(DisplaySetting.all);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text('Tasks to do'),
            onTap: () {
              ref
                  .read(filtersProvider.notifier)
                  .setFilterSetting(DisplaySetting.notDone);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text('finished Tasks'),
            onTap: () {
              ref
                  .read(filtersProvider.notifier)
                  .setFilterSetting(DisplaySetting.done);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
