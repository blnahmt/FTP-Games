import 'package:dio/dio.dart';
import 'package:ftp_games/my_keys.dart';

class NetworkManager {
  NetworkManager._();
  static final NetworkManager instance = NetworkManager._();

  static const String ftpBaseURL =
      "https://free-to-play-games-database.p.rapidapi.com/api/";

  Dio ftpDio = Dio(BaseOptions(baseUrl: ftpBaseURL, headers: {
    //TODO: Add an api key from https://rapidapi.com/digiwalls/api/free-to-play-games-database/
    "X-RapidAPI-Key": MyKeys.myApiKey,
    "X-RapidAPI-Host": "free-to-play-games-database.p.rapidapi.com"
  }));
}
