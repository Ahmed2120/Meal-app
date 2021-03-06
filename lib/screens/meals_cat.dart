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
  bool isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;
  var dw = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle.toString()),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: dw <= 400 ? 400 : 500,
            childAspectRatio: isLandScape ? dw / (dw*0.85) : dw / (dw*0.7),
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
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
