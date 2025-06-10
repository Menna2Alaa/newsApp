class ArticleData {
  final String? image;
  final String title;
  final String? description;
  ArticleData({
    required this.image,
    required this.title,
    required this.description,
  });
  factory ArticleData.fromJson(json) {
    return ArticleData(
      image: json['urlToImage'],
      title: json['title'],
      description: json['description'],
    );
  }
}
