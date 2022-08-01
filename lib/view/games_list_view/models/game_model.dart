import 'package:json_annotation/json_annotation.dart';

part 'game_model.g.dart';

@JsonSerializable(createToJson: false)
class GameModel {
  int? id;
  String? title;
  String? thumbnail;
  String? shortDescription;
  String? gameUrl;
  String? genre;
  String? platform;
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

class GameModels {
  List<GameModel> models = [
    GameModel(id: 5, title: 'deneme', shortDescription: 'sdg'),
    GameModel(id: 5, title: 'deneme', shortDescription: 'sdg'),
    GameModel(id: 5, title: 'deneme', shortDescription: 'sdg'),
    GameModel(id: 5, title: 'deneme', shortDescription: 'sdg'),
    GameModel(id: 5, title: 'deneme', shortDescription: 'sdg'),
    GameModel(id: 5, title: 'deneme', shortDescription: 'sdg'),
    GameModel(id: 5, title: 'deneme', shortDescription: 'sdg')
  ];
}
