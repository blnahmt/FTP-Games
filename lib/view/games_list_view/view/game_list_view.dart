import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ftp_games/core/enums/paddings_enum.dart';
import 'package:ftp_games/view/game_detail_view/view/game_detail_view.dart';
import 'package:ftp_games/view/games_list_view/models/game_model.dart';
import 'package:ftp_games/view/games_list_view/view_model/game_list_view_model.dart';
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
    // TODO: implement initState
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
                color: Theme.of(context).iconTheme.color,
              )),
          IconButton(
              onPressed: () {
                context.read<ThemeManager>().changeTheme(AppThemes.dark);
              },
              icon: Icon(
                Icons.dark_mode_rounded,
                color: Theme.of(context).iconTheme.color,
              ))
        ],
        title: Text(
          'FTPGames',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Observer(
        builder: (context) {
          return ListView.builder(
            padding: ProjectPaddings.lowAll.value,
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

class GameCard extends StatelessWidget {
  const GameCard({
    Key? key,
    required this.gameModel,
  }) : super(key: key);
  final GameModel gameModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return GameDetailView(id: gameModel.id ?? 0);
          },
        ));
      },
      child: Card(
        child: Padding(
          padding: ProjectPaddings.lowAll.value,
          child: Column(
            children: [
              Padding(
                padding: ProjectPaddings.lowAll.value,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    gameModel.thumbnail ?? '',
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: ProjectPaddings.lowAll.value,
                          child: Text(
                            gameModel.title ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding: ProjectPaddings.lowAll.value,
                          child: Text(
                            gameModel.title ?? '',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: ProjectPaddings.lowAll.value,
                    child: Text(
                      gameModel.genre ?? '',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
