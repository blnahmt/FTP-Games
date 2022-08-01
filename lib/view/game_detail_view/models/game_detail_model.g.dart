// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameDetailModel _$GameDetailModelFromJson(Map<String, dynamic> json) =>
    GameDetailModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      thumbnail: json['thumbnail'] as String?,
      status: json['status'] as String?,
      shortDescription: json['short_description'] as String?,
      description: json['description'] as String?,
      gameUrl: json['game_url'] as String?,
      genre: json['genre'] as String?,
      platform: _platformToJson(json['platform'] as String),
      publisher: json['publisher'] as String?,
      developer: json['developer'] as String?,
      releaseDate: json['release_date'] as String?,
      freetogameProfileUrl: json['freetogame_profile_url'] as String?,
      minimumSystemRequirements: json['minimum_system_requirements'] == null
          ? null
          : MinimumSystemRequirements.fromJson(
              json['minimum_system_requirements'] as Map<String, dynamic>),
      screenshots: (json['screenshots'] as List<dynamic>?)
          ?.map((e) => Screenshots.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

MinimumSystemRequirements _$MinimumSystemRequirementsFromJson(
        Map<String, dynamic> json) =>
    MinimumSystemRequirements(
      os: json['os'] as String?,
      processor: json['processor'] as String?,
      memory: json['memory'] as String?,
      graphics: json['graphics'] as String?,
      storage: json['storage'] as String?,
    );

Screenshots _$ScreenshotsFromJson(Map<String, dynamic> json) => Screenshots(
      id: json['id'] as int?,
      image: json['image'] as String?,
    );
