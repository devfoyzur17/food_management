// ignore_for_file: prefer_const_constructors, unused_element, unused_field, prefer_final_fields, unused_local_variable

import 'package:flutter/material.dart';
import 'package:food_management/data/food_data.dart';
import 'package:food_management/model/food_model.dart';
import 'package:food_management/screen/categorie_food_screen.dart';
import 'package:food_management/screen/filter_screen.dart';
import 'package:food_management/screen/food_details.dart';

import 'screen/tab_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    "glutenFree": false,
    "vegan": false,
    "vegetarian": false,
    "lactoseFree": false,
  };

  List<FoodModel> _availableMils = foodData;
  List<FoodModel> _favouriteFood=[];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      _availableMils = foodData.where((food) {
        if (filters['glutenFree']! && food.isGlutenFree) {
          return false;
        }
        if (filters['vegan']! && food.isVegan) {
          return false;
        }
        if (filters['vegetarian']! && food.isVegetarian) {
          return false;
        }
        if (filters['lactoseFree']! && food.isLactoseFree) {
          return false;
        }

        return true;
      }).toList();
    });
  }


  void _toggleFavourite(String foodId){
    final existingFood = _favouriteFood.indexWhere((food) => food.id == foodId);

    if(existingFood >= 0){
      setState(() {
        _favouriteFood.removeAt(existingFood);
      });
    }else{
      setState(() {
        _favouriteFood.add(
          foodData.firstWhere((food) => food.id==foodId)
        );
      });
    }
  }

  bool _isFavourite(String id){

    return _favouriteFood.any((food) => food.id ==id);

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.purple,
          primaryColor: Colors.blue,
          accentColor: Colors.amber,
          canvasColor: Color(0xffffffe6),
          fontFamily: 'Relway',
          textTheme: TextTheme(

              // bodyText1: TextStyle(color:  Colors.red),
              // bodyText2: TextStyle(color: Colors.green),
              titleMedium: TextStyle(
                  fontSize: 20,
                  color: Color(0xffff0000),
                  // fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontFamily: 'RobotoCondensed'),
              titleSmall: TextStyle(
                  fontSize: 15,
                  color: Colors.purple,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Relway'))),
      // home: CategorieScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabScreen(_favouriteFood),
        CategorieFoodScreen.routeName: (context) =>
            CategorieFoodScreen(_availableMils),
        FoodDetails.routeName: (context) => FoodDetails(_toggleFavourite,_isFavourite),
        FilterScreen.routeName: (context) => FilterScreen(filters, _setFilters)
      },
    );
  }
}
