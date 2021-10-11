import 'package:flutter/cupertino.dart';

enum Complexity{
  Simple,
  Challenging,
  Hard,
}

enum Affordability{
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String? id;
  final String? title;
  final List<String>? categories;
  final List<String>? ingredients;
  final List<String>? steps;
  final String? imgUrl;
  final Complexity? complexity;
  final Affordability? affordability;
  final int? duration;
  final bool? isVegan;
  final bool? isVegetarian;
  final bool? isGlutenFree;
  final bool? isLactoseFree;

  const Meal({
    @required this.id,
    @required this.title,
    @required this.categories,
    @required this.ingredients,
    @required this.complexity,
    @required this.affordability,
    @required this.steps,
    @required this.imgUrl,
    @required this.duration,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
  });
}
