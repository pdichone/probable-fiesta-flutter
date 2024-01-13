import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:world_names/world_names.dart';

class MyAppState extends ChangeNotifier {
  // var current = WordPair.random();
  var current = NameGenerator.getName();
  GlobalKey? historyListKey;
  var history = <String>[];

  void getNewPair() {
    history.insert(0, current);
    var animatedListState = historyListKey?.currentState as AnimatedListState?;
    animatedListState?.insertItem(0);
    current = NameGenerator.getName();
    notifyListeners();
  }

  var favorites = <String>[];

  void toggleFavorite(String? pair) {
    pair ??= current;
    if (favorites.contains(pair)) {
      favorites.remove(pair);
    } else {
      favorites.add(pair);
    }
    notifyListeners();
  }

  //implement remove
  void removeFavorite(String pair) {
    favorites.remove(pair);
    notifyListeners();
  }
}
