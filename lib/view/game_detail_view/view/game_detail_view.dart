import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ftp_games/core/extentions/context_extentions.dart';
import 'package:ftp_games/core/extentions/padding_extentions.dart';
import 'package:ftp_games/view/game_detail_view/view_model/game_detail_view_model.dart';

class GameDetailView extends StatefulWidget {
  const GameDetailView({Key? key, required this.id, required this.thumbnail})
      : super(key: key);
  final int id;
  final String thumbnail;

  @override
  State<GameDetailView> createState() => _GameDetailViewState();
}

class _GameDetailViewState extends State<GameDetailView>
    with SingleTickerProviderStateMixin {
  final GameDetailViewModel _viewModel = GameDetailViewModel();
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _viewModel.init(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          iconTheme: context.theme.iconTheme,
          actions: [
            Observer(
              builder: (context) {
                return _viewModel.isLoading
                    ? const Center(child: CupertinoActivityIndicator())
                    : const SizedBox.shrink();
              },
            )
          ],
        ),
        body: Observer(
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: widget.id.toString(),
                    child: Image.network(
                      widget.thumbnail,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                  TabBar(controller: _tabController, tabs: [
                    Tab(text: "ashd"),
                    Tab(text: "ashd"),
                    Tab(text: "ashd")
                  ]),
                  _viewModel.isLoading
                      ? const SizedBox.shrink()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: context.paddingNormalAll,
                              child: Text(
                                '${_viewModel.gameModel?.developer} - ${_viewModel.gameModel?.platform?.name.toUpperCase()} - ${_viewModel.gameModel?.genre}',
                                style: context.theme.textTheme.titleMedium,
                              ),
                            ),
                            Padding(
                              padding: context.paddingNormalAll,
                              child: Text(
                                _viewModel.gameModel?.title ?? '',
                                style: context.theme.textTheme.headline5,
                              ),
                            ),
                            Padding(
                              padding: context.paddingNormalAll,
                              child:
                                  Text(_viewModel.gameModel?.description ?? ''),
                            ),
                            Padding(
                              padding: context.paddingNormalAll,
                              child: Text(
                                'ScreenShots',
                                style: context.theme.textTheme.headline5,
                              ),
                            ),
                            SizedBox(
                              height: 200,
                              child: PageView.builder(
                                controller:
                                    PageController(viewportFraction: 0.9),
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    _viewModel.gameModel?.screenshots?.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: context.paddingNormalAll,
                                    child: FittedBox(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image.network(
                                          _viewModel.gameModel
                                                  ?.screenshots?[index].image ??
                                              '',
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
