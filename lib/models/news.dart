
class NewsModel{
  final String title;
  final String Content;
  final String imageUrl;
  final String source;
  final String date;

  NewsModel(
      {required this.title,
        required this.Content,
        required this.imageUrl,
        required this.date,
        required this.source,});

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    title: json['title'],
    Content: json['Content'],
   imageUrl: json['imageUrl'],
    source: json['source'],
    date: json['date']
  );
}