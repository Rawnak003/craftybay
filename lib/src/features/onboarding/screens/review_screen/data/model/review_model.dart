class ReviewModel {
  final String id;
  final String name;
  final String text;

  ReviewModel({
    required this.id,
    required this.name,
    required this.text,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> jsonData) {
    return ReviewModel(
      id: jsonData['id'],
      name: jsonData['name'],
      text: jsonData['text'],
    );
  }
}
