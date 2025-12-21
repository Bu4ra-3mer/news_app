class ArticleModel {
  final String? image;
  final String title;
  final String? description;
  final String? content;
  final String? url;

  const ArticleModel({
    required this.image,
    required this.title,
    required this.description,
    required this.content,
    required this.url,
  });
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      image: json['urlToImage'],
      title: json['title'],
      description: json['description'],
      content: json['content'],
      url: json['url'],
    );
  }
}
