import 'package:flutter/material.dart';
import 'package:food_app/modules/meal.dart';
import 'package:food_app/screens/categories_screen.dart';
import 'package:food_app/screens/favorite_screen.dart';
import 'package:food_app/widgets/meal_drawer.dart';

class Tabs extends StatefulWidget {

  final List<Meal> favorites;

  Tabs(this.favorites);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  late List<Map<String, Object>> pages;
  int selectPage = 0;

  @override
  void initState() {
    pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories'
      },
      {
        'page': FavoriteScreen(widget.favorites),
        'title': 'Favorites'
      },
    ];
    super.initState();
  }

  void selectScreen(int value) {
    setState(() {
      selectPage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectPage]['title'] as String),
      ),
      body: pages[selectPage]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectScreen,
        currentIndex: selectPage,
        selectedItemColor: Colors.amber,
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded),
              title: Text('Categories')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favorites')
          ),
        ],
      ),
      drawer: MealDrawer(),
    );
  }
}
