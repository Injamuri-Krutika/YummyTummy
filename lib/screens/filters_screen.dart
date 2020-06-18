import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static String routeName = "/filters-screen";

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _lactoseFree = false;

  Widget _buidSwitchListTile(String title, String description,
      bool currentValue, Function _updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: _updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Filters"),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              child: Text(
                "Adjust your meal selection!",
                style: Theme.of(context).textTheme.headline6,
              ),
              padding: EdgeInsets.all(20),
            ),
            Expanded(
                child: ListView(
              children: [
                _buidSwitchListTile(
                    "Gluten Free", "Only Gluten free meals", _glutenFree,
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buidSwitchListTile(
                    "Lactose Free", "Only Lactose free meals", _lactoseFree,
                    (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buidSwitchListTile(
                    "Vegetarian", "Only inclue vegetarian meals", _isVegetarian,
                    (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                }),
                _buidSwitchListTile(
                    "Vegan", "Include vegan meals only.", _isVegan, (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
