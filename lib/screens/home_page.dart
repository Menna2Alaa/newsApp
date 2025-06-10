import 'package:flutter/material.dart';
import 'package:news_app/list_views/categories_list_view.dart';
import 'package:news_app/list_views/newsListViewBuilder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News',
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Cloud',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CategoryListView()),
            SliverToBoxAdapter(child: SizedBox(height: 30)),
            NewsListViewBuilder(category: 'general'),
            // SliverToBoxAdapter(child: NewsListView(),)
          ],
        ),
        // child: Column(
        //   children: [
        //     CategoryListView(),
        //     SizedBox(
        //       height: 30,
        //     ),
        //     Expanded(child: NewsListView())
        //   ],
        // ),
      ),
    );
  }
}
