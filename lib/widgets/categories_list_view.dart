import 'package:flutter/cupertino.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_card_widget.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});
  final List<CategoryModel> categories = const [
    CategoryModel(image: 'assets/business.jpg', categoryName: 'business'),

    CategoryModel(
      image: 'assets/entertaiment.jpg',
      categoryName: 'entertainment',
    ),
    CategoryModel(image: 'assets/general.jpg', categoryName: 'general'),

    CategoryModel(image: 'assets/health.jpg', categoryName: 'health'),
    CategoryModel(image: 'assets/science.jpg', categoryName: 'science'),
    CategoryModel(image: 'assets/sports.jpg', categoryName: 'sports'),
    CategoryModel(image: 'assets/technology.jpg', categoryName: 'technology'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}
