import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ftp_games/core/enums/paddings_enum.dart';
import 'package:ftp_games/view/game_detail_view/view_model/game_detail_view_model.dart';

class GameDetailView extends StatefulWidget {
  GameDetailView({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<GameDetailView> createState() => _GameDetailViewState();
}

class _GameDetailViewState extends State<GameDetailView> {
  GameDetailViewModel _viewModel = GameDetailViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel.init(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: Theme.of(context).iconTheme,
        actions: [
          Observer(
            builder: (context) {
              return _viewModel.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox.shrink();
            },
          )
        ],
      ),
      body: Observer(
        builder: (context) {
          return _viewModel.isLoading
              ? SizedBox.shrink()
              : ListView(
                  padding: ProjectPaddings.lowAll.value,
                  children: [
                    Padding(
                      padding: ProjectPaddings.lowAll.value,
                      child: FittedBox(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            _viewModel.gameModel?.thumbnail ?? '',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: ProjectPaddings.lowAll.value,
                      child: Text(
                        '${_viewModel.gameModel?.developer} - ${_viewModel.gameModel?.platform} - ${_viewModel.gameModel?.genre}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: ProjectPaddings.lowAll.value,
                      child: Text(
                        _viewModel.gameModel?.title ?? '',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    Padding(
                      padding: ProjectPaddings.lowAll.value,
                      child: Text(_viewModel.gameModel?.description ?? ''),
                    ),
                    Padding(
                      padding: ProjectPaddings.lowAll.value,
                      child: Text(
                        'ScreenShots',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: PageView.builder(
                        controller: PageController(viewportFraction: 0.9),
                        scrollDirection: Axis.horizontal,
                        itemCount: _viewModel.gameModel?.screenshots?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: ProjectPaddings.lowAll.value,
                            child: FittedBox(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.network(
                                  _viewModel.gameModel?.screenshots?[index]
                                          .image ??
                                      '',
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
