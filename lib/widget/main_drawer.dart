// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:food_management/screen/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

 

  Widget buildListTile(IconData icon, String tittle, Function onTabHandelar) {
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        tittle,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      ),


      onTap: (){onTabHandelar();}
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          height: 150,
          width: double.infinity,
          color: Colors.purple,
          child: Text(
            "Cooking Up!!",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                letterSpacing: 1,
                wordSpacing: 1),
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 10),
        ),
        buildListTile(Icons.restaurant, "Restaurant",(){
            Navigator.of(context).pushNamed("/");
        }),
        buildListTile(Icons.filter_list, "Filter",(){

            Navigator.of(context).pushNamed(FilterScreen.routeName);
        }),
      ],
    ));
  }
}
