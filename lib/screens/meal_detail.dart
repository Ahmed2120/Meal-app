import 'package:flutter/material.dart';
import 'package:food_app/dummy_data.dart';
import 'package:food_app/providers/meal_provider.dart';
import 'package:provider/provider.dart';

class MealDetail extends StatelessWidget {

  static const String routeName = '/meal_detail';

  Widget sectionTitle(BuildContext context, String txt) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        txt,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Widget sectionSteps(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final mealDetail = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    final pro = Provider.of<MealProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('${mealDetail.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                mealDetail.imgUrl.toString(),
                fit: BoxFit.cover,
              ),
            ),
            sectionTitle(context, 'Ingredients'),
            sectionSteps(ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Colors.amber,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(mealDetail.ingredients![index]),
                ),
              ),
              itemCount: mealDetail.ingredients?.length,
            )),
            sectionTitle(context, 'Steps'),
            sectionSteps(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${index + 1}'),
                  ),
                  title: Text(mealDetail.steps![index]),
                ),
                  Divider()
                ]
              ),
              itemCount: mealDetail.steps?.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: pro.isFavorite(mealId) ? Colors.white : Theme.of(context).primaryColor,

        child: pro.isFavorite(mealId) ? Icon(Icons.favorite, color: Colors.red,) : Icon(Icons.favorite_border),
        onPressed: (){Provider.of<MealProvider>(context, listen: false).toggleFavorite(mealId);},
      ),
    );
  }
}
