import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galery_app/models/picture_element.dart';
import 'package:galery_app/providers/pictures_provider.dart';
import 'package:galery_app/screens/galery_overview.dart';
import 'package:galery_app/widgets/new_picture_dialog.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _openNewPictureScreen() {
    showDialog(
      context: context,
      builder: (context) => Dialog(child: NewPictureDialog()),
    );
  }

  void _addPicture() {
    final newPicture = PictureElement(
      id: (ref.read(picturesProvider).length + 1).toString(),
      title: 'Bild Nr. ${ref.read(picturesProvider).length + 1}',
      description: 'Beschreibung des neuen Bildes',
    );
    ref.read(picturesProvider.notifier).addPicture(newPicture);
  }

  @override
  Widget build(BuildContext context) {
    final pictures = ref.watch(picturesProvider);
    final favoritePictures = ref.watch(favoritePicturesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Galery Overview')),
      body: GaleryOverviewScreen(
        pictures: _selectedPageIndex == 0 ? pictures : favoritePictures,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album),
            label: 'All pictures',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openNewPictureScreen,
        child: const Icon(Icons.add),
      ),
    );
  }
}
