import 'dart:async';
import 'package:json/models/blog.dart';
import 'package:json/models/article.dart';
import 'package:json/models/report.dart';

abstract class Api {
  Future<List<Article>> getArticles();
  Future<List<Blog>> getBlogs();
  Future<List<Report>> getReports();
}