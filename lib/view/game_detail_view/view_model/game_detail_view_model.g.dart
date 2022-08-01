// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameDetailViewModel on _GameDetailViewModelBase, Store {
  late final _$gameModelAtom =
      Atom(name: '_GameDetailViewModelBase.gameModel', context: context);

  @override
  GameDetailModel? get gameModel {
    _$gameModelAtom.reportRead();
    return super.gameModel;
  }

  @override
  set gameModel(GameDetailModel? value) {
    _$gameModelAtom.reportWrite(value, super.gameModel, () {
      super.gameModel = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_GameDetailViewModelBase.isLoading', context: context);

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

  late final _$_GameDetailViewModelBaseActionController =
      ActionController(name: '_GameDetailViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_GameDetailViewModelBaseActionController.startAction(
        name: '_GameDetailViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_GameDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gameModel: ${gameModel},
isLoading: ${isLoading}
    ''';
  }
}
