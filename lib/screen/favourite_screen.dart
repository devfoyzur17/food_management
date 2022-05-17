// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart'; 
class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Icon(Icons.favorite)),
    );
  }
}