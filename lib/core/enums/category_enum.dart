import 'package:ftp_games/core/extentions/string_extentions.dart';

enum Categories {
  all,
  mmorpg,
  shooter,
  strategy,
  moba,
  racing,
  sports,
  social,
  sandbox,
  openWorld,
  survival,
  pvp,
  pve,
  pixel,
  voxel,
  zombie,
  turnBased,
  firstPerson,
  thirdPerson,
  topDown,
  tank,
  space,
  sailing,
  sideScroller,
  superhero,
  permadeath,
  card,
  battleRoyale,
  mmo,
  mmofps,
  mmotps,
  treed,
  twod,
  anime,
  fantasy,
  scifi,
  fighting,
  actionRpg,
  action,
  military,
  martialArts,
  flight,
  lowSpec,
  towerDefense,
  horror,
  mmorts
}

extension CategoryExtention on Categories {
  String getQueryName() {
    switch (this) {
      case Categories.openWorld:
        return "open-world";
      case Categories.turnBased:
        return "turn-based";
      case Categories.firstPerson:
        return "first-based";
      case Categories.thirdPerson:
        return "third-Person";
      case Categories.topDown:
        return "top-down";
      case Categories.sideScroller:
        return "side-scroller";
      case Categories.battleRoyale:
        return "battle-royale";
      case Categories.treed:
        return "3d";
      case Categories.twod:
        return "2d";
      case Categories.scifi:
        return "sci-fi";
      case Categories.actionRpg:
        return "action-rpg";
      case Categories.martialArts:
        return "martial-arts";
      case Categories.lowSpec:
        return "low-spec";
      case Categories.towerDefense:
        return "tower-defence";
      default:
        return name;
    }
  }

  String getName() {
    switch (this) {
      case Categories.openWorld:
        return "Open World";
      case Categories.turnBased:
        return "Turn Based";
      case Categories.pvp:
        return "PvP";
      case Categories.pve:
        return "PvE";
      case Categories.firstPerson:
        return "FPS";
      case Categories.thirdPerson:
        return "TPS";
      case Categories.topDown:
        return "Top Down";
      case Categories.sideScroller:
        return "Side Scroller";
      case Categories.battleRoyale:
        return "Battle Royale";
      case Categories.treed:
        return "3D";
      case Categories.twod:
        return "2D";
      case Categories.scifi:
        return "Sci-fi";
      case Categories.actionRpg:
        return "Action RPG";
      case Categories.martialArts:
        return "Martial Arts";
      case Categories.lowSpec:
        return "Low Spec";
      case Categories.towerDefense:
        return "Tower Defence";
      default:
        return name.inCaps;
    }
  }
}
