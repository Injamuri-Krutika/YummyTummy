import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './categories_screen.dart';

void main() => runApp(YummyTummy());

class YummyTummy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Yummy in my Tummy",
        home: CategoriesScreen(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ));
  }
}
