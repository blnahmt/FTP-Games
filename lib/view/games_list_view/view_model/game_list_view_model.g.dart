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

  late final _$categoryAtom =
      Atom(name: '_GameListViewModelBase.category', context: context);

  @override
  Categories? get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(Categories? value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  late final _$sortAtom =
      Atom(name: '_GameListViewModelBase.sort', context: context);

  @override
  SortItems? get sort {
    _$sortAtom.reportRead();
    return super.sort;
  }

  @override
  set sort(SortItems? value) {
    _$sortAtom.reportWrite(value, super.sort, () {
      super.sort = value;
    });
  }

  late final _$tagsTextAtom =
      Atom(name: '_GameListViewModelBase.tagsText', context: context);

  @override
  String? get tagsText {
    _$tagsTextAtom.reportRead();
    return super.tagsText;
  }

  @override
  set tagsText(String? value) {
    _$tagsTextAtom.reportWrite(value, super.tagsText, () {
      super.tagsText = value;
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

  late final _$refreshGamesWithFilterAsyncAction = AsyncAction(
      '_GameListViewModelBase.refreshGamesWithFilter',
      context: context);

  @override
  Future<void> refreshGamesWithFilter() {
    return _$refreshGamesWithFilterAsyncAction
        .run(() => super.refreshGamesWithFilter());
  }

  late final _$_GameListViewModelBaseActionController =
      ActionController(name: '_GameListViewModelBase', context: context);

  @override
  void setCategory(Categories? val) {
    final _$actionInfo = _$_GameListViewModelBaseActionController.startAction(
        name: '_GameListViewModelBase.setCategory');
    try {
      return super.setCategory(val);
    } finally {
      _$_GameListViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSort(SortItems? val) {
    final _$actionInfo = _$_GameListViewModelBaseActionController.startAction(
        name: '_GameListViewModelBase.setSort');
    try {
      return super.setSort(val);
    } finally {
      _$_GameListViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTagsText(String? val) {
    final _$actionInfo = _$_GameListViewModelBaseActionController.startAction(
        name: '_GameListViewModelBase.setTagsText');
    try {
      return super.setTagsText(val);
    } finally {
      _$_GameListViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoading({bool? val}) {
    final _$actionInfo = _$_GameListViewModelBaseActionController.startAction(
        name: '_GameListViewModelBase.changeLoading');
    try {
      return super.changeLoading(val: val);
    } finally {
      _$_GameListViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
games: ${games},
category: ${category},
sort: ${sort},
tagsText: ${tagsText},
isLoading: ${isLoading}
    ''';
  }
}
