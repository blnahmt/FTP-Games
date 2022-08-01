import 'dart:developer';

import 'package:ftp_games/core/network/network_manager.dart';
import 'package:ftp_games/view/game_detail_view/models/game_detail_model.dart';
import 'package:ftp_games/view/games_list_view/service/IGameService.dart';
import 'package:mobx/mobx.dart';

import '../../games_list_view/service/GameService.dart';
part 'game_detail_view_model.g.dart';

class GameDetailViewModel = _GameDetailViewModelBase with _$GameDetailViewModel;

abstract class _GameDetailViewModelBase with Store {
  init(int id) async {
    changeLoading();
    gameModel = await _service.getGameDetail(id);
    inspect(gameModel);
    changeLoading();
  }

  final IGameService _service = GameService(NetworkManager.instance.ftpDio);

  @observable
  GameDetailModel? gameModel;

  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }
}
