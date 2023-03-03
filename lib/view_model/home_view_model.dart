

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sif_word_pair_generator/res/words/words.dart';
import 'package:sif_word_pair_generator/utils/keys/shared_preference_keys.dart';

import '../data/model/word_pair.dart';

class HomeViewModel extends ChangeNotifier{

  List<WordPair> words = wordPairs;
  List<int> favourites = [];

  late SharedPreferences preferences;

  initializePrefs()async{
    preferences = await SharedPreferences.getInstance();
    notifyListeners();
    getFavourites();
  }

  getFavourites(){
    List<String> indexesString = preferences.getStringList(SharedPreferenceKeys.favourite_indexes)??[];
    favourites = indexesString.map((e) => int.parse(e)).toList();
    notifyListeners();

  }

  setFavourite(int index)async{
    List<String> indexesList = preferences.getStringList(SharedPreferenceKeys.favourite_indexes)??[];
    indexesList.add(index.toString());
    await preferences.setStringList(SharedPreferenceKeys.favourite_indexes, indexesList);
    getFavourites();
  }

  removeFavourite(int index)async{
    List<String> indexesList = preferences.getStringList(SharedPreferenceKeys.favourite_indexes)??[];
    indexesList.remove(index.toString());
    await preferences.setStringList(SharedPreferenceKeys.favourite_indexes, indexesList);
    getFavourites();
  }

  void favouriteButtonAction(int index){

    if(favourites.contains(index)){
      removeFavourite(index);
    }else{
      setFavourite(index);
    }

  }



}