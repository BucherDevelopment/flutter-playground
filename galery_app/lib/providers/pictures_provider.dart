import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galery_app/data/dummy_pictures.dart';
import 'package:galery_app/models/picture_element.dart';

class PicturesNotifier extends StateNotifier<List<PictureElement>> {
  PicturesNotifier() : super(dummyPictures);

  void addPicture(PictureElement picture) {
    state = [...state, picture];
  }

  void removePicture(String pictureId) {
    state = state.where((p) => p.id != pictureId).toList();
  }
}

final picturesProvider =
    StateNotifierProvider<PicturesNotifier, List<PictureElement>>(
      (ref) => PicturesNotifier(),
    );
