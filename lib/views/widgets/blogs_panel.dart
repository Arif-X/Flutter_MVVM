import 'package:flutter/material.dart';
import 'package:json/models/blog.dart';
import 'package:json/view_models/main_page_view_model.dart';
import 'package:json/views/widgets/blogs_list_item.dart';
import 'package:json/views/widgets/no_internet_connection.dart';
import 'package:scoped_model/scoped_model.dart';

class BlogsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainPageViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<List<Blog>>(
          future: model.blogs,
          builder: (_, AsyncSnapshot<List<Blog>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var blogs = snapshot.data;
                  return ListView.builder(
                    itemCount: blogs == null ? 0 : blogs.length,
                    itemBuilder: (_, int index) {
                      var blog = blogs[index];
                      return BlogListItem(blog: blog);
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