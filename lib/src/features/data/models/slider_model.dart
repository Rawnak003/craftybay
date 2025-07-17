class ProductModel {
  final String id;
  final String photoUrl;
  final String description;
  final String brand;

  ProductModel({
    required this.id,
    required this.photoUrl,
    required this.description,
    required this.brand,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      photoUrl: json['photo_url'],
      description: json['description'],
      brand: json['brand'],
    );
  }
}