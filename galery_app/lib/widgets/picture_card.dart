import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galery_app/providers/pictures_provider.dart';
import 'package:galery_app/models/picture_element.dart';
import 'package:galery_app/widgets/picture_detail.dart';

class PictureCard extends ConsumerWidget {
  const PictureCard({super.key, required this.picture});

  final PictureElement picture;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 200,
      height: 300,
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) =>
                Dialog(child: PictureDetail(pictureID: picture.id)),
          );
        },
        child: Card(
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              Image.network(
                // 'https://picsum.photos/200/300.jpg',
                'https://picsum.photos/seed/${picture.randomSeed}/200/300.jpg',
                fit: BoxFit.cover,
                height: 300,
                width: 200,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Colors.black.withAlpha(128),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 12.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        picture.title,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      IconButton(
                        onPressed: () {
                          ref
                              .read(picturesProvider.notifier)
                              .toggleFavorite(picture.id);
                        },
                        icon: Icon(
                          picture.isFavorite ? Icons.star : Icons.star_border,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
