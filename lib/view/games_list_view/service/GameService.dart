import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ftp_games/view/game_detail_view/models/game_detail_model.dart';
import 'package:ftp_games/view/games_list_view/models/game_model.dart';
import 'package:ftp_games/view/games_list_view/service/IGameService.dart';

class GameService extends IGameService {
  GameService(Dio dio) : super(dio);
  @override
  Future<List<GameModel>?> getGames() async {
    var response = await dio.get(FTPApiPaths.games.rawPath);
    if (response.statusCode == HttpStatus.ok) {
      var jsonBody = response.data;
      if (jsonBody is List) {
        return jsonBody.map((json) => GameModel.fromJson(json)).toList();
      }
    }
    return null;
  }

  @override
  Future<GameDetailModel?> getGameDetail(int id) async {
    var response =
        await dio.get(FTPApiPaths.game.rawPath, queryParameters: {"id": id});
    if (response.statusCode == HttpStatus.ok) {
      var jsonBody = response.data;
      return GameDetailModel.fromJson(jsonBody);
    }
    return null;
  }
}

enum FTPApiPaths { games, game }

extension FTPApiPathsExtention on FTPApiPaths {
  String get rawPath => '/$name';
}
