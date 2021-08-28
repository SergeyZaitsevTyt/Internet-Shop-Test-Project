class Category {
  final int categoryId;
  final String title;
  final String imageUrl;

  Category({
    required this.categoryId,
    required this.title,
    required this.imageUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['categoryId'],
      title: json['title'],
      imageUrl: json['imageUrl'],
    );
  }
}
