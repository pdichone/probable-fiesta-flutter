import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNewPair() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite(WordPair pair) {
    if (favorites.contains(pair)) {
      favorites.remove(pair);
    } else {
      favorites.add(pair);
    }
    notifyListeners();
  }

  //implement remove
  void removeFavorite(WordPair pair) {
    favorites.remove(pair);
    notifyListeners();
  }
}
