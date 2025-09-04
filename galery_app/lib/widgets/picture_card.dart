import 'package:flutter/material.dart';
import 'package:galery_app/models/picture_element.dart';

class PictureCard extends StatelessWidget {
  const PictureCard({super.key, required this.picture});

  final PictureElement picture;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 300,
      child: Card(
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Image.network(
              'https://picsum.photos/seed/${picture.id}/200/300.jpg',
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
                child: Text(
                  picture.title,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall?.copyWith(color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
