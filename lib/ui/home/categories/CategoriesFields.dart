import 'package:flutter/material.dart';
import 'package:news/ui/home/categories/CategoryWidget.dart';
import 'package:news/ui/home/categories/category.dart';


typedef OnCategoryClick= void Function(Category category);
class CategoriesFields extends StatelessWidget {
  OnCategoryClick onCategoryClick;
  CategoriesFields(this.onCategoryClick,{super.key});

  List<Category> categories = Category.getAllCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pick Your Category\n of interest",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap:() {
                  onCategoryClick(categories[index]);
                },
                child: CategoryItem(categories[index], index),
              ),
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
