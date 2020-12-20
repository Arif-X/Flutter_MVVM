import 'package:flutter/material.dart';
import 'package:json/models/blog.dart';
import 'package:json/models/article.dart';

class ArticleDetail extends StatelessWidget {
  final Article article;

  ArticleDetail({this.article});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget title = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${article?.title}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${article?.newsSite}',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );

    Widget allText = Container(
      padding: EdgeInsets.all(10),
      child: Text(
        '${article?.summary}',
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(article?.title),
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Image.network(
                '${article?.imageUrl}',
                width: 600,
                fit: BoxFit.cover,
              ),
              title,
              allText
            ],
          ),
        ],
      ),
    );
  }
}
