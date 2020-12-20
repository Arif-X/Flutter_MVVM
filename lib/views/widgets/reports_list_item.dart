import 'package:flutter/material.dart';
import 'package:json/views/pages/report_detail_page.dart';
import 'package:json/models/report.dart';
import 'package:json/utils/styles.dart';

class ReportListItem extends StatelessWidget {
  final Report report;

  ReportListItem({@required this.report});

  @override
  Widget build(BuildContext context) {
    var title = Text(
      report?.title,
      style: TextStyle(
        color: Styles.titleColor,
        fontWeight: FontWeight.bold,
        fontSize: Styles.titleFontSize,
      ),
    );

    var subTitle = Text(
      "News Site : ${report?.newsSite}",
      style: TextStyle(
        color: Styles.subTitleColor,
      ),
    );

    var imgUrl = Image.network(
      "${report?.imageUrl}",
      height: 75,
      width: 75,
    );

    return InkWell(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(3),
                child: imgUrl,
              ),
              Expanded(
                child: ListTile(
                  title: title,
                  subtitle: subTitle,
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailReport(report: report),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
