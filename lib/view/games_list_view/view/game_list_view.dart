import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ftp_games/core/constants/app_constants.dart';

import 'package:ftp_games/core/extentions/context_extentions.dart';
import 'package:ftp_games/core/extentions/padding_extentions.dart';
import 'package:ftp_games/view/game_detail_view/view/game_detail_view.dart';
import 'package:ftp_games/view/games_list_view/models/game_model.dart';
import 'package:ftp_games/view/games_list_view/view_model/game_list_view_model.dart';
import 'package:ftp_games/widgets/cards/game_card.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/theme_notifier.dart';
import '../../../core/theme/themes_enum.dart';

class GameListView extends StatefulWidget {
  const GameListView({Key? key}) : super(key: key);

  @override
  State<GameListView> createState() => _GameListViewState();
}

class _GameListViewState extends State<GameListView> {
  final GameListViewModel _viewModel = GameListViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<ThemeManager>().changeTheme(AppThemes.light);
              },
              icon: Icon(
                Icons.light_mode_rounded,
                color: context.theme.iconTheme.color,
              )),
          IconButton(
              onPressed: () {
                context.read<ThemeManager>().changeTheme(AppThemes.dark);
              },
              icon: Icon(
                Icons.dark_mode_rounded,
                color: context.theme.iconTheme.color,
              ))
        ],
        title: Text(
          AppConstants.appName,
          style: context.theme.textTheme.headline5,
        ),
      ),
      body: Observer(
        builder: (context) {
          return ListView.builder(
            padding: context.paddingNormalAll,
            itemCount: _viewModel.games.length,
            itemBuilder: (context, index) {
              return GameCard(
                gameModel: _viewModel.games[index],
              );
            },
          );
        },
      ),
    );
  }
}
