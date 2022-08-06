import 'package:flutter/material.dart';

class NavigationService {
  NavigationService._();
  static final instance = NavigationService._();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic>? toPage({required String routeName, Object? args}) {
    return navigatorKey.currentState?.pushNamed(routeName, arguments: args);
  }

  void back() {
    return navigatorKey.currentState?.pop();
  }
}
