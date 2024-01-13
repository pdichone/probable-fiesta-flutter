import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_app/providers/app_state_provider.dart';
import 'package:word_app/widgets/big_card.dart';
import 'package:word_app/widgets/history.dart';
import 'package:world_names/world_names.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 5, child: HistoryListview()),
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite(pair);
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNewPair();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
