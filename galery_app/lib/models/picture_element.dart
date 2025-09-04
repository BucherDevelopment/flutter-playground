class PictureElement {
  final String id;
  final String title;
  final String imageUrl;

  final String? description;

  PictureElement({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.description,
  });
}
