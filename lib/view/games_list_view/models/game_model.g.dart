// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) => GameModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      thumbnail: json['thumbnail'] as String?,
      shortDescription: json['short_description'] as String?,
      gameUrl: json['game_url'] as String?,
      genre: json['genre'] as String?,
      platform: _platformToJson(json['platform'] as String),
      publisher: json['publisher'] as String?,
      developer: json['developer'] as String?,
      releaseDate: json['release_date'] as String?,
      freetogameProfileUrl: json['freetogame_profile_url'] as String?,
    );
