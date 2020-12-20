import 'package:flutter/material.dart';
import 'package:json/models/article.dart';
import 'package:json/utils/styles.dart';
import 'package:json/views/pages/article_detail_page.dart';

class ArticlesListItem extends StatelessWidget {
  final Article article;

  ArticlesListItem({@required this.article});

  @override
  Widget build(BuildContext context) {
    var title = Text(
      article?.title,
      style: TextStyle(
        color: Styles.titleColor,
        fontWeight: FontWeight.bold,
        fontSize: Styles.titleFontSize,
      ),
    );

    var subTitle = Text(
      "News Site : ${article?.newsSite}",
      style: TextStyle(
        color: Styles.subTitleColor,
      ),
    );

    var imgUrl = Image.network(
      "${article?.imageUrl}",
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
                        builder: (context) => ArticleDetail(article: article),
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
