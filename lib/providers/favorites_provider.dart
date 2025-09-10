import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleFavorite(Meal meal) {
    if (state.contains(meal)) {
      _removeMeal(meal);
      return false;
    } else {
      _addMeal(meal);
      return true;
    }
  }

  void _addMeal(Meal meal) {
    state = [...state, meal];
  }

  void _removeMeal(Meal meal) {
    state = state.where((m) => m.id != meal.id).toList();
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
      (ref) => FavoriteMealsNotifier(),
    );
