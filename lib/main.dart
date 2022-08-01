import 'package:flutter/material.dart';
import 'package:ftp_games/core/theme/theme_notifier.dart';
import 'package:ftp_games/view/game_detail_view/view/game_detail_view.dart';
import 'package:ftp_games/view/games_list_view/view/game_list_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeManager>(
        create: (context) => ThemeManager(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: context.watch<ThemeManager>().theme,
      home: const GameListView(),
    );
  }
}
