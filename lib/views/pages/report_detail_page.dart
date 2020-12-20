import 'package:flutter/material.dart';
import 'package:json/models/report.dart';

class DetailReport extends StatelessWidget {
  final Report report;
  DetailReport({this.report});

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
                        '${report?.title}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${report?.newsSite}',
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
        '${report?.summary}',
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(report?.title),
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Image.network(
                '${report?.imageUrl}',
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
