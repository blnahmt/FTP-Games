import 'package:ftp_games/core/extentions/string_extentions.dart';

enum SortItems { releaseDate, popularity, alphabetical, relevance }

extension SortItemExtention on SortItems {
  String getQueryName() {
    switch (this) {
      case SortItems.releaseDate:
        return "release-date";
      default:
        return name;
    }
  }

  String getName() {
    switch (this) {
      case SortItems.releaseDate:
        return "Release Date";
      default:
        return name.inCaps;
    }
  }
}
