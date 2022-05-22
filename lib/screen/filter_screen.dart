// ignore_for_file: prefer_const_constructors, prefer_const_declarations, unused_field, prefer_final_fields, prefer_const_literals_to_create_immutables, unused_element

import 'package:flutter/material.dart';
import 'package:food_management/widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String,bool> currentFilter;
  const FilterScreen(this.currentFilter,this.saveFilters,  {Key? key}) : super(key: key);

  static final routeName = "filter-screen";

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  var _vegan = false;
  var _vegetarian = false;
  var _lactoseFree = false;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

  _glutenFree = widget.currentFilter['glutenFree'] as bool;
  _vegan = widget.currentFilter['vegan'] as bool;
  _vegetarian = widget.currentFilter['vegetarian'] as bool;
  _lactoseFree = widget.currentFilter['lactoseFree'] as bool;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  "glutenFree": _glutenFree,
                  "vegan": _vegan,
                  "vegetarian": _vegetarian,
                  "lactoseFree": _lactoseFree,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your food selection",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1,
                  wordSpacing: 1,
                  fontFamily: 'Raleway'),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                value: _glutenFree,
                onChanged: (currentValue) {
                  setState(() {
                    _glutenFree = currentValue;
                  });
                },
                title: Text("Gluten Free"),
                subtitle: Text("Only included Gluten Free Food"),
                tileColor: Colors.red.withOpacity(0.1),
              ),
              Divider(),
              SwitchListTile(
                value: _vegan,
                onChanged: (currentValue) {
                  setState(() {
                    _vegan = currentValue;
                  });
                },
                title: Text("Vegan"),
                subtitle: Text("Only included Vegan Food"),
                tileColor: Colors.red.withOpacity(0.1),
              ),
              Divider(),
              SwitchListTile(
                value: _vegetarian,
                onChanged: (currentValue) {
                  setState(() {
                    _vegetarian = currentValue;
                  });
                },
                title: Text("Vegetarin"),
                subtitle: Text("Only included Vegetarin Food"),
                tileColor: Colors.red.withOpacity(0.1),
              ),
              Divider(),
              SwitchListTile(
                value: _lactoseFree,
                onChanged: (currentValue) {
                  setState(() {
                    _lactoseFree = currentValue;
                  });
                },
                title: Text("LactoseFree"),
                subtitle: Text("Only included LactoseFree Food"),
                tileColor: Colors.red.withOpacity(0.1),
              )
            ],
          ))
        ],
      ),
    );
  }
}
