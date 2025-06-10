import 'package:flutter/material.dart';
import 'package:news_app/Data/article_data.dart';
import 'package:news_app/models/news_tile.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleData> data;

  const NewsListView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: data.length, (
        context,
        index,
      ) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: NewsTile(articlesData: data[index]),
        );
      }),
    );
  }
}

//////we will use this list view if we did not use the sliver list in the home page
// ListView.builder(
    //   shrinkWrap: true,
    //   physics: NeverScrollableScrollPhysics(),
    //   scrollDirection: Axis.horizontal,
    //   itemCount: 10,
    //   itemBuilder: (context, index) {
    //     return NewsTile();
    //   },
    // );