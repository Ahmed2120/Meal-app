import 'package:flutter/material.dart';
import 'package:food_app/screens/filters.dart';

class MealDrawer extends StatelessWidget {
  Widget choose(
      {required String text, required Icon icon, required Function function}) {
    return ListTile(
      leading: icon,
      title: Text(
        text,
        style: TextStyle(
            fontSize: 25,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.w600),
      ),
      onTap: (){function();},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.amber,
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Text(
              'Meal App!',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          choose(
              text: 'Categories',
              icon: Icon(Icons.restaurant),
              function: () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
          choose(
              text: 'Filters',
              icon: Icon(Icons.settings),
              function: () {
                Navigator.of(context).pushReplacementNamed(Filters.routeName);
              }),
        ],
      ),
    );
  }
}
