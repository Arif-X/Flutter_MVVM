import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json/interfaces/api.dart';
import 'package:json/models/blog.dart';
import 'package:json/models/article.dart';
import 'package:json/models/report.dart';

class ApiService implements Api {
  final _baseUrl = 'https://swapi.dev/api';
  http.Client _client = http.Client();

  set client(http.Client value) => _client = value;

  static final ApiService _internal = ApiService.internal();

  factory ApiService() => _internal;

  ApiService.internal();

  Future<List<Article>> getArticles() async {
    final url = 'https://test.spaceflightnewsapi.net/api/v2/articles';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new Article.fromMap(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  Future<List<Blog>> getBlogs() async {
    final url = 'https://test.spaceflightnewsapi.net/api/v2/blogs';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new Blog.fromMap(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  Future<List<Report>> getReports() async {
    final url = 'https://test.spaceflightnewsapi.net/api/v2/reports';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new Report.fromMap(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }
}
