
class Product {
   int? id;
   String? title;
   String? price;
   String? picture;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.picture,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int?,
      title: json['title'] as String?,
      picture: json['picture'] as String?,
      price: json['price'] as String?,
    );
  }
}
