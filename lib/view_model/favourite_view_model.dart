
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sif_word_pair_generator/data/model/word_pair.dart';
import 'package:sif_word_pair_generator/res/words/words.dart';
import 'package:sif_word_pair_generator/view_model/home_view_model.dart';

import '../utils/keys/shared_preference_keys.dart';

class FavouriteViewModel extends ChangeNotifier{

  List<WordPair> favourites = [];


  getFavourites()async{
    favourites = [];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> indexesString = preferences.getStringList(SharedPreferenceKeys.favourite_indexes)??[];
    List<int> fi = indexesString.map((e) => int.parse(e)).toList();

    for (var element in fi) {
      favourites.add(wordPairs[element]);
    }
    notifyListeners();
  }

}