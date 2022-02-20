import 'package:flutter/material.dart';
import 'package:food_app/providers/meal_provider.dart';
import 'package:food_app/widgets/meal_item.dart';
import 'package:provider/provider.dart';
import '../modules/meal.dart';

class FavoriteScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    bool isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;
    var dw = MediaQuery.of(context).size.width;

    final List<Meal> favorites = Provider.of<MealProvider>(context).favorites;
    if(favorites.isEmpty) {
      return Center(
          child: Text('there is no favorite meals', style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),),
        );
    }else{
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: dw <= 400 ? 400 : 500,
          childAspectRatio: isLandScape ? dw / (dw*0.85) : dw / (dw*0.7),
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
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
