class Report {
  String title, newsSite, imageUrl, summary;

  Report({
    this.title,
    this.newsSite,
    this.imageUrl,
    this.summary
  });

  Report.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    newsSite = map['newsSite'];
    imageUrl = map['imageUrl'];
    summary = map['summary'];
  }
}