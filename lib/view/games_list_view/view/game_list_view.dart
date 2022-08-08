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
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: context.radiusNormalOnly(
                          topLeft: true, topRight: true)),
                  backgroundColor: context.theme.backgroundColor,
                  context: context,
                  builder: (context) {
                    return Stack(
                      children: [
                        Padding(
                          padding: context.paddingHighVertical +
                              (context.paddingHighOnly(top: true) * 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CategoryDropDown(viewModel: _viewModel),
                                  SortDropDown(viewModel: _viewModel)
                                ],
                              ),
                              Padding(
                                padding: context.paddingHighOnly(
                                    top: true, left: true),
                                child: const Text("Select Tags"),
                              ),
                              Padding(
                                padding: context.paddingHighOnly(left: true) +
                                    context.paddingLowOnly(
                                      top: true,
                                    ),
                                child: MultiSelectContainer(
                                    itemsDecoration: MultiSelectDecorations(
                                        decoration: BoxDecoration(
                                            color: context.theme.cardColor,
                                            borderRadius: context.radiusNormal),
                                        selectedDecoration: BoxDecoration(
                                            color: context
                                                .theme.colorScheme.primary,
                                            borderRadius:
                                                context.radiusNormal)),
                                    controller: _multiSelectController,
                                    items: Tags.values
                                        .map((e) => MultiSelectCard(
                                            value: e.getQueryName(),
                                            label: e.getName()))
                                        .toList(),
                                    onChange: (allSelectedItems, selectedItem) {
                                      _viewModel.setTagsText(
                                          allSelectedItems.join("."));
                                    }),
                              ),
                              Padding(
                                padding: context.paddingHighOnly(
                                    top: true, left: true),
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    context.radiusLow)),
                                        onPressed: () {
                                          if (_viewModel.tagsText == null) {
                                            _viewModel.refreshGames();
                                          } else {
                                            _viewModel.refreshGamesWithFilter();
                                          }
                                          NavigationService.instance.back();
                                        },
                                        child: const Text("Filter")),
                                    Padding(
                                      padding:
                                          context.paddingNormalOnly(left: true),
                                      child: TextButton(
                                          onPressed: () {
                                            _multiSelectController
                                                .deselectAll();
                                            _viewModel.setCategory(null);
                                            _viewModel.setSort(null);
                                            _viewModel.setTagsText(null);
                                            _viewModel.refreshGames();
                                          },
                                          child: const Text("Reset")),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            right: 0,
                            child: IconButton(
                              onPressed: () {
                                NavigationService.instance.back();
                              },
                              padding: context.paddingNormalAll,
                              icon: Icon(Icons.close_rounded),
                            )),
                        Positioned(
                            left: 0,
                            child: Padding(
                              padding: context.paddingMediumAll,
                              child: Text(
                                "Filters",
                                style: context.theme.textTheme.headline5,
                              ),
                            )),
                      ],
                    );
                  },
                );
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
        child: FilterContainer(
          child: DropdownButton<Categories>(
            dropdownColor: context.theme.backgroundColor,
            borderRadius: context.radiusLow,
            icon: Padding(
              padding: context.paddingLowOnly(left: true),
              child: const Icon(
                Icons.category_rounded,
              ),
            ),
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
            },
            value: _viewModel.category,
          ),
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
        padding: context.paddingHighOnly(right: true),
        child: FilterContainer(
          child: DropdownButton<SortItems>(
            dropdownColor: context.theme.backgroundColor,
            borderRadius: context.radiusLow,
            underline: const SizedBox.shrink(),
            hint: const Text("Select to Sort"),
            icon: Padding(
              padding: context.paddingLowOnly(left: true),
              child: const Icon(
                Icons.sort_rounded,
              ),
            ),
            items: List.generate(
              SortItems.values.length,
              (index) => DropdownMenuItem<SortItems>(
                  value: SortItems.values[index],
                  child: Text(SortItems.values[index].getName())),
            ),
            onChanged: (value) {
              _viewModel.setSort(value);
            },
            value: _viewModel.sort,
          ),
        ),
      );
    });
  }
}

class FilterContainer extends StatelessWidget {
  const FilterContainer({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingMediumHorizontal,
      decoration: BoxDecoration(
          color: context.theme.cardColor, borderRadius: context.radiusLow),
      child: child,
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
