import 'package:flutter/material.dart';
import 'package:food_app/modules/meal.dart';
import 'package:food_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class MealCat extends StatefulWidget {
  static const String routeName = '/meal_category';

  @override
  _MealCatState createState() => _MealCatState();
}

class _MealCatState extends State<MealCat> {

  String? categoryTitle;
  late List<Meal> mealsCat;

  @override
  void didChangeDependencies() {
    final routeArgs =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    categoryTitle = routeArgs['title'];
    mealsCat = DUMMY_MEALS.where((meals) {
      return meals.categories!.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    setState(() {
      mealsCat.removeWhere((meal) => meal.id == mealId
      );
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle.toString()),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: mealsCat[index].id,
              imgUrl: mealsCat[index].imgUrl.toString(),
              title: mealsCat[index].title.toString(),
              duration: mealsCat[index].duration,
              complexity: mealsCat[index].complexity,
              affordability: mealsCat[index].affordability,
            );
          },
          itemCount: mealsCat.length,
        ));
  }
}
