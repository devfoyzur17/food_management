
// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:flutter/material.dart';
 
class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  static final routeName = "filter-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("This is filter screen"),
    );
  }
}