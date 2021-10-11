import 'package:flutter/material.dart';
import 'package:food_app/widgets/meal_item.dart';
import '../modules/meal.dart';

class FavoriteScreen extends StatelessWidget {

  final List<Meal> favorites;
  const FavoriteScreen(this.favorites);

  @override
  Widget build(BuildContext context) {
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
