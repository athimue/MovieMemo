// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultDto _$SearchResultDtoFromJson(Map<String, dynamic> json) =>
    SearchResultDto(
      json['adult'] as bool?,
      json['backdrop_path'] as String?,
      json['id'] as int,
      json['title'] as String?,
      json['original_language'] as String,
      json['original_title'] as String?,
      json['overview'] as String,
      json['poster_path'] as String?,
      json['media_type'] as String,
      (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      (json['popularity'] as num).toDouble(),
      json['release_date'] as String?,
      json['video'] as bool?,
      (json['vote_average'] as num?)?.toDouble(),
      json['vote_count'] as int?,
      json['name'] as String?,
      json['original_name'] as String?,
      json['first_air_date'] as String?,
      (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SearchResultDtoToJson(SearchResultDto instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'title': instance.title,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'media_type': instance.mediaType,
      'genre_ids': instance.genreIds,
      'popularity': instance.popularity,
      'release_date': instance.releaseDate,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'name': instance.name,
      'original_name': instance.originalName,
      'first_air_date': instance.firstAirDate,
      'origin_country': instance.originCountry,
    };
