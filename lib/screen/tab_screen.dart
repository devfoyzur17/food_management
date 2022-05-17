// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, equal_keys_in_map

import 'package:flutter/material.dart';
import 'package:food_management/screen/categorie_screen.dart';
import 'package:food_management/screen/favourite_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

 final List<dynamic> _pages =[
  {"page":  CategorieScreen(), "tittle":"All Category",},
   {"page": FavouriteScreen(), "tittle":"Your Favourite"}
    
  ];

  int _selectedIndex=0;

  void _selectedPage(int index){
    setState(() {

      _selectedIndex = index;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]["tittle"]),
        elevation: 0,
      ),
      body: _pages[_selectedIndex]["page"],

       bottomNavigationBar: BottomNavigationBar(
         
         backgroundColor: Colors.purple,
         selectedItemColor: Colors.white,
         unselectedItemColor: Colors.white54,
         currentIndex: _selectedIndex,
         onTap: _selectedPage,
         items: [
         

         BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: "Category"),
         BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favourite")

       ]),
    );
  }
}
