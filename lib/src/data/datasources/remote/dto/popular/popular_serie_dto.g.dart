// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_serie_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularSerieDto _$PopularSerieDtoFromJson(Map<String, dynamic> json) =>
    PopularSerieDto(
      json['adult'] as bool,
      json['backdrop_path'] as String,
      json['first_air_date'] as String,
      (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      json['id'] as int,
      json['name'] as String,
      (json['origin_country'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      json['original_language'] as String,
      json['original_name'] as String,
      json['overview'] as String,
      (json['popularity'] as num).toDouble(),
      json['poster_path'] as String,
      json['media_type'] as String,
      (json['vote_average'] as num).toDouble(),
      json['vote_count'] as int,
    );

Map<String, dynamic> _$PopularSerieDtoToJson(PopularSerieDto instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'first_air_date': instance.firstAirDate,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'name': instance.name,
      'origin_country': instance.originCountry,
      'original_language': instance.originalLanguage,
      'original_name': instance.originalName,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'media_type': instance.mediaType,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
