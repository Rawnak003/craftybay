class ProductModel {
  final String id;
  final String title;
  final String description;
  final int currentPrice;
  final List<String> photoUrls;
  final List<String> colors;
  final List<String> sizes;

  ProductModel({
    required this.id,
    required this.title,
    required this.currentPrice,
    required this.photoUrls,
    required this.description,
    required this.colors,
    required this.sizes,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    List<String> l = [];
    for (String s in jsonData['photos']) {
      l.add(s);
    }
    return ProductModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      currentPrice: jsonData['current_price'],
      description: jsonData['description'],
      photoUrls: List<String>.from(jsonData['photos']),
      colors: List<String>.from(jsonData['colors']),
      sizes: List<String>.from(jsonData['sizes']),
    );
  }
}