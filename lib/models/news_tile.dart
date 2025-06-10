import 'package:flutter/material.dart';
import 'package:news_app/Data/article_data.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articlesData});
  final ArticleData articlesData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            articlesData.image ??
                'https://th.bing.com/th/id/OIP.-mlwDVsSwfABKmZBtIBbtQHaFY?rs=1&pid=ImgDetMain',
            height: 200,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          articlesData.title,
          maxLines: 2,
          //overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          articlesData.description ?? 'No description available',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    );
  }
}
