import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildListTile(String title, IconData icon) {
    return ListTile(
      onTap: () {},
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      Container(
        child: Text(
          "Cooking Up!",
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor),
        ),
        height: 100,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        color: Theme.of(context).accentColor,
      ),
      SizedBox(height: 20),
      _buildListTile("Meals", Icons.restaurant),
      _buildListTile("Filters", Icons.settings)
    ]));
  }
}
