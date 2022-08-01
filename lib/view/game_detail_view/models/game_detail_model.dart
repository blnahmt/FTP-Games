import 'package:ftp_games/view/games_list_view/models/game_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_detail_model.g.dart';

Platforms? _platformToJson(String data) {
  switch (data) {
    case "Windows":
      return Platforms.pc;
    case "Web Browser":
      return Platforms.browser;
  }
  return null;
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class GameDetailModel {
  int? id;
  String? title;
  String? thumbnail;
  String? status;
  String? shortDescription;
  String? description;
  String? gameUrl;
  String? genre;
  @JsonKey(fromJson: _platformToJson)
  Platforms? platform;
  String? publisher;
  String? developer;
  String? releaseDate;
  String? freetogameProfileUrl;
  MinimumSystemRequirements? minimumSystemRequirements;
  List<Screenshots>? screenshots;

  GameDetailModel(
      {this.id,
      this.title,
      this.thumbnail,
      this.status,
      this.shortDescription,
      this.description,
      this.gameUrl,
      this.genre,
      this.platform,
      this.publisher,
      this.developer,
      this.releaseDate,
      this.freetogameProfileUrl,
      this.minimumSystemRequirements,
      this.screenshots});

  factory GameDetailModel.fromJson(Map<String, dynamic> json) {
    return _$GameDetailModelFromJson(json);
  }
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class MinimumSystemRequirements {
  String? os;
  String? processor;
  String? memory;
  String? graphics;
  String? storage;

  MinimumSystemRequirements(
      {this.os, this.processor, this.memory, this.graphics, this.storage});

  factory MinimumSystemRequirements.fromJson(Map<String, dynamic> json) {
    return _$MinimumSystemRequirementsFromJson(json);
  }
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class Screenshots {
  int? id;
  String? image;

  Screenshots({this.id, this.image});

  factory Screenshots.fromJson(Map<String, dynamic> json) {
    return _$ScreenshotsFromJson(json);
  }
}
