import 'package:flutter/material.dart';
import './categories_screen.dart';
import './fav_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {"page": CategoriesScreen(), "title": "Categories"},
    {"page": FavouritesScreen(), "title": "Favourites"}
  ];
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"]),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("Categories"),
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text("Favourites"),
              backgroundColor: Theme.of(context).primaryColor),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
      ),
    );

    //----------Adds the tabs on the top-------------
    // DefaultTabController(
    //     length: 2,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         title: Text("Yummy Tummy"),
    //         bottom: TabBar(tabs: <Widget>[
    //           Tab(icon: Icon(Icons.category), text: "Categories"),
    //           Tab(icon: Icon(Icons.star), text: "Favourites"),
    //         ]),
    //       ),
    //       body: TabBarView(children: [CategoriesScreen(), FavouritesScreen()]),
    //     ));
  }
}
