import 'package:flutter/material.dart';
import 'package:food_app/widgets/meal_drawer.dart';

import 'meals_by_filter.dart';

class Filters extends StatefulWidget {
  static const String routeName = '/filters';

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool isVegetarian = false;
  bool isVegan = false;

  bool isGlutenFree = false;
  bool isLactoseFree = false;

  Widget buildSwitchListTile(
      {required bool value,
      required String title,
      required String subtitle,
      required Function function}) {
    return SwitchListTile(
      value: value,
      title: Text(title),
      activeColor: Theme.of(context).primaryColor,
      subtitle: Text(subtitle),
      onChanged: (newValue) {
        function(newValue);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: TextStyle(fontFamily: 'Raleway', fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    value: isVegetarian,
                    title: 'Vegetarian',
                    subtitle: 'Filter for Vegetarian meals',
                    function: (newValue) {
                      setState(() {
                        isVegetarian = newValue;
                      });
                    }),
                buildSwitchListTile(
                    value: isVegan,
                    title: 'Vegan',
                    subtitle: 'Filter for Vegan meals',
                    function: (newValue) {
                      setState(() {
                        isVegan = newValue;
                      });
                    }),
                buildSwitchListTile(
                    value: isGlutenFree,
                    title: 'GlutenFree',
                    subtitle: 'Filter for GlutenFree meals',
                    function: (newValue) {
                      setState(() {
                        isGlutenFree = newValue;
                      });
                    }),
                buildSwitchListTile(
                    value: isLactoseFree,
                    title: 'LactoseFree',
                    subtitle: 'Filter for LactoseFree meals',
                    function: (newValue) {
                      setState(() {
                        isLactoseFree = newValue;
                      });
                    }),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: InkWell(
                    splashColor: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      child: Container(
                        padding: EdgeInsets.all(20),
                          // margin: EdgeInsets.all(20),
                          child: Text(
                            'Meals by filters',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'RobotoCondensed'
                            ),
                            textAlign: TextAlign.center,
                          )),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [Colors.lightBlue.withOpacity(0.7), Colors.blueGrey],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),),
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(MealsByFilter.routeName, arguments: {
                        'isVegetarian': isVegetarian,
                        'isVegan': isVegan,
                        'isGlutenFree': isGlutenFree,
                        'isLactoseFree': isLactoseFree,
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      drawer: MealDrawer(),
    );
  }
}
