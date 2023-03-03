import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sif_word_pair_generator/data/model/word_pair.dart';
import 'package:sif_word_pair_generator/utils/components/like_animation.dart';
import 'package:sif_word_pair_generator/utils/routes/routes_name.dart';
import 'package:sif_word_pair_generator/view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).initializePrefs();
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    print("home-build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Word-Pair"),
        backgroundColor: Colors.deepPurple,
        elevation: 1,
        actions: [
          IconButton(onPressed: (){

            Navigator.of(context).pushNamed(RoutesName.favourite);

          }, icon: Icon(Icons.list_alt_sharp))
        ],
      ),
      body: ListView.builder(
          itemCount: homeViewModel.words.length,
          itemBuilder: (context, index){
            WordPair word = homeViewModel.words[index];
            return ListTile(
              title: Text("${word.first}-${word.last}", style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              trailing: LikeButton(onTap: (){
                homeViewModel.favouriteButtonAction(index);
              }, isLiked: homeViewModel.favourites.contains(index),),
              /*IconButton(onPressed: (){

              }, icon: Icon(Icons.favorite_outline)
              ),*/

            );
          }
      ),
    );
  }
}
