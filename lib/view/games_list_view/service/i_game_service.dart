import 'package:dio/dio.dart';
import 'package:ftp_games/view/game_detail_view/models/game_detail_model.dart';
import 'package:ftp_games/view/games_list_view/models/game_model.dart';

abstract class IGameService {
  IGameService(this.dio);
  final Dio dio;
  Future<List<GameModel>?> getGames();
  Future<GameDetailModel?> getGameDetail(int id);
}
