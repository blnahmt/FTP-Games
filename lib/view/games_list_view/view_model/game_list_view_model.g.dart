// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameListViewModel on _GameListViewModelBase, Store {
  late final _$gamesAtom =
      Atom(name: '_GameListViewModelBase.games', context: context);

  @override
  List<GameModel> get games {
    _$gamesAtom.reportRead();
    return super.games;
  }

  @override
  set games(List<GameModel> value) {
    _$gamesAtom.reportWrite(value, super.games, () {
      super.games = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_GameListViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$refreshGamesAsyncAction =
      AsyncAction('_GameListViewModelBase.refreshGames', context: context);

  @override
  Future<void> refreshGames() {
    return _$refreshGamesAsyncAction.run(() => super.refreshGames());
  }

  late final _$_GameListViewModelBaseActionController =
      ActionController(name: '_GameListViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_GameListViewModelBaseActionController.startAction(
        name: '_GameListViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_GameListViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
games: ${games},
isLoading: ${isLoading}
    ''';
  }
}