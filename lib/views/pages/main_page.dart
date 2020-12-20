import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json/view_models/main_page_view_model.dart';
import 'package:json/views/widgets/blogs_panel.dart';
import 'package:json/views/widgets/articles_panel.dart';
import 'package:json/views/widgets/reports_panel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  final MainPageViewModel viewModel;

  MainPage({Key key, @required this.viewModel}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  TabController tabController;

  Future loadData() async {
    await widget.viewModel.setArticle();
    await widget.viewModel.setBlogs();
    await widget.viewModel.setReport();
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Space News Feed',
        ),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.yellowAccent,
          indicatorWeight: 3.0,
          tabs: <Widget>[
            Tab(child: Text("Article"),),
            Tab(child: Text("Blog"),),
            Tab(child: Text("Report"),),
          ],
        ),
      ),
      body: ScopedModel<MainPageViewModel>(
        model: widget.viewModel,
        child: TabBarView(
          controller: tabController,
          children: <Widget>[
            ArticlesPanel(),
            BlogsPanel(),
            ReportsPanel(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }
}