import 'package:flutter/material.dart';
import 'package:food_app/dummy_data.dart';
import 'package:food_app/widgets/category_item.dart';

String? x = DUMMY_CATEGORIES[0].title;

class CategoriesScreen extends StatelessWidget {
  final String? x = DUMMY_CATEGORIES[0].title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(20),
        children: [
          ...DUMMY_CATEGORIES.map((element) {
            return CategoryItem(element.id.toString(), element.title.toString(), element.color);
          }),
        ],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
