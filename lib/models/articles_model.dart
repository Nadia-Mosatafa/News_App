class ArticleModel {
  String? image;
  String? description;
  String title;
  String url;
  ArticleModel(
      {required this.image,
      required this.description,
      required this.title,
      required this.url});
  factory ArticleModel.fromJson(json) {
    return ArticleModel(
      image: json['urlToImage'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
    );
  }
}
