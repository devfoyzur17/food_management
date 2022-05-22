// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, equal_keys_in_map

import 'package:flutter/material.dart';
import 'package:food_management/model/food_model.dart';
import 'package:food_management/screen/categorie_screen.dart';
import 'package:food_management/screen/favourite_screen.dart';
import 'package:food_management/widget/main_drawer.dart';

class TabScreen extends StatefulWidget {
  final List<FoodModel> favoutiteFood;
  const TabScreen(this.favoutiteFood, {Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  List<dynamic>? _pages;

  int _selectedIndex=0;

  @override
  void initState() {
    // TODO: implement initState

    _pages =[
  {"page":  CategorieScreen(), "tittle":"All Category",},
   {"page": FavouriteScreen(widget.favoutiteFood), "tittle":"Your Favourite"}
    
  ];

    super.initState();
  }

  void _selectedPage(int index){
    setState(() {

      _selectedIndex = index;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages![_selectedIndex]["tittle"]),
        elevation: 0,
      ),
      drawer: MainDrawer(),
      body: _pages![_selectedIndex]["page"],

       bottomNavigationBar: ClipRRect(
         borderRadius: BorderRadius.only(topLeft:  Radius.circular(25), topRight: Radius.circular(25)),
         
         child: BottomNavigationBar(
          
           backgroundColor: Colors.purple,
           selectedItemColor: Colors.white,
           unselectedItemColor: Colors.white54,
           currentIndex: _selectedIndex,
           onTap: _selectedPage,
           items: [
           
       
           BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: "Category"),
           BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favourite")
       
         ]),
       ),
    );
  }
}
