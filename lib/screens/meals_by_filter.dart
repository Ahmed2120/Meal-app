import 'package:flutter/material.dart';
import 'package:food_app/dummy_data.dart';
import 'package:food_app/modules/meal.dart';
import 'package:food_app/widgets/meal_item.dart';

class MealsByFilter extends StatefulWidget {
  static const String routeName = '/meal_f';

  @override
  _MealsByFilterState createState() => _MealsByFilterState();
}

class _MealsByFilterState extends State<MealsByFilter> {
  late List<Meal> meals;

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, bool>;
    meals = DUMMY_MEALS.where((meal) {
      if (routeArgs['isVegetarian'] == true && meal.isVegetarian == false) {
        return false;
      }
      if (routeArgs['isVegan'] == true && meal.isVegan == false) {
        return false;
      }
      if (routeArgs['isGlutenFree'] == true && meal.isGlutenFree == false) {
        return false;
      }
      if (routeArgs['isLactoseFree'] == true && meal.isLactoseFree == false) {
        return false;
      }
      return true;
    }).toList();

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      meals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('meals by filter'),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: meals[index].id,
              imgUrl: meals[index].imgUrl.toString(),
              title: meals[index].title.toString(),
              duration: meals[index].duration,
              complexity: meals[index].complexity,
              affordability: meals[index].affordability,
            );
          },
          itemCount: meals.length,
        ));
  }
}
