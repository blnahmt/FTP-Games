import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ftp_games/core/constants/app_constants.dart';
import 'package:ftp_games/core/enums/category_enum.dart';
import 'package:ftp_games/core/enums/sort_enum.dart';

import 'package:ftp_games/core/extentions/context_extentions.dart';
import 'package:ftp_games/core/extentions/duration_extentions.dart';
import 'package:ftp_games/core/extentions/padding_extentions.dart';
import 'package:ftp_games/core/extentions/radius_extentions.dart';
import 'package:ftp_games/view/games_list_view/view_model/game_list_view_model.dart';
import 'package:ftp_games/widgets/cards/game_card.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/theme_notifier.dart';
import '../../../core/theme/themes_enum.dart';

class GameListView extends StatefulWidget {
  const GameListView({Key? key}) : super(key: key);

  @override
  State<GameListView> createState() => _GameListViewState();
}

class _GameListViewState extends State<GameListView> {
  final GameListViewModel _viewModel = GameListViewModel();

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
              onPressed: () {
                _viewModel.changeShowFilter();
              },
              icon: Icon(
                Icons.filter_alt_rounded,
                color: context.theme.iconTheme.color,
              )),
          const _ThemeChangeButton()
        ],
        title: Text(
          AppConstants.appName,
          style: context.theme.textTheme.headline5,
        ),
      ),
      body: Column(
        children: [
          Observer(builder: (context) {
            return AnimatedContainer(
              height: _viewModel.showFilter ? kToolbarHeight : 0,
              duration: context.durationLow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryDropDown(viewModel: _viewModel),
                  SortDropDown(viewModel: _viewModel)
                ],
              ),
            );
          }),
          Expanded(
            child: Observer(
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
          ),
        ],
      ),
    );
  }
}

class CategoryDropDown extends StatelessWidget {
  const CategoryDropDown({Key? key, required viewModel})
      : _viewModel = viewModel,
        super(key: key);
  final GameListViewModel _viewModel;
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Padding(
        padding: context.paddingHighOnly(left: true),
        child: DropdownButton<Categories>(
          dropdownColor: context.theme.backgroundColor,
          borderRadius: context.radiusLow,
          underline: const SizedBox.shrink(),
          hint: const Text("Select Category"),
          items: List.generate(
            Categories.values.length,
            (index) => DropdownMenuItem<Categories>(
                value: Categories.values[index],
                child: Text(Categories.values[index].getName())),
          ),
          onChanged: (value) {
            _viewModel.setCategory(value == Categories.all ? null : value);
            _viewModel.refreshGames();
          },
          value: _viewModel.category,
        ),
      );
    });
  }
}

class SortDropDown extends StatelessWidget {
  const SortDropDown({Key? key, required viewModel})
      : _viewModel = viewModel,
        super(key: key);
  final GameListViewModel _viewModel;
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Padding(
        padding: context.paddingHighOnly(left: true),
        child: DropdownButton<SortItems>(
          dropdownColor: context.theme.backgroundColor,
          borderRadius: context.radiusLow,
          underline: const SizedBox.shrink(),
          hint: const Text("Select to Sort"),
          items: List.generate(
            SortItems.values.length,
            (index) => DropdownMenuItem<SortItems>(
                value: SortItems.values[index],
                child: Text(SortItems.values[index].getName())),
          ),
          onChanged: (value) {
            _viewModel.setSort(value);
            _viewModel.refreshGames();
          },
          value: _viewModel.sort,
        ),
      );
    });
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
              firstChild: Icon(
                Icons.light,
                color: context.theme.iconTheme.color,
              ),
              secondChild: Icon(
                Icons.nightlight_round,
                color: context.theme.iconTheme.color,
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
