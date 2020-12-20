import 'package:flutter/material.dart';
import 'package:json/models/article.dart';
import 'package:json/view_models/main_page_view_model.dart';
import 'package:json/views/widgets/articles_list_item.dart';
import 'package:json/views/widgets/no_internet_connection.dart';
import 'package:scoped_model/scoped_model.dart';

class ArticlesPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainPageViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<List<Article>>(
          future: model.articles,
          builder: (_, AsyncSnapshot<List<Article>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: const CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var articles = snapshot.data;
                  return ListView.builder(
                    itemCount: articles == null ? 0 : articles.length,
                    itemBuilder: (_, int index) {
                      var article = articles[index];
                      return ArticlesListItem(article: article);
                    },
                  );
                } else if (snapshot.hasError) {
                  return NoInternetConnection(
                    action: () async {
                      await model.setArticle();
                      await model.setBlogs();
                      await model.setReport();
                    },
                  );
                }
            }
          },
        );
      },
    );
  }
}