import 'package:flutter/material.dart';
import 'package:json/models/blog.dart';

class DetailBlog extends StatelessWidget {
  final Blog blog;
  DetailBlog({this.blog});

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
                        '${blog?.title}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${blog?.newsSite}',
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
        '${blog?.summary}',
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(blog?.title),
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Image.network(
                '${blog?.imageUrl}',
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
