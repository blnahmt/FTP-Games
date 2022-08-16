part of "game_list_view.dart";

class _FilterPageSheet extends StatelessWidget {
  const _FilterPageSheet({
    Key? key,
    required GameListViewModel viewModel,
    required MultiSelectController multiSelectController,
  })  : _viewModel = viewModel,
        _multiSelectController = multiSelectController,
        super(key: key);

  final GameListViewModel _viewModel;
  final MultiSelectController _multiSelectController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHighVertical +
          (context.paddingHighOnly(top: true) * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _CategoryDropDown(viewModel: _viewModel),
              _SortDropDown(viewModel: _viewModel)
            ],
          ),
          Padding(
            padding: context.paddingHighOnly(top: true, left: true),
            child: const Text(AppConstants.selectTags),
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
                        color: context.theme.colorScheme.primary,
                        borderRadius: context.radiusNormal)),
                controller: _multiSelectController,
                items: Tags.values
                    .map((e) => MultiSelectCard(
                        value: e.getQueryName(), label: e.getName()))
                    .toList(),
                onChange: (allSelectedItems, selectedItem) {
                  _viewModel.setTagsText(allSelectedItems.join("."));
                }),
          ),
          Padding(
            padding: context.paddingHighOnly(top: true, left: true),
            child: Row(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: context.paddingHighAll,
                        shape: RoundedRectangleBorder(
                            borderRadius: context.radiusLow)),
                    onPressed: () {
                      if (_viewModel.tagsText == null) {
                        _viewModel.refreshGames();
                      } else {
                        _viewModel.refreshGamesWithFilter();
                      }
                      NavigationService.instance.back();
                    },
                    child: Text(AppConstants.filter.toUpperCase())),
                Padding(
                  padding: context.paddingNormalOnly(left: true),
                  child: TextButton(
                      onPressed: () {
                        _multiSelectController.deselectAll();
                        _viewModel.setCategory(null);
                        _viewModel.setSort(null);
                        _viewModel.setTagsText(null);
                        _viewModel.refreshGames();
                      },
                      child: const Text(AppConstants.resetFilters)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CategoryDropDown extends StatelessWidget {
  const _CategoryDropDown({Key? key, required viewModel})
      : _viewModel = viewModel,
        super(key: key);
  final GameListViewModel _viewModel;
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Padding(
        padding: context.paddingHighOnly(left: true),
        child: _FilterContainer(
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
            hint: const Text(AppConstants.selectCategory),
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

class _SortDropDown extends StatelessWidget {
  const _SortDropDown({Key? key, required viewModel})
      : _viewModel = viewModel,
        super(key: key);
  final GameListViewModel _viewModel;
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Padding(
        padding: context.paddingHighOnly(right: true),
        child: _FilterContainer(
          child: DropdownButton<SortItems>(
            dropdownColor: context.theme.backgroundColor,
            borderRadius: context.radiusLow,
            underline: const SizedBox.shrink(),
            hint: const Text(AppConstants.selectSort),
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

class _FilterContainer extends StatelessWidget {
  const _FilterContainer({Key? key, required this.child}) : super(key: key);
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
