import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/category_item.dart';
import 'package:meals/screens/meals.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  // to make sure to dispose the controller when the widget is removed from the widget tree
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: widget.availableMeals.where((meal) {
            return meal.categories.contains(category.id);
          }).toList(),
        ),
      ),
    );
  }

  // The reason we set grid view as a child of AnimatedBuilder is to ensure that the grid itself is not rebuilt every time the animation value changes.
  // Instead, only the padding around the grid is updated, which is more efficient.
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryItem(
              category: category,
              onSelectCategory: () => _selectCategory(context, category),
            ),
        ],
      ),
      builder: (context, child) => SlideTransition(
        position:
            Tween<Offset>(
              begin: const Offset(0, 0.4),
              end: const Offset(0, 0),
            ).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut,
              ),
            ),
        child: child,
      ),
    );
  }
}
