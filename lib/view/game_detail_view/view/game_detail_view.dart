import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ftp_games/core/extentions/context_extentions.dart';
import 'package:ftp_games/core/extentions/padding_extentions.dart';
import 'package:ftp_games/core/extentions/radius_extentions.dart';
import 'package:ftp_games/core/extentions/string_extentions.dart';
import 'package:ftp_games/core/navigation/navigation_service.dart';
import 'package:ftp_games/view/game_detail_view/models/game_detail_model.dart';
import 'package:ftp_games/view/game_detail_view/view_model/game_detail_view_model.dart';
import 'package:ftp_games/view/games_list_view/models/game_model.dart';
import 'package:ftp_games/widgets/tiles/draw_req_tile.dart';

import 'package:url_launcher/url_launcher.dart';

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
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _viewModel.init(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildThumbnail(),
                  _viewModel.isLoading
                      ? Padding(
                          padding: context.paddingHighAll,
                          child:
                              const Center(child: CupertinoActivityIndicator()),
                        )
                      : _buildDetailView(context)
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Column _buildDetailView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.paddingNormalVertical,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    NavigationService.instance.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded)),
              Expanded(
                  child: Padding(
                padding: context.paddingNormalOnly(left: true),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _viewModel.gameModel?.title ?? "",
                      style: context.theme.textTheme.headlineSmall,
                    ),
                    Text(
                      _viewModel.gameModel?.developer ?? "",
                      style: context.theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              )),
              Padding(
                padding: context.paddingNormalOnly(right: true),
                child: ElevatedButton(
                    onPressed: () async {
                      if (!await launchUrl(
                          Uri.parse(_viewModel.gameModel?.gameUrl ?? ""))) {
                        throw 'Could not launch ${_viewModel.gameModel?.gameUrl}';
                      }
                    },
                    child: const Text("Website")),
              )
            ],
          ),
        ),
        Padding(
          padding: context.paddingMediumOnly(left: true, bottom: true),
          child: Text(
            _viewModel.gameModel?.shortDescription ?? "",
            style: context.theme.textTheme.bodyMedium,
          ),
        ),
        Padding(
          padding: context.paddingMediumOnly(
            left: true,
          ),
          child: Text(
            "Developer: ${_viewModel.gameModel?.developer}",
            style: context.theme.textTheme.bodySmall,
          ),
        ),
        Padding(
          padding: context.paddingMediumOnly(
            left: true,
          ),
          child: Text(
            "Publisher: ${_viewModel.gameModel?.publisher}",
            style: context.theme.textTheme.bodySmall,
          ),
        ),
        Padding(
          padding: context.paddingMediumOnly(
            left: true,
          ),
          child: Text(
            "Genre: ${_viewModel.gameModel?.genre}",
            style: context.theme.textTheme.bodySmall,
          ),
        ),
        Padding(
          padding: context.paddingMediumOnly(
            left: true,
          ),
          child: Text(
            "Platform: ${_viewModel.gameModel?.platform?.value()}",
            style: context.theme.textTheme.bodySmall,
          ),
        ),
        Padding(
          padding: context.paddingMediumOnly(
            left: true,
          ),
          child: Text(
            "Release Date: ${_viewModel.gameModel?.releaseDate}",
            style: context.theme.textTheme.bodySmall,
          ),
        ),
        Padding(
          padding: context.paddingMediumOnly(
            left: true,
          ),
          child: Text(
            "Status: ${_viewModel.gameModel?.status}",
            style: context.theme.textTheme.bodySmall,
          ),
        ),
        Padding(
          padding: context.paddingLowOnly(left: true),
          child: TextButton(
              onPressed: () async {
                if (!await launchUrl(Uri.parse(
                    _viewModel.gameModel?.freetogameProfileUrl ?? ""))) {
                  throw 'Could not launch ${_viewModel.gameModel?.freetogameProfileUrl}';
                }
              },
              child: const Text(
                "Open on FreeToGame",
              )),
        ),
        TabBar(
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            controller: _tabController,
            isScrollable: true,
            tabs: [
              Tab(text: TabItems.details.name.inCaps),
              Tab(text: TabItems.screenshots.name.inCaps),
              Tab(text: TabItems.requirements.name.inCaps)
            ]),
        _getPage(_currentIndex)
      ],
    );
  }

  Hero _buildThumbnail() {
    return Hero(
      tag: widget.id.toString(),
      child: Image.network(
        widget.thumbnail,
        width: double.infinity,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return Padding(
          padding: context.paddingMediumAll,
          child: Column(
            children: [Text(_viewModel.gameModel?.description ?? "")],
          ),
        );
      case 1:
        return _buildScreenshotsView();
      case 2:
        MinimumSystemRequirements? reqs =
            _viewModel.gameModel?.minimumSystemRequirements;
        return DrawReqTable(
          context: context,
          reqs: reqs,
        );
      default:
        return const SizedBox();
    }
  }

  Column _buildScreenshotsView() {
    return Column(
      children: List.generate(
          _viewModel.gameModel?.screenshots?.length ?? 0,
          (index) => Padding(
                padding: context.paddingMediumAll,
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          insetPadding: EdgeInsets.zero,
                          child: Stack(
                            children: [
                              InteractiveViewer(
                                child: Container(
                                  color: context.theme.backgroundColor,
                                  height: double.infinity,
                                  child: Hero(
                                    tag: _viewModel.gameModel
                                            ?.screenshots?[index].image ??
                                        "screenshot",
                                    child: Image.network(
                                      _viewModel.gameModel?.screenshots?[index]
                                              .image ??
                                          "",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(right: 0, child: CloseButton()),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: ClipRRect(
                    borderRadius: context.radiusNormal,
                    child: Hero(
                      tag: _viewModel.gameModel?.screenshots?[index].image ??
                          "screenshot",
                      child: Image.network(
                        _viewModel.gameModel?.screenshots?[index].image ?? "",
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}

enum TabItems { details, screenshots, requirements }
