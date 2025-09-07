import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galery_app/providers/pictures_provider.dart';

class PictureDetail extends ConsumerWidget {
  const PictureDetail({super.key, required this.pictureID});
  final String pictureID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final picture = ref
        .watch(picturesProvider)
        .firstWhere((pic) => pic.id == pictureID);
    return SizedBox(
      width: 400,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: Image.network(
              'https://picsum.photos/seed/${picture.randomSeed}/400/600.jpg',
              // 'https://picsum.photos/400/600.jpg',
              fit: BoxFit.cover,
              height: 600,
              width: 400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      picture.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8),
                    if (picture.description != null)
                      Text(
                        picture.description!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    ref
                        .read(picturesProvider.notifier)
                        .toggleFavorite(picture.id);
                  },
                  icon: Icon(
                    size: 32,
                    picture.isFavorite ? Icons.star : Icons.star_border,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // ref.read(picturesProvider.notifier).deletePicture(picture.id);
                  },
                  icon: Icon(size: 32, Icons.delete),
                ),
                IconButton(
                  onPressed: () {
                    // ref.read(picturesProvider.notifier).editPicture(picture.id);
                  },
                  icon: Icon(size: 32, Icons.edit),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
