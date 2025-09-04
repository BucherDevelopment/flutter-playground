import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // DrawerHeader(child: Text('Chart-Examples')),#
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Charts - Examples', style: TextStyle(fontSize: 32)),
          ),
          ListTile(
            leading: Icon(Icons.show_chart),
            title: Text(
              'Line Chart',
              style: Theme.of(
                context,
              ).textTheme.titleSmall!.copyWith(fontSize: 24),
            ),
            onTap: () {
              onSelectScreen('line-chart');
            },
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text(
              'Bar Chart',
              style: Theme.of(
                context,
              ).textTheme.titleSmall!.copyWith(fontSize: 24),
            ),
            onTap: () {
              onSelectScreen('bar-chart');
            },
          ),
          ListTile(
            leading: Icon(Icons.pie_chart),
            title: Text(
              'Pie Chart',
              style: Theme.of(
                context,
              ).textTheme.titleSmall!.copyWith(fontSize: 24),
            ),
            onTap: () {
              onSelectScreen('pie-chart');
            },
          ),
        ],
      ),
    );
  }
}
