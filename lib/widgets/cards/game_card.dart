import 'package:flutter/material.dart';
import 'package:ftp_games/core/extentions/context_extentions.dart';
import 'package:ftp_games/core/extentions/padding_extentions.dart';
import 'package:ftp_games/view/game_detail_view/view/game_detail_view.dart';
import 'package:ftp_games/view/games_list_view/models/game_model.dart';
import 'package:ionicons/ionicons.dart';

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
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return GameDetailView(
              id: gameModel.id ?? 0,
              thumbnail: gameModel.thumbnail ?? '',
            );
          },
        ));
      },
      child: Card(
        margin: context.paddingMediumAll,
        child: Column(
          children: [
            Hero(
              tag: "${gameModel.id}",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  width: double.infinity,
                  gameModel.thumbnail ?? '',
                  fit: BoxFit.cover,
                ),
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
                  gameModel.platform == Platforms.pc
                      ? const Icon(Ionicons.logo_windows)
                      : const Icon(Ionicons.browsers_outline)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
