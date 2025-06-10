import 'package:flutter/material.dart';
import 'package:news_app/Data/category_data.dart';
import 'package:news_app/models/category_card.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});
  final List<CategoryData> data = const [
    CategoryData(image: 'assets/business.jpg', text: 'Business'),
    CategoryData(image: 'assets/entertaiment.jpg', text: 'Entertainment'),
    CategoryData(image: 'assets/health.jpg', text: 'Health'),
    CategoryData(image: 'assets/science.jpg', text: 'Science'),
    CategoryData(image: 'assets/sports.jpg', text: 'Sports'),
    CategoryData(image: 'assets/technology.jpg', text: 'Technology'),
    CategoryData(image: 'assets/general.jpg', text: 'General'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: data[index]);
        },
      ),
    );
  }
}
