// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_management/model/food_model.dart';

import '../widget/food_item.dart'; 
class FavouriteScreen extends StatelessWidget {
  final List<FoodModel> favouriteFood;
  const FavouriteScreen(this.favouriteFood, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      if(favouriteFood.isEmpty){
       return Center(child: Text("You have no favourite yet - start adding some!!"),);
     }
     else{
       return ListView.builder(
          itemCount: favouriteFood.length,
          itemBuilder: (context, index) {
            return FoodItem(
              id: favouriteFood[index].id,
              tittle: favouriteFood[index].title,
              imageUrl: favouriteFood[index].imageUrl,
              duration: favouriteFood[index].duration,
              complexity: favouriteFood[index].complexity,
              affordability: favouriteFood[index].affordability,
             // removeItem: removeFood,
            );
          });
     }
    
  }
}