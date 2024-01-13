import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_app/providers/app_state_provider.dart';

class HistoryListview extends StatefulWidget {
  const HistoryListview({super.key});

  @override
  State<HistoryListview> createState() => _HistoryListviewState();
}

class _HistoryListviewState extends State<HistoryListview> {
  final _key = GlobalKey();

  static const Gradient _maskingGradient = LinearGradient(
    // This gradient goes from fully transparent to fully opaque black...
    colors: [Colors.transparent, Colors.black],
    // ... from the top (transparent) to half (0.5) of the way to the bottom.
    stops: [0.0, 0.5],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();
    appState.historyListKey = _key;
    return ShaderMask(
      shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
      blendMode: BlendMode.dst,
      child: AnimatedList(
          key: _key,
          reverse: true,
          padding: EdgeInsets.only(top: 100),
          initialItemCount: appState.history.length,
          itemBuilder: (context, index, animation) {
            final pair = appState.history[index];
            return SizeTransition(
              sizeFactor: animation,
              child: Center(
                child: TextButton.icon(
                  label: Text(
                    pair,
                    //semanticsLabel: pair.asPascalCase,
                  ),
                  icon: appState.favorites.contains(pair)
                      ? Icon(Icons.favorite, size: 12)
                      : SizedBox(),
                  onPressed: () {
                    appState.toggleFavorite(pair);
                  },
                ),
              ),
            );
          }),
    );
  }
}
