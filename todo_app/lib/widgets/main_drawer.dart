import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(title: const Text('Menü')),
          ListTile(
            leading: const Icon(Icons.task),
            title: const Text('Aufgaben'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Einstellungen'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/settings');
            },
          ),
        ],
      ),
    );
  }
}
