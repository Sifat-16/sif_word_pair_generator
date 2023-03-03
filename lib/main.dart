import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sif_word_pair_generator/utils/routes/routes.dart';
import 'package:sif_word_pair_generator/utils/routes/routes_name.dart';
import 'package:sif_word_pair_generator/view_model/favourite_view_model.dart';
import 'package:sif_word_pair_generator/view_model/home_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>HomeViewModel()),
        ChangeNotifierProvider(create: (_)=>FavouriteViewModel()),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.home,
        onGenerateRoute: Routes.generateRoute,

      ),
    );
  }
}

