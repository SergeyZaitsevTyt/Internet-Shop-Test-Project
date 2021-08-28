class Product {
  final String title;
  final int price;
  final String imageUrl;

  Product({
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }

  //https://www.notion.so/whitetigersoft/JSON-1a338ec1b8d1494b869d68fbef8a06bd
}
