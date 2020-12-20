import 'package:flutter/material.dart';
import 'package:json/models/report.dart';
import 'package:json/view_models/main_page_view_model.dart';
import 'package:json/views/widgets/reports_list_item.dart';
import 'package:json/views/widgets/no_internet_connection.dart';
import 'package:scoped_model/scoped_model.dart';

class ReportsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainPageViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<List<Report>>(
          future: model.reports,
          builder: (_, AsyncSnapshot<List<Report>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var reports = snapshot.data;
                  return ListView.builder(
                    itemCount: reports == null ? 0 : reports.length,
                    itemBuilder: (_, int index) {
                      var report = reports[index];
                      return ReportListItem(report: report);
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