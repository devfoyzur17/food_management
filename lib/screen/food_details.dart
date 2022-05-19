// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:food_management/data/food_data.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({Key? key}) : super(key: key);

  static const routeName = '/food-details';

  Widget buildSelectedTittle(BuildContext context, String tittle) {
    return Container(
      
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        tittle,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildContainer(BuildContext context,child) {
    return Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.purple, width: 1.5),
            borderRadius: BorderRadius.circular(20)),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final foodId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedFood = foodData.firstWhere(
      (element) => element.id == foodId,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(foodId),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedFood.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSelectedTittle(context, "Ingredients"),
           buildContainer(context,ListView.builder(
                  itemCount: selectedFood.ingredients.length,
                  itemBuilder: (context, index) => Card(
                        margin: EdgeInsets.all(5),
                        color: Color.fromARGB(255, 248, 231, 231),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Text(
                            selectedFood.ingredients[index],
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )),
            ),

            buildSelectedTittle(context, "Steps"),

            buildContainer(context,ListView.builder(
              itemCount: selectedFood.steps.length,
              itemBuilder: (context, index) => Column(children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 15,
                  child: Text("${index+1}"),
                ),
                title: Text(selectedFood.steps[index], style: Theme.of(context).textTheme.titleSmall,),
              ),
              Divider(color: Colors.purple.withOpacity(0.5)),
            
            ],)  ))

          ],
        ),
        
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.delete),onPressed: () {
        Navigator.of(context).pop(foodId);
        
      },),
    );
  }
}
