import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:ftp_games/core/constants/app_constants.dart';
import 'package:ftp_games/core/enums/category_enum.dart';
import 'package:ftp_games/core/enums/sort_enum.dart';
import 'package:ftp_games/core/enums/tag_enum.dart';

import 'package:ftp_games/core/extentions/context_extentions.dart';
import 'package:ftp_games/core/extentions/duration_extentions.dart';
import 'package:ftp_games/core/extentions/padding_extentions.dart';
import 'package:ftp_games/core/extentions/radius_extentions.dart';
import 'package:ftp_games/core/navigation/navigation_service.dart';
import 'package:ftp_games/view/games_list_view/view_model/game_list_view_model.dart';
import 'package:ftp_games/widgets/cards/game_card.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/theme_notifier.dart';
import '../../../core/theme/themes_enum.dart';

part 'game_list_view_filter_parts.dart';

class GameListView extends StatefulWidget {
  const GameListView({Key? key}) : super(key: key);

  @override
  State<GameListView> createState() => _GameListViewState();
}

class _GameListViewState extends State<GameListView> {
  final GameListViewModel _viewModel = GameListViewModel();
  final MultiSelectController _multiSelectController = MultiSelectController();

  @override
  void initState() {
    super.initState();
    _viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: showBottomSheet,
              icon: const Icon(
                Icons.filter_alt_rounded,
              )),
          const _ThemeChangeButton()
        ],
        title: const Text(
          AppConstants.appName,
        ),
      ),
      body: Observer(
        builder: (context) {
          return _viewModel.isLoading
              ? const Center(
                  child: CupertinoActivityIndicator(),
                )
              : ListView.builder(
                  padding: context.paddingNormalAll,
                  itemCount: _viewModel.games.length,
                  itemBuilder: (context, index) {
                    return GameCard(
                      gameModel: _viewModel.games[index],
                    );
                  },
                );
        },
      ),
    );
  }

  showBottomSheet() {
    _viewModel.setTagsText(null);
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius:
              context.radiusNormalOnly(topLeft: true, topRight: true)),
      backgroundColor: context.theme.backgroundColor,
      context: context,
      builder: (context) {
        return Stack(
          children: [
            _FilterPageSheet(
                viewModel: _viewModel,
                multiSelectController: _multiSelectController),
            Positioned(
                right: 0,
                child: IconButton(
                  onPressed: () => NavigationService.instance.back(),
                  padding: context.paddingNormalAll,
                  icon: const Icon(Icons.close_rounded),
                )),
            Positioned(
                left: 0,
                child: Padding(
                  padding: context.paddingMediumAll,
                  child: Text(
                    AppConstants.filters,
                    style: context.theme.textTheme.headline5,
                  ),
                )),
          ],
        );
      },
    );
  }
}

class _ThemeChangeButton extends StatelessWidget {
  const _ThemeChangeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
      builder: (context, themeChanger, child) {
        return IconButton(
            onPressed: () {
              themeChanger.isDark
                  ? themeChanger.changeTheme(AppThemes.light)
                  : themeChanger.changeTheme(AppThemes.dark);
            },
            icon: AnimatedCrossFade(
              firstChild: const Icon(
                Icons.light,
              ),
              secondChild: const Icon(
                Icons.nightlight_round,
              ),
              crossFadeState: themeChanger.isDark
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: context.durationLow,
            ));
      },
    );
  }
}
