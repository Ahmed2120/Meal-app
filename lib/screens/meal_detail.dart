import 'package:flutter/material.dart';
import 'package:food_app/dummy_data.dart';

class MealDetail extends StatelessWidget {

  final Function toggleFavorite;
  final Function isFavorite;
  MealDetail(this.toggleFavorite, this.isFavorite);

  static const String routeName = '/meal_detail';

  Widget sectionTitle(BuildContext context, String txt) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        txt,
        style: Theme.of(context).textTheme.title,
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
        backgroundColor: isFavorite(mealId) ? Colors.white : Theme.of(context).primaryColor,

        child: isFavorite(mealId) ? Icon(Icons.favorite, color: Colors.red,) : Icon(Icons.favorite_border),
        onPressed: (){toggleFavorite(mealId);},
      ),
    );
  }
}
