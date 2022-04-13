// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'screen/categorie_screen.dart';

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
        accentColor: Colors.amber,
        canvasColor: Color(0xffffffe6),
        fontFamily: 'Relway',
        textTheme: TextTheme(

          // bodyText1: TextStyle(color:  Colors.red),
          // bodyText2: TextStyle(color: Colors.green),
          titleMedium: TextStyle(
            fontSize: 20,
             color: Colors.black,
            fontFamily: 'RobotoCondensed'
          )
        )
      ),
      home: CategorieScreen(),
    );
  }
}
