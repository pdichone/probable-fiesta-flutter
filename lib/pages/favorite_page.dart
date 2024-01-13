import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_app/providers/app_state_provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var theme = Theme.of(context);

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.delete_outline, semanticLabel: 'Delete'),
              color: theme.colorScheme.primary,
              onPressed: () {
                appState.removeFavorite(pair);
              },
            ),
            title: Text(
              pair,
              // semanticsLabel: pair.asPascalCase,
            ),
          ),
      ],
    );
  }
}
