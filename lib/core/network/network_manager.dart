import 'package:dio/dio.dart';

class NetworkManager {
  NetworkManager._();
  static final NetworkManager instance = NetworkManager._();

  static const String ftpBaseURL = "https://www.freetogame.com/api/";

  Dio ftpDio = Dio(BaseOptions(
    baseUrl: ftpBaseURL,
  ));
}
