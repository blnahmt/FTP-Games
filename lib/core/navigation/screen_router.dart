import 'package:flutter/material.dart';
import 'package:ftp_games/core/navigation/routes.dart';
import 'package:ftp_games/view/game_detail_view/view/game_detail_view.dart';
import 'package:ftp_games/view/games_list_view/view/game_list_view.dart';

class ScreenRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var routes = settings.name == "/"
        ? Routes.init
        : Routes.values.byName(settings.name?.substring(1) ?? "");
    switch (routes) {
      case Routes.init:
        return _getMaterialRoute(const GameListView());
      case Routes.gameDetail:
        var args = settings.arguments as List<Object>;
        int id = args[0] as int;
        String thumbnail = args[1] as String;
        return _getMaterialRoute(GameDetailView(
          id: id,
          thumbnail: thumbnail,
        ));
      default:
        return _getMaterialRoute(Scaffold(
            body:
                Center(child: Text('No route defined for ${settings.name}'))));
    }
  }

  static _getMaterialRoute(Widget child) {
    return MaterialPageRoute(
      builder: (context) => child,
    );
  }
}
