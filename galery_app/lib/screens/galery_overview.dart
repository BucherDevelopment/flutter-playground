import 'package:flutter/material.dart';
import 'package:galery_app/models/picture_element.dart';
import 'package:galery_app/widgets/picture_card.dart';

class GaleryOverviewScreen extends StatefulWidget {
  const GaleryOverviewScreen({super.key, required this.pictures});
  final List<PictureElement> pictures;

  @override
  State<GaleryOverviewScreen> createState() => _GaleryOverviewScreenState();
}

class _GaleryOverviewScreenState extends State<GaleryOverviewScreen> {
  // @override
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 2 / 3,
      ),
      itemCount: widget.pictures.length,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 200,
          height: 300,
          child: PictureCard(picture: widget.pictures[index]),
        );
      },
    );
  }
}
