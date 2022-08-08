import 'package:ftp_games/core/network/network_manager.dart';
import 'package:ftp_games/view/game_detail_view/models/game_detail_model.dart';
import 'package:mobx/mobx.dart';

import '../../games_list_view/service/game_service.dart';
part 'game_detail_view_model.g.dart';

// ignore: library_private_types_in_public_api
class GameDetailViewModel = _GameDetailViewModelBase with _$GameDetailViewModel;

abstract class _GameDetailViewModelBase with Store {
  init(int id) async {
    changeLoading();
    gameModel = await _service.getGameDetail(id);

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
