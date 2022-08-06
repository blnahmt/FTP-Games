import 'package:json_annotation/json_annotation.dart';

part 'game_model.g.dart';

Platforms? _platformToJson(String data) {
  switch (data) {
    case "PC (Windows)":
      return Platforms.pc;
    case "Web Browser":
      return Platforms.browser;
  }
  return null;
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class GameModel {
  int? id;
  String? title;
  String? thumbnail;
  String? shortDescription;
  String? gameUrl;
  String? genre;
  @JsonKey(fromJson: _platformToJson)
  Platforms? platform;
  String? publisher;
  String? developer;
  String? releaseDate;
  String? freetogameProfileUrl;

  GameModel(
      {this.id,
      this.title,
      this.thumbnail,
      this.shortDescription,
      this.gameUrl,
      this.genre,
      this.platform,
      this.publisher,
      this.developer,
      this.releaseDate,
      this.freetogameProfileUrl});

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return _$GameModelFromJson(json);
  }
}

enum Platforms {
  @JsonValue('PC (Windows)')
  pc,
  @JsonValue('Web Browser')
  browser
}

extension PlatformsExtention on Platforms {
  String value() {
    switch (this) {
      case Platforms.pc:
        return "PC (Windows)";

      case Platforms.browser:
        return "Browser";
    }
  }
}
