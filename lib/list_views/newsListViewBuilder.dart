import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Data/article_data.dart';
import 'package:news_app/list_views/news_list_view.dart';
import 'package:news_app/models/errorMessage.dart';
import 'package:news_app/models/loading.dart';
import 'package:news_app/services/news_service.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  // List<ArticleData> data = [];
  var future;

  @override
  void initState() {
    future = NewsService(
      Dio(),
    ).getTopHeadline(category: widget.category); // the request
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleData>>(
      future: future,
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          return NewsListView(data: snapShot.data!);
        } else if (snapShot.hasError) {
          return SliverFillRemaining(
            child: Center(
              child: ErrorMessage(message: 'oops there i an error, try latter'),
            ),
          );
        } else {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Loading()),
          );
        }
      },
    );
    // return isLoading
    //     ? SliverFillRemaining(
    //       hasScrollBody: false,
    //       child: Center(
    //         child: CircularProgressIndicator(
    //           color: Colors.blueGrey,
    //           strokeWidth: 3,
    //         ),
    //       ),
    //     )
    //     : data.isNotEmpty
    //     ? NewsListView(data: data)
    //     : SliverFillRemaining(
    //       child: Center(child: Text("Oops there is an error, try later")),
    //     );
  }
}

// @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? SliverToBoxAdapter(
//           child: CircularProgressIndicator(
//             color: Colors.blueGrey,
//             strokeWidth: 3,
//           ),
//         )
//         : data.isNotEmpty
//         ? NewsListView(data: data)
//         : SliverToBoxAdapter(child: Text("oops there i an error, try latter"));
//   }
// }
