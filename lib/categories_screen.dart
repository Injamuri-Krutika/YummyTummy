import 'package:YummuTummy/category_item.dart';
import 'package:flutter/material.dart';
import './dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Yummy Tummy")),
        body: GridView(
          padding: const EdgeInsets.all(25),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: DUMMY_CATEGORIES
              .map((data) => CategoryItem(data.id, data.title, data.color))
              .toList(),
        ));
  }
}
