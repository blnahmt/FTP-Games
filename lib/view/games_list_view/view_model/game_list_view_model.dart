import 'package:ftp_games/core/enums/category_enum.dart';
import 'package:ftp_games/core/enums/sort_enum.dart';
import 'package:ftp_games/core/network/network_manager.dart';
import 'package:ftp_games/view/games_list_view/models/game_model.dart';
import 'package:ftp_games/view/games_list_view/service/game_service.dart';
import 'package:ftp_games/view/games_list_view/service/i_game_service.dart';
import 'package:mobx/mobx.dart';
part 'game_list_view_model.g.dart';

// ignore: library_private_types_in_public_api
class GameListViewModel = _GameListViewModelBase with _$GameListViewModel;

abstract class _GameListViewModelBase with Store {
  init() async {
    await refreshGames();
  }

  final IGameService _service = GameService(NetworkManager.instance.ftpDio);

  @observable
  List<GameModel> games = [];

  @observable
  Categories? category;

  @action
  void setCategory(Categories? val) {
    category = val;
  }

  @observable
  SortItems? sort;

  @action
  void setSort(SortItems? val) {
    sort = val;
  }

  @observable
  bool isLoading = false;

  @action
  void changeLoading({bool? val}) {
    isLoading = val ?? !isLoading;
  }

  @observable
  bool showFilter = false;

  @action
  void changeShowFilter() {
    showFilter = !showFilter;
  }

  @action
  Future<void> refreshGames() async {
    changeLoading(val: true);
    games.clear();
    games = await _service.getGames(category, sort) ?? [];
    changeLoading(val: false);
  }
}
