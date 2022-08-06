import 'package:flutter/material.dart';
import 'package:ftp_games/core/extentions/context_extentions.dart';
import 'package:ftp_games/core/extentions/padding_extentions.dart';
import 'package:ftp_games/view/game_detail_view/models/game_detail_model.dart';

class DrawReqTable extends StatelessWidget {
  const DrawReqTable({
    Key? key,
    required this.context,
    required this.reqs,
  }) : super(key: key);

  final BuildContext context;
  final MinimumSystemRequirements? reqs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RequirementTile(
          context: context,
          title: "Processor:",
          detail: reqs?.processor ?? "",
          isOdd: true,
        ),
        RequirementTile(
          context: context,
          title: "Graphic:",
          detail: reqs?.graphics ?? "",
        ),
        RequirementTile(
          context: context,
          title: "Memory:",
          detail: reqs?.memory ?? "",
          isOdd: true,
        ),
        RequirementTile(
          context: context,
          title: "Storage:",
          detail: reqs?.storage ?? "",
        ),
        RequirementTile(
          context: context,
          title: "Operation System:",
          detail: reqs?.os ?? "",
          isOdd: true,
        ),
      ],
    );
  }
}

class RequirementTile extends StatelessWidget {
  const RequirementTile({
    Key? key,
    required this.context,
    required this.title,
    required this.detail,
    this.isOdd = false,
  }) : super(key: key);

  final BuildContext context;
  final String title;
  final String detail;
  final bool isOdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isOdd ? context.theme.backgroundColor : context.theme.cardColor,
      child: Padding(
        padding: context.paddingHighAll,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: context.paddingHighOnly(right: true),
              child: Text(title),
            ),
            Expanded(
                child: Text(
              detail,
              textAlign: TextAlign.right,
            ))
          ],
        ),
      ),
    );
  }
}
