// ignore_for_file: prefer_const_constructors, unused_local_variable, use_key_in_widget_constructors, prefer_const_constructors_in_immutables
 
import 'package:flutter/material.dart';
import 'package:food_management/data/food_data.dart';
import 'package:food_management/model/food_model.dart';
import 'package:food_management/widget/food_item.dart';

class CategorieFoodScreen extends StatefulWidget {
  // final String categorieId;
  // final String categorieTittle;
  // const CategorieFoodScreen(
  //     {Key? key, required this.categorieId, required this.categorieTittle})
  //     : super(key: key);

  static const routeName = '/categorie-food-screen';
  final List<FoodModel> availableMils;

  CategorieFoodScreen(this.availableMils);

  @override
  State<CategorieFoodScreen> createState() => _CategorieFoodScreenState();
}

class _CategorieFoodScreenState extends State<CategorieFoodScreen> {
  String? categoryTitle;
  List<FoodModel>? displayedFood;
  bool isLodding = false;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // ignore: todo
    // TODO: implement didChangeDependencies

    if (!isLodding) {
      final routArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final categorieId = routArgs['id'];
      categoryTitle = routArgs['tittle'];
      displayedFood = widget.availableMils.where((food) {
        return food.categories.contains(categorieId);
      }).toList();
      isLodding = true;
    }

    super.didChangeDependencies();
  }

  void removeFood(String foodId) {
    setState(() {
      displayedFood!.removeWhere((element) => element.id == foodId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!)),
      body: ListView.builder(
          itemCount: displayedFood!.length,
          itemBuilder: (context, index) {
            return FoodItem(
              id: displayedFood![index].id,
              tittle: displayedFood![index].title,
              imageUrl: displayedFood![index].imageUrl,
              duration: displayedFood![index].duration,
              complexity: displayedFood![index].complexity,
              affordability: displayedFood![index].affordability,
             // removeItem: removeFood,
            );
          }),
    );
  }
}
