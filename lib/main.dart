import 'package:flutter/material.dart';
import 'package:json/services/api_service.dart';
import 'package:json/view_models/main_page_view_model.dart';
import 'package:json/views/pages/main_page.dart';

final MainPageViewModel mainPageVM = MainPageViewModel(apiSvc: ApiService());

void main() => runApp(MvvmApp(mainPageVM: mainPageVM));

class MvvmApp extends StatelessWidget {
  final MainPageViewModel mainPageVM;

  MvvmApp({@required this.mainPageVM});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Space News Feed',
      theme: new ThemeData(
        primaryColor: Colors.red,
        primaryColorLight: Color(0xff0a0a0a),
        primaryColorDark: Color(0xff000000),
      ),
      home: MainPage(viewModel: mainPageVM),
      debugShowCheckedModeBanner: false,
    );
  }
}