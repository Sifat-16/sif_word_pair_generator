import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sif_word_pair_generator/view_model/favorite_view_model.dart';

import '../data/model/word_pair.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<FavoriteViewModel>(context, listen: false).getFavourites();
  }
  @override
  Widget build(BuildContext context) {
    final favoriteViewModel = Provider.of<FavoriteViewModel>(context);
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
