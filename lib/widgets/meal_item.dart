import 'package:flutter/material.dart';
import '../screens/meal_detail.dart';
import '../modules/meal.dart';

class MealItem extends StatelessWidget {
  final String? id;
  final String? title;
  final String? imgUrl;
  final int? duration;
  final Complexity? complexity;
  final Affordability? affordability;

  const MealItem({
    @required this.id,
    @required this.title,
    @required this.imgUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetail.routeName,
        arguments: id).then((value) {
      // if(value != null) {
      //   removeMeal(value);
      // }
    });
  }

  String? get complexityTxt {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  String? get affordabilityTxt {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imgUrl.toString(),
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 50,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6,),
                      Text('$duration min')
                    ],
                  ), Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6,),
                      Text('$complexityTxt')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6,),
                      Text('$affordabilityTxt')
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
