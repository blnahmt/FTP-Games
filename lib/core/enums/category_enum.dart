import 'package:ftp_games/core/extentions/string_extentions.dart';

enum Categories {
  all,
  action,
  actionRpg,
  anime,
  card,
  fighting,
  firstPerson,
  horror,
  mmorpg,
  racing,
  sports,
  strategy,
  survival,
}

extension CategoryExtention on Categories {
  String getQueryName() {
    switch (this) {
      case Categories.firstPerson:
        return "first-person";

      case Categories.actionRpg:
        return "action-rpg";

      default:
        return name;
    }
  }

  String getName() {
    switch (this) {
      case Categories.firstPerson:
        return "FPS";

      case Categories.actionRpg:
        return "Action RPG";

      default:
        return name.inCaps;
    }
  }
}
