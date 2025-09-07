class PictureElement {
  final String id;
  final String title;
  final String randomSeed;
  final bool isFavorite;

  final String? description;

  PictureElement({
    required this.id,
    required this.title,
    required this.randomSeed,
    this.description,
    this.isFavorite = false,
  });
}
