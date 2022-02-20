import 'package:flutter/material.dart';
import 'package:food_app/providers/meal_provider.dart';
import 'package:food_app/screens/filters.dart';
import 'package:provider/provider.dart';

class MealDrawer extends StatelessWidget {
  Widget choose(
      {required String text, required Icon icon, required Function function, required BuildContext context}) {
    return ListTile(
      leading: icon,
      title: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyText1!.color,
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
      elevation: 0,
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
              icon: Icon(Icons.restaurant, color: Theme.of(context).buttonColor,),
              function: () {
                Navigator.of(context).pushReplacementNamed('/');
              }, context: context),
          choose(
              text: 'Filters',
              icon: Icon(Icons.settings, color: Theme.of(context).buttonColor,),
              function: () {
                Navigator.of(context).pushReplacementNamed(Filters.routeName);
              }, context: context),
          ListTile(
            leading: Icon(Icons.color_lens_outlined, color: Theme.of(context).buttonColor,),
            title: Text(
              'Dark Mode',
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                  fontSize: 25,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.w600),
            ),
            trailing: Switch(
              value: Provider.of<MealProvider>(context).isDark,
              activeColor: Theme.of(context).primaryColor,
              onChanged: (newValue) {
                Provider.of<MealProvider>(context, listen: false).toggleMode(newValue);
              },
            ),
          )
        ],
      ),
    );
  }
}
