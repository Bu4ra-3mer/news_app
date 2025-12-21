import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsPage extends StatelessWidget {
  final ArticleModel article;
  const ArticleDetailsPage({super.key, required this.article});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.image != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(article.image!),
              ),
            const SizedBox(height: 20),
            Text(
              article.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text(
              article.description ?? "No Description",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(article.content ?? "", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 30),
            if (article.url != null)
              Center(
                child: ElevatedButton(
                  onPressed: () => _launchURL(article.url!),
                  child: const Text("Read Full Article"),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
