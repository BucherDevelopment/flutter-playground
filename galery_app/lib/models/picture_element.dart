class PictureElement {
  final String id;
  final String title;
  final bool isFavorite;

  final String? description;

  PictureElement({
    required this.id,
    required this.title,
    this.description,
    this.isFavorite = false,
  });
}
