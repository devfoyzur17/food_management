// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_management/data/categorie_data.dart';
import 'package:food_management/widget/categorie_iteam.dart';

class CategorieScreen extends StatelessWidget {
  const CategorieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Food Management"),
      ),
      body: GridView(
        padding: EdgeInsets.all(10),
          children: categorieData
              .map((catData) =>
                  CategorieIteam(tittle: catData.tittle, color: catData.color))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 2.5,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          )),
    );
  }
}
