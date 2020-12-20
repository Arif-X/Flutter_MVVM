class Blog {
  String title, newsSite, imageUrl, summary;

  Blog({
    this.title,
    this.newsSite,
    this.imageUrl,
    this.summary
  });

  Blog.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    newsSite = map['newsSite'];
    imageUrl = map['imageUrl'];
    summary = map['summary'];
  }
}