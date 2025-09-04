import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galery_app/models/picture_element.dart';
import 'package:galery_app/providers/pictures_provider.dart';
import 'package:galery_app/widgets/picture_card.dart';

class GaleryOverviewScreen extends ConsumerWidget {
  const GaleryOverviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pictures = ref.watch(picturesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Galery Overview')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 2 / 3,
        ),
        itemCount: pictures.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 200,
            height: 300,
            child: PictureCard(picture: pictures[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Beispiel: Neue Bild hinzufügen
          final newPicture = PictureElement(
            id: (ref.read(picturesProvider).length + 1).toString(),
            title: 'Bild Nr. ${ref.read(picturesProvider).length + 1}',
            description: 'Beschreibung des neuen Bildes',
          );
          ref.read(picturesProvider.notifier).addPicture(newPicture);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
