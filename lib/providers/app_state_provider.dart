import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  GlobalKey? historyListKey;
  var history = <WordPair>[];

  void getNewPair() {
    history.insert(0, current);
    var animatedListState = historyListKey?.currentState as AnimatedListState?;
    animatedListState?.insertItem(0);
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite(WordPair? pair) {
    pair ??= current;
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
