import 'package:flutter/material.dart';
import 'package:ftp_games/core/extentions/context_extentions.dart';
import 'package:ftp_games/core/extentions/padding_extentions.dart';
import 'package:ftp_games/core/extentions/radius_extentions.dart';
import 'package:ftp_games/core/navigation/navigation_service.dart';
import 'package:ftp_games/core/navigation/routes.dart';
import 'package:ftp_games/view/games_list_view/models/game_model.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    Key? key,
    required this.gameModel,
  }) : super(key: key);
  final GameModel gameModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationService.instance.toPage(
            routeName: Routes.gameDetail.nameWithSlash,
            args: [gameModel.id ?? 0, gameModel.thumbnail ?? '']);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: context.radiusLow),
        margin: context.paddingMediumAll,
        child: Column(
          children: [
            Hero(
              tag: "${gameModel.id}",
              child: ClipRRect(
                borderRadius: context.radiusLow,
                child: Image.network(
                    width: double.infinity,
                    gameModel.thumbnail ?? '',
                    fit: BoxFit.cover),
              ),
            ),
            ListTile(
              title: Text(
                gameModel.title ?? "",
                maxLines: 1,
                style: context.theme.textTheme.headline6
                    ?.copyWith(fontWeight: FontWeight.normal),
              ),
              subtitle: Text(
                gameModel.developer ?? "",
                style: context.theme.textTheme.bodySmall,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    gameModel.genre ?? '',
                    style: context.theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
