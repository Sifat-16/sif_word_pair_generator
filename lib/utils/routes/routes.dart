
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sif_word_pair_generator/utils/routes/routes_name.dart';
import 'package:sif_word_pair_generator/view/favourite_screen.dart';
import 'package:sif_word_pair_generator/view/home_screen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings routeSettings){
    final arguments = routeSettings.arguments;
    switch(routeSettings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (context)=>HomeScreen());

      case RoutesName.favourite:
        return MaterialPageRoute(builder: (context)=>FavoriteScreen());

      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text("No Route Defined"),
            ),
          );
        });

    }
  }
}