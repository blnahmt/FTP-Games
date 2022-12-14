part of "game_detail_view.dart";

class _Requirements extends StatelessWidget {
  const _Requirements({
    Key? key,
    required GameDetailViewModel viewModel,
  })  : _viewModel = viewModel,
        super(key: key);

  final GameDetailViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.paddingMediumOnly(left: true, bottom: true),
          child: Text(
            AppConstants.minimumRequirements,
            style: context.theme.textTheme.headline6,
          ),
        ),
        _viewModel.gameModel?.platform == Platforms.browser
            ? Padding(
                padding: context.paddingMediumOnly(left: true, bottom: true),
                child: Text(
                  "${_viewModel.gameModel?.title} ${AppConstants.reqBrowser}",
                  style: context.theme.textTheme.bodyText2,
                ),
              )
            : _viewModel.gameModel?.minimumSystemRequirements == null
                ? Padding(
                    padding:
                        context.paddingMediumOnly(left: true, bottom: true),
                    child: Text(
                      "${AppConstants.reqNotFound} ${_viewModel.gameModel?.title} ",
                      style: context.theme.textTheme.bodyText2,
                    ),
                  )
                : Column(
                    children: [
                      _ReqTile(
                        title: AppConstants.processor,
                        val: _viewModel.gameModel?.minimumSystemRequirements
                                ?.processor ??
                            AppConstants.reqNotFound,
                      ),
                      _ReqTile(
                        title: AppConstants.graphics,
                        val: _viewModel.gameModel?.minimumSystemRequirements
                                ?.graphics ??
                            AppConstants.reqNotFound,
                      ),
                      _ReqTile(
                        title: AppConstants.memory,
                        val: _viewModel
                                .gameModel?.minimumSystemRequirements?.memory ??
                            AppConstants.reqNotFound,
                      ),
                      _ReqTile(
                        title: AppConstants.storage,
                        val: _viewModel.gameModel?.minimumSystemRequirements
                                ?.storage ??
                            AppConstants.reqNotFound,
                      ),
                      _ReqTile(
                        title: AppConstants.os,
                        val: _viewModel
                                .gameModel?.minimumSystemRequirements?.os ??
                            AppConstants.reqNotFound,
                      ),
                    ],
                  )
      ],
    );
  }
}

class _ReqTile extends StatelessWidget {
  const _ReqTile({
    Key? key,
    required title,
    required val,
  })  : _title = title,
        _val = val,
        super(key: key);

  final String _title;
  final String _val;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: context.paddingMediumAll,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: context.paddingHighOnly(right: true),
                child: Text(
                  "$_title : ",
                  style: context.theme.textTheme.subtitle1,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: context.paddingHighOnly(right: true),
                  child: Text(
                    _val,
                    softWrap: true,
                    textAlign: TextAlign.right,
                    style: context.theme.textTheme.subtitle2,
                  ),
                ),
              )
            ],
          ),
        ),
        const Divider(thickness: 2),
      ],
    );
  }
}

class _AdditionalInformation extends StatelessWidget {
  const _AdditionalInformation({
    Key? key,
    required GameDetailViewModel viewModel,
  })  : _viewModel = viewModel,
        super(key: key);

  final GameDetailViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingMediumAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConstants.additionalInformation,
            style: context.theme.textTheme.headline6,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _AdditionalInformationTile(
                      title: AppConstants.developer,
                      val: _viewModel.gameModel?.developer,
                    ),
                    _AdditionalInformationTile(
                      title: AppConstants.genre,
                      val: _viewModel.gameModel?.genre,
                    ),
                    _AdditionalInformationTile(
                      title: AppConstants.platform,
                      val: _viewModel.gameModel?.platform?.name.inCaps,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _AdditionalInformationTile(
                      title: AppConstants.publisher,
                      val: _viewModel.gameModel?.publisher,
                    ),
                    _AdditionalInformationTile(
                      title: AppConstants.releaseDate,
                      val: _viewModel.gameModel?.releaseDate,
                    ),
                    _AdditionalInformationTile(
                      title: AppConstants.status,
                      val: _viewModel.gameModel?.status,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _AdditionalInformationTile extends StatelessWidget {
  const _AdditionalInformationTile({
    Key? key,
    required title,
    required val,
  })  : _title = title,
        _val = val,
        super(key: key);

  final String _title;
  final String _val;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingMediumAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _title,
            style: context.theme.textTheme.subtitle1,
          ),
          Text(
            _val,
            style: context.theme.textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    Key? key,
    required GameDetailViewModel viewModel,
  })  : _viewModel = viewModel,
        super(key: key);

  final GameDetailViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingMediumOnly(top: true, left: true),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${AppConstants.about} ${_viewModel.gameModel?.title}",
            style: context.theme.textTheme.headline6,
          ),
          ExpandableText(text: _viewModel.gameModel?.description ?? ""),
        ],
      ),
    );
  }
}

class _ScreenShots extends StatelessWidget {
  const _ScreenShots({
    Key? key,
    required GameDetailViewModel viewModel,
  })  : _viewModel = viewModel,
        super(key: key);

  final GameDetailViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.paddingMediumOnly(left: true, top: true),
          child: const Text(AppConstants.screenShots),
        ),
        Column(
          children: List.generate(
              _viewModel.gameModel?.screenshots?.length ?? 0,
              (index) => Padding(
                    padding: context.paddingMediumOnly(
                        top: true, left: true, right: true),
                    child: ClipRRect(
                      borderRadius: context.radiusNormal,
                      child: Hero(
                        tag: _viewModel.gameModel?.screenshots?[index].image ??
                            "screenshot",
                        child: Image.network(
                          _viewModel.gameModel?.screenshots?[index].image ?? "",
                          width: double.infinity,
                          fit: BoxFit.contain,
                          loadingBuilder: (context, child, loadingProgress) {
                            return loadingProgress == null
                                ? child
                                : LinearProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  );
                          },
                        ),
                      ),
                    ),
                  )),
        )
      ],
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          NavigationService.instance.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          shadows: [
            Shadow(blurRadius: 10, color: Colors.black, offset: Offset(2, 2))
          ],
        ));
  }
}

class _TitleRow extends StatelessWidget with _LaunchUrlMixin {
  const _TitleRow({
    Key? key,
    required GameDetailViewModel viewModel,
  })  : _viewModel = viewModel,
        super(key: key);

  final GameDetailViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHighOnly(top: true, bottom: true),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Padding(
            padding: context.paddingHighOnly(left: true),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _viewModel.gameModel?.title ?? "",
                  style: context.theme.textTheme.headline5,
                  maxLines: 2,
                ),
                Text(
                  _viewModel.gameModel?.developer ?? "",
                  style: context.theme.textTheme.subtitle2,
                ),
              ],
            ),
          )),
          Padding(
            padding: context.paddingNormalOnly(right: true),
            child: ElevatedButton(
                onPressed: () {
                  launchWebsite(_viewModel.gameModel?.gameUrl ?? "");
                },
                child: Padding(
                  padding: context.paddingNormalAll,
                  child: const Text(
                    AppConstants.websiteButtonText,
                  ),
                )),
          )
        ],
      ),
    );
  }
}

mixin _LaunchUrlMixin {
  launchWebsite(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }
}

class _ThumbnailImage extends StatelessWidget {
  const _ThumbnailImage({
    Key? key,
    required heroTag,
    required thumbnail,
  })  : _heroTag = heroTag,
        _thumbnail = thumbnail,
        super(key: key);

  final String _heroTag;
  final String _thumbnail;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _heroTag,
      child: Image.network(
        _thumbnail,
        width: double.infinity,
        fit: BoxFit.contain,
      ),
    );
  }
}

class ExpandableText extends StatefulWidget {
  const ExpandableText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin<ExpandableText> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      AnimatedSize(
          duration: context.durationLow,
          child: Text(
            widget.text,
            maxLines: isExpanded ? null : 3,
            style: context.theme.textTheme.bodyText2,
          )),
      TextButton.icon(
          label: const Text(AppConstants.readMore),
          icon: Icon(isExpanded
              ? Icons.arrow_drop_up_rounded
              : Icons.more_horiz_rounded),
          onPressed: () => setState(() => isExpanded = !isExpanded))
    ]);
  }
}
