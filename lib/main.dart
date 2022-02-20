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
    bool _isDark = Provider.of<MealProvider>(context).isDark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.black45,
        canvasColor: Color.fromRGBO(215, 215, 209, 1.0),
        fontFamily: 'Raleway',
        cardColor: Colors.white,
        shadowColor: Colors.white60,
        buttonColor: Colors.black87,
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
              color: Colors.black45
          ),
          subtitle1: TextStyle(
            color: Colors.black87,
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.black45,
        canvasColor: Color.fromRGBO(36, 36, 24, 1.0),
        fontFamily: 'Raleway',
        cardColor: Colors.black54,
        shadowColor: Colors.white60,
        buttonColor: Colors.white70,
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Colors.white60
              ),

              subtitle1: TextStyle(
                color: Colors.white70,
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
