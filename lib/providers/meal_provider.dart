import 'package:flutter/material.dart';
import 'package:food_app/modules/meal.dart';

import '../dummy_data.dart';

class MealProvider with ChangeNotifier {
  final List<Meal> favorites = [];

  void toggleFavorite(String mealId) {
    final existingI = favorites.indexWhere((meal) => meal.id == mealId);
    if (existingI >= 0) {
      favorites.removeAt(existingI);
    } else {
      favorites.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }
    notifyListeners();
  }

  bool isFavorite(String mealId) {
    return favorites.any((meal) => meal.id == mealId);
  }
}
