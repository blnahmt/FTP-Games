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
      shortDescription: json['shortDescription'] as String?,
      description: json['description'] as String?,
      gameUrl: json['gameUrl'] as String?,
      genre: json['genre'] as String?,
      platform: json['platform'] as String?,
      publisher: json['publisher'] as String?,
      developer: json['developer'] as String?,
      releaseDate: json['releaseDate'] as String?,
      freetogameProfileUrl: json['freetogameProfileUrl'] as String?,
      minimumSystemRequirements: json['minimumSystemRequirements'] == null
          ? null
          : MinimumSystemRequirements.fromJson(
              json['minimumSystemRequirements'] as Map<String, dynamic>),
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
