import 'package:flutter/material.dart';
import 'package:food_app/screens/meals_cat.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCat(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealCat.routeName,
      arguments: {
        'id':id,
        'title': title,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {selectCat(context);},
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          alignment: AlignmentDirectional.center,
          padding: EdgeInsets.all(15),
          child: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color.withOpacity(0.6), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20)),
        ));
  }
}
