import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/pages/article_details_page.dart';
import 'package:news_app/widgets/news_tile_widget.dart';

class NewsListView extends StatelessWidget {
 final  List<ArticleModel> articls;
 const NewsListView({super.key, required this.articls});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: articls.length, (
        context,
        index,
      ) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ArticleDetailsPage(article: articls[index]),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: NewsTileWidget(articleModel: articls[index]),
          ),
        );
      }),
    );
  }
}
