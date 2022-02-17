import 'package:flutter/material.dart';
import 'package:food_app/modules/meal.dart';
import 'package:food_app/providers/meal_provider.dart';
import 'package:food_app/screens/categories_screen.dart';
import 'package:food_app/screens/filters.dart';
import 'package:food_app/screens/meal_detail.dart';
import 'package:food_app/screens/meals_by_filter.dart';
import 'package:food_app/screens/meals_cat.dart';
import 'package:food_app/screens/tabs.dart';
import 'package:provider/provider.dart';
import 'dummy_data.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (ctx)=>MealProvider(),
    child: MyApp(),
  )
);

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.black45,
        canvasColor: Color.fromRGBO(215, 215, 209, 1.0),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(62, 62, 61, 1.0),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(120, 120, 69, 1.0),
              ),
              subtitle1: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': (context) => Tabs(),
        MealCat.routeName: (context) => MealCat(),
        MealDetail.routeName: (context) => MealDetail(),
        Filters.routeName: (context) => Filters(),
        MealsByFilter.routeName: (context) => MealsByFilter(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? x = DUMMY_CATEGORIES[0].title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food App'),
      ),
      body: null,
    );
  }
}
