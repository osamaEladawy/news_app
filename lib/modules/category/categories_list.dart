import 'package:flutter/material.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/shared/styles/colors.dart';
import '../../shared/cubit/cubit.dart';
import 'category_model.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  final List<CategoryModel> categories = const [
    CategoryModel(
        categoryIcon: Icons.business_center, categoryName: 'Business'),
    CategoryModel(
        categoryIcon: Icons.emoji_nature_outlined,
        categoryName: 'Entertainment'),
    CategoryModel(
        categoryIcon: Icons.all_inbox_outlined, categoryName: 'General'),
    CategoryModel(
        categoryIcon: Icons.health_and_safety, categoryName: 'Health'),
    CategoryModel(categoryIcon: Icons.science, categoryName: 'Science'),
    CategoryModel(categoryIcon: Icons.sports, categoryName: 'Sports'),
    CategoryModel(
        categoryIcon: Icons.biotech_outlined, categoryName: 'Technology'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CategoryCard(
          category: categories[index], index: index,
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category, required this.index});
  final CategoryModel category;
  final int index ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NewsCubit.get(context).clicCategory = category.categoryName;
        AppCubit.get(context).newsType = category.categoryName;
        NewsCubit.get(context).getData();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Column(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor:
                  NewsCubit.get(context).clicCategory == category.categoryName
                      ? defaultColor
                      : Colors.white,
              child: Icon(
                category.categoryIcon,
                color: const Color(0xFF43658b),
                size: 40,
              ),
            ),
            Text(
              category.categoryName,
              style: TextStyle(
                color:
                    NewsCubit.get(context).clicCategory == category.categoryName
                        ? defaultColor
                        : Colors.white,
                fontWeight:
                    NewsCubit.get(context).clicCategory == category.categoryName
                        ? FontWeight.w900
                        : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
