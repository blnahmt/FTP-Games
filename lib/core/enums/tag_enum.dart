import 'package:ftp_games/core/extentions/string_extentions.dart';

enum Tags {
  shooter,
  moba,
  social,
  sandbox,
  openWorld,
  pvp,
  pve,
  pixel,
  voxel,
  zombie,
  turnBased,
  thirdPerson,
  topDown,
  tank,
  space,
  sailing,
  sideScroller,
  superhero,
  permadeath,
  battleRoyale,
  mmo,
  mmofps,
  mmotps,
  treed,
  twod,
  fantasy,
  scifi,
  military,
  martialArts,
  flight,
  lowSpec,
  towerDefense,
  mmorts
}

extension TagsExtention on Tags {
  String getQueryName() {
    switch (this) {
      case Tags.openWorld:
        return "open-world";
      case Tags.turnBased:
        return "turn-based";
      case Tags.thirdPerson:
        return "third-Person";
      case Tags.topDown:
        return "top-down";
      case Tags.sideScroller:
        return "side-scroller";
      case Tags.battleRoyale:
        return "battle-royale";
      case Tags.treed:
        return "3d";
      case Tags.twod:
        return "2d";
      case Tags.scifi:
        return "sci-fi";
      case Tags.martialArts:
        return "martial-arts";
      case Tags.lowSpec:
        return "low-spec";
      case Tags.towerDefense:
        return "tower-defence";
      default:
        return name;
    }
  }

  String getName() {
    switch (this) {
      case Tags.openWorld:
        return "Open World";
      case Tags.turnBased:
        return "Turn Based";
      case Tags.pvp:
        return "PvP";
      case Tags.pve:
        return "PvE";
      case Tags.thirdPerson:
        return "TPS";
      case Tags.topDown:
        return "Top Down";
      case Tags.sideScroller:
        return "Side Scroller";
      case Tags.battleRoyale:
        return "Battle Royale";
      case Tags.treed:
        return "3D";
      case Tags.twod:
        return "2D";
      case Tags.scifi:
        return "Sci-fi";
      case Tags.martialArts:
        return "Martial Arts";
      case Tags.lowSpec:
        return "Low Spec";
      case Tags.towerDefense:
        return "Tower Defence";
      default:
        return name.inCaps;
    }
  }
}
