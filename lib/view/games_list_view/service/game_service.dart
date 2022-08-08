import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ftp_games/core/enums/category_enum.dart';
import 'package:ftp_games/core/enums/sort_enum.dart';
import 'package:ftp_games/view/game_detail_view/models/game_detail_model.dart';
import 'package:ftp_games/view/games_list_view/models/game_model.dart';

abstract class IGameService {
  IGameService(this.dio);
  final Dio dio;
  Future<List<GameModel>?> getGames(Categories? category, SortItems? sort);
  Future<List<GameModel>?> getGamesWithFilter(
      Categories? category, SortItems? sort, String? tags);
  Future<GameDetailModel?> getGameDetail(int id);
}

class GameService extends IGameService {
  GameService(Dio dio) : super(dio);
  @override
  Future<List<GameModel>?> getGames(
      Categories? category, SortItems? sort) async {
    Map<String, dynamic>? parameters = {};
    if (category != null) {
      parameters["category"] = category.getQueryName();
    }
    if (sort != null) {
      parameters["sort-by"] = sort.getQueryName();
    }

    var response =
        await dio.get(FTPApiPaths.games.rawPath, queryParameters: parameters);
    if (response.statusCode == HttpStatus.ok) {
      var jsonBody = response.data;

      if (jsonBody is List) {
        return jsonBody.map((json) => GameModel.fromJson(json)).toList();
      }
    }
    return null;
  }

  @override
  Future<List<GameModel>?> getGamesWithFilter(
      Categories? category, SortItems? sort, String? tags) async {
    Map<String, dynamic>? parameters = {};

    if (sort != null) {
      parameters["sort-by"] = sort.getQueryName();
    }
    if (tags != null) {
      String value = tags;
      if (category != null) {
        value = "$value.${category.getQueryName()}";
      }
      parameters["tag"] = value;
    }

    var response =
        await dio.get(FTPApiPaths.filter.rawPath, queryParameters: parameters);
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

enum FTPApiPaths { games, game, filter }

extension FTPApiPathsExtention on FTPApiPaths {
  String get rawPath => '/$name';
}
