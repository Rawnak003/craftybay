class SliderModel {
  final String id;
  final String photoUrl;
  final String description;
  final String brand;

  SliderModel({
    required this.id,
    required this.photoUrl,
    required this.description,
    required this.brand,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      id: json['_id'],
      photoUrl: json['photo_url'],
      description: json['description'],
      brand: json['brand'],
    );
  }
}