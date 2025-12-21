import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:shimmer/shimmer.dart';

class NewsTileWidget extends StatelessWidget {
  const NewsTileWidget({super.key, required this.articleModel});
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),

          child: CachedNetworkImage(
            imageUrl: articleModel.image ?? '',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
            errorWidget: (context, url, error) => Container(
              height: 200,
              color: Colors.grey[300],
              child: const Icon(Icons.error, color: Colors.red),
            ),
            memCacheHeight: 400,
            memCacheWidth: 800,
            maxHeightDiskCache: 400,
            maxWidthDiskCache: 800,
          ),
        ),
        SizedBox(height: 12),
        Text(
          articleModel.title,
          maxLines: 2,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: 8),
        Text(
          articleModel.description ?? '',
          maxLines: 2,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}
