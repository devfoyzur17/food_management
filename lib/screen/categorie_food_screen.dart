// ignore_for_file: prefer_const_constructors, unused_local_variable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:food_management/data/food_data.dart';
import 'package:food_management/widget/food_item.dart';

class CategorieFoodScreen extends StatelessWidget {
  // final String categorieId; 
  // final String categorieTittle;
  // const CategorieFoodScreen(
  //     {Key? key, required this.categorieId, required this.categorieTittle})
  //     : super(key: key);

  static const routeName = '/categorie-food-screen';

  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categorieId = routArgs['id'];
    final categorieTitle = routArgs['tittle'];
    final categorieFood = foodData.where((food) {
      return food.categories.contains(categorieId);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categorieTitle!)),
      body: ListView.builder(
          itemCount: categorieFood.length,
          itemBuilder: (context, index) {
            return FoodItem(
              id: categorieFood[index].id,
                tittle: categorieFood[index].title,
                imageUrl: categorieFood[index].imageUrl,
                duration: categorieFood[index].duration,
                complexity: categorieFood[index].complexity,
                affordability: categorieFood[index].affordability);
          }),
    );
  }
}
