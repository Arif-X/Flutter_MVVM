import 'dart:async';
import 'package:meta/meta.dart';
import 'package:json/interfaces/api.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:json/models/article.dart';
import 'package:json/models/blog.dart';
import 'package:json/models/report.dart';

class MainPageViewModel extends Model {
  Future<List<Article>> _articles;
  Future<List<Article>> get articles => _articles;
  set articles(Future<List<Article>> value) {
    _articles = value;
    notifyListeners();
  }

  Future<List<Blog>> _blogs;
  Future<List<Blog>> get blogs => _blogs;
  set blogs(Future<List<Blog>> value) {
    _blogs = value;
    notifyListeners();
  }

  Future<List<Report>> _reports;
  Future<List<Report>> get reports => _reports;
  set reports(Future<List<Report>> value) {
    _reports = value;
    notifyListeners();
  }

  final Api apiSvc;

  MainPageViewModel({@required this.apiSvc});

  Future<bool> setArticle() async {
    articles = apiSvc?.getArticles();
    return articles != null;
  }

  Future<bool> setBlogs() async {
    blogs = apiSvc?.getBlogs();
    return blogs != null;
  }

  Future<bool> setReport() async {
    reports = apiSvc?.getReports();
    return reports != null;
  }
}
