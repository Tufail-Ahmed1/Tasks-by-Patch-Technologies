class Product {
  final int id;
  final String title;
  final String image;
  final double price;
  final String description;
  final String category;

  Product({required this.id, required this.title, required this.image, required this.price, required this.category,required this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      price: json['price'].toDouble(),
      category: json['category'],
      description: json['description'],
    );
  }
}