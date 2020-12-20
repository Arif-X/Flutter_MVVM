import 'package:flutter/material.dart';
import 'package:json/views/pages/detail_blog_page.dart';
import 'package:json/models/blog.dart';
import 'package:json/utils/styles.dart';

class BlogListItem extends StatelessWidget {
  final Blog blog;

  BlogListItem({@required this.blog});

  @override
  Widget build(BuildContext context) {
    var title = Text(
      blog?.title,
      style: TextStyle(
        color: Styles.titleColor,
        fontWeight: FontWeight.bold,
        fontSize: Styles.titleFontSize,
      ),
    );

    var subTitle = Text(
      "News Site : ${blog?.newsSite}",
      style: TextStyle(
        color: Styles.subTitleColor,
      ),
    );

    var imgUrl = Image.network(
      "${blog?.imageUrl}",
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
                        builder: (context) => DetailBlog(blog: blog),
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
