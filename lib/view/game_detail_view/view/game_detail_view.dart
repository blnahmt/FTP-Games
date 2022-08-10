import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ftp_games/core/constants/app_constants.dart';
import 'package:ftp_games/core/extentions/context_extentions.dart';
import 'package:ftp_games/core/extentions/duration_extentions.dart';
import 'package:ftp_games/core/extentions/padding_extentions.dart';
import 'package:ftp_games/core/extentions/radius_extentions.dart';
import 'package:ftp_games/core/extentions/string_extentions.dart';
import 'package:ftp_games/core/navigation/navigation_service.dart';
import 'package:ftp_games/view/game_detail_view/view_model/game_detail_view_model.dart';
import 'package:ftp_games/view/games_list_view/models/game_model.dart';

import 'package:url_launcher/url_launcher.dart';

part 'game_detail_view_parts.dart';

class GameDetailView extends StatefulWidget {
  const GameDetailView({Key? key, required this.id, required this.thumbnail})
      : super(key: key);
  final int id;
  final String thumbnail;

  @override
  State<GameDetailView> createState() => _GameDetailViewState();
}

class _GameDetailViewState extends State<GameDetailView> {
  final GameDetailViewModel _viewModel = GameDetailViewModel();

  @override
  void initState() {
    super.initState();

    _viewModel.init(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const _BackButton(),
        backgroundColor: Colors.transparent,
      ),
      body: Observer(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ThumbnailImage(
                  heroTag: widget.id.toString(),
                  thumbnail: widget.thumbnail,
                ),
                _viewModel.isLoading
                    ? Padding(
                        padding: context.paddingHighOnly(top: true),
                        child:
                            const Center(child: CupertinoActivityIndicator()),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _TitleRow(viewModel: _viewModel),
                          _Description(viewModel: _viewModel),
                          _viewModel.gameModel?.screenshots != null
                              ? _viewModel.gameModel!.screenshots!.isNotEmpty
                                  ? _ScreenShots(viewModel: _viewModel)
                                  : const SizedBox.shrink()
                              : const SizedBox.shrink(),
                          _AdditionalInformation(viewModel: _viewModel),
                          _Requirements(viewModel: _viewModel)
                        ],
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}
