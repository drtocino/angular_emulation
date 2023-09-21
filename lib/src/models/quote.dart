class Quote {
  String id;
  String author;
  String content;

  Quote({required this.id,required this.author,required this.content});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(author: json['author'], content: json['content'], id: json['_id']);
  }
}