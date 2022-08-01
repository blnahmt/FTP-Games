import 'dart:developer';

import 'package:ftp_games/core/network/network_manager.dart';
import 'package:ftp_games/view/games_list_view/models/game_model.dart';
import 'package:ftp_games/view/games_list_view/service/GameService.dart';
import 'package:ftp_games/view/games_list_view/service/IGameService.dart';
import 'package:mobx/mobx.dart';
part 'game_list_view_model.g.dart';

class GameListViewModel = _GameListViewModelBase with _$GameListViewModel;

abstract class _GameListViewModelBase with Store {
  init() async {
    await refreshGames();
  }

  final IGameService _service = GameService(NetworkManager.instance.ftpDio);

  @observable
  List<GameModel> games = [];

  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> refreshGames() async {
    changeLoading();
    games.clear();
    games = await _service.getGames() ?? [];
    inspect(games);
    changeLoading();
  }
}
