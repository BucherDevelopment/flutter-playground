import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galery_app/data/dummy_pictures.dart';
import 'package:galery_app/models/picture_element.dart';

class PicturesNotifier extends StateNotifier<List<PictureElement>> {
  PicturesNotifier() : super(dummyPictures);

  void addPicture(PictureElement picture) {
    state = [...state, picture];
  }

  void toggleFavorite(String pictureId) {
    state = state
        .map(
          (p) => p.id == pictureId
              ? PictureElement(
                  id: p.id,
                  title: p.title,
                  randomSeed: p.randomSeed,
                  description: p.description,
                  isFavorite: !p.isFavorite,
                )
              : p,
        )
        .toList();
  }

  void removePicture(String pictureId) {
    state = state.where((p) => p.id != pictureId).toList();
  }

  void editPicture(PictureElement updatedPicture) {
    state = state
        .map((p) => p.id == updatedPicture.id ? updatedPicture : p)
        .toList();
  }
}

final picturesProvider =
    StateNotifierProvider<PicturesNotifier, List<PictureElement>>(
      (ref) => PicturesNotifier(),
    );

final favoritePicturesProvider = Provider<List<PictureElement>>((ref) {
  final pictures = ref.watch(picturesProvider);
  return pictures.where((p) => p.isFavorite).toList();
});
