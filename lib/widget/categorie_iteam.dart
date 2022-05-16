// ignore_for_file: prefer_const_constructors
 
import 'package:flutter/material.dart';

import '../screen/categorie_food_screen.dart';

class CategorieIteam extends StatelessWidget {
  final String id;
  final String tittle;
  final Color color;
  const CategorieIteam({Key? key, required this.id,required this.tittle, required this.color})
      : super(key: key);

      void selectCategorie(BuildContext context){
        Navigator.of(context).pushNamed(CategorieFoodScreen.routeName,arguments: {
          "id":id,
          "tittle":tittle
        }

        );
      }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: color,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: Theme.of(context).primaryColor,
        onTap: (() => selectCategorie(context)),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: Text(tittle, style: Theme.of(context).textTheme.titleMedium,),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [color.withOpacity(0.9), color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
                  border: Border.all(color: Colors.purple, width: 2),
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
