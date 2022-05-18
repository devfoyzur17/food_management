// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_management/screen/categorie_food_screen.dart';
import 'package:food_management/screen/filter_screen.dart';
import 'package:food_management/screen/food_details.dart';
import 'package:food_management/widget/main_drawer.dart';
 
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:  Colors.purple,
        primaryColor: Colors.blue,
        accentColor: Colors.amber,
        canvasColor: Color(0xffffffe6),
        fontFamily: 'Relway',
        textTheme: TextTheme(

          // bodyText1: TextStyle(color:  Colors.red),
          // bodyText2: TextStyle(color: Colors.green),
          titleMedium: TextStyle(
            fontSize: 20,
             color:  Color(0xffff0000),
            // fontWeight: FontWeight.bold,
             letterSpacing: 2,
             
            fontFamily: 'RobotoCondensed'
          ),
          titleSmall: TextStyle(
            fontSize: 15,
             color:  Colors.purple,
             fontWeight: FontWeight.w400,
             
            fontFamily: 'Relway'
          )
        )
      ),
     // home: CategorieScreen(),
     initialRoute: '/',
      routes: {
        '/':(context) => TabScreen(),
        CategorieFoodScreen.routeName: (context) => CategorieFoodScreen(),
        FoodDetails.routeName : (context) => FoodDetails(),
        FilterScreen.routeName:(context) => FilterScreen()
      },
    );
  }
}
