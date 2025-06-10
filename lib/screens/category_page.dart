import 'package:flutter/material.dart';
import 'package:news_app/list_views/newsListViewBuilder.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [NewsListViewBuilder(category: category)],
        ),
      ),
    );
  }
}
