import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";
  final Function toggleFavorites;
  final Function isMealFavorite;

  MealDetailScreen(this.toggleFavorites, this.isMealFavorite);

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ));
  }

  Widget _buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(mealId),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                )),
            _buildSectionTitle(context, "Ingedients"),
            _buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).accentColor,
                child: Text(selectedMeal.ingredients[index]),
              ),
              itemCount: selectedMeal.ingredients.length,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            )),
            _buildSectionTitle(context, "Steps"),
            _buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(children: [
                ListTile(
                  leading: CircleAvatar(child: Text('# ${(index + 1)}')),
                  title: Text(selectedMeal.steps[index]),
                ),
                Divider(),
              ]),
              itemCount: selectedMeal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorites(mealId),
        child: isMealFavorite(mealId)
            ? Icon(Icons.favorite)
            : Icon(Icons.favorite_border),
      ),
    );
  }
}
