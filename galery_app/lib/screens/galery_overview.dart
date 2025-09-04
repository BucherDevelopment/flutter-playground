import 'package:flutter/material.dart';

class GaleryOverviewScreen extends StatelessWidget {
  const GaleryOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Galery Overview')),
      body: const Center(child: Text('Welcome to the Galery Overview Screen!')),
    );
  }
}
