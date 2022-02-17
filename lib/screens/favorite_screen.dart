import 'package:flutter/material.dart';
import 'package:food_app/providers/meal_provider.dart';
import 'package:food_app/widgets/meal_item.dart';
import 'package:provider/provider.dart';
import '../modules/meal.dart';

class FavoriteScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<Meal> favorites = Provider.of<MealProvider>(context).favorites;
    if(favorites.isEmpty) {
      return Center(
          child: Text('there is no favorite meals', style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),),
        );
    }else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favorites[index].id,
            imgUrl: favorites[index].imgUrl.toString(),
            title: favorites[index].title.toString(),
            duration: favorites[index].duration,
            complexity: favorites[index].complexity,
            affordability: favorites[index].affordability,
          );
        },
        itemCount: favorites.length,
      );
    }
  }
}
