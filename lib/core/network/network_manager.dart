import 'package:dio/dio.dart';

class NetworkManager {
  NetworkManager._();
  static final NetworkManager instance = NetworkManager._();

  static const String ftpBaseURL =
      "https://free-to-play-games-database.p.rapidapi.com/api/";

  Dio ftpDio = Dio(BaseOptions(baseUrl: ftpBaseURL, headers: {
    "X-RapidAPI-Key": "82152b9f3bmshe7ab8758006b149p197d4fjsn724de8a9da55",
    "X-RapidAPI-Host": "free-to-play-games-database.p.rapidapi.com"
  }));
}
