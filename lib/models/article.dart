class Article {
  String title, newsSite, imageUrl, summary;

  Article({
    this.title,
    this.newsSite,
    this.imageUrl,
    this.summary
  });

  Article.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    newsSite = map['newsSite'];
    imageUrl = map['imageUrl'];
    summary = map['summary'];
  }
}