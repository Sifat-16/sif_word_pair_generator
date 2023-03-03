import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sif_word_pair_generator/view_model/favourite_view_model.dart';

import '../data/model/word_pair.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<FavouriteViewModel>(context, listen: false).getFavourites();
  }
  @override
  Widget build(BuildContext context) {
    final favoriteViewModel = Provider.of<FavouriteViewModel>(context);
    return Scaffold(
      appBar:AppBar(
        title: Text("Favorites"),
        backgroundColor: Colors.deepPurple,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: favoriteViewModel.favourites.length,
          itemBuilder: (context, index){

          WordPair word = favoriteViewModel.favourites[index];

            return ListTile(
              title: Text("${word.first}-${word.last}", style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
            );

          }
      ),
    );

  }
}
