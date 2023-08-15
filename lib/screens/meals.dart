import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  void _onSelectMeal(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal: meal)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = meals.isEmpty
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Uh oh ... nothing here',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Try selecting a another category',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                )
              ],
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) => MealItem(
              meal: meals[index],
              onSelectMeal: () {
                _onSelectMeal(context, meals[index]);
              },
            ),
            itemCount: meals.length,
          );

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: content);
  }
}