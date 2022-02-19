import 'package:flutter/material.dart';
import 'package:food_app/modules/meal.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dummy_data.dart';

class MealProvider with ChangeNotifier {
  final List<Meal> favorites = [];
  List<String> listOfIds = [];
  Map<String, bool> filters = {
    'isVegetarian': false,
    'isVegan': false,
    'isGlutenFree': false,
    'isLactoseFree': false,
  };

  void setFilters() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isVegetarian', filters['isVegetarian']!);
    prefs.setBool('isVegan', filters['isVegan']!);
    prefs.setBool('isGlutenFree', filters['isGlutenFree']!);
    prefs.setBool('isLactoseFree', filters['isLactoseFree']!);
  }

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    filters['isVegetarian'] = prefs.getBool('isVegetarian') ?? false;
    filters['isVegan'] = prefs.getBool('isVegan') ?? false;
    filters['isGlutenFree'] = prefs.getBool('isGlutenFree') ?? false;
    filters['isLactoseFree'] = prefs.getBool('isLactoseFree') ?? false;

    List<String> getListOfIds = prefs.getStringList('listOfIds') ?? [];
    if (getListOfIds.isNotEmpty) {
      for (var i in getListOfIds) {
        favorites.add(DUMMY_MEALS.firstWhere((meal) => meal.id == i));
      }
    }
    notifyListeners();
  }

  void toggleFavorite(String mealId) async {
    final prefs = await SharedPreferences.getInstance();

    final existingI = favorites.indexWhere((meal) => meal.id == mealId);
    if (existingI >= 0) {
      favorites.removeAt(existingI);
      listOfIds.remove(mealId);
    } else {
      favorites.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      listOfIds.add(mealId);
    }
    notifyListeners();
    prefs.setStringList('listOfIds', listOfIds);
  }

  bool isFavorite(String mealId) {
    return favorites.any((meal) => meal.id == mealId);
  }
}
