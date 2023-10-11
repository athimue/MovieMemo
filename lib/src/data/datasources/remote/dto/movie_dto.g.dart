// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDto _$MovieDtoFromJson(Map<String, dynamic> json) => MovieDto(
      json['adult'] as bool,
      json['backdrop_path'] as String,
      json['id'] as int,
      json['title'] as String,
      json['original_language'] as String,
      json['original_title'] as String,
      json['overview'] as String,
      json['poster_path'] as String,
      json['media_type'] as String,
      (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      (json['popularity'] as num).toDouble(),
      json['release_date'] as String,
      json['video'] as bool,
      (json['vote_average'] as num).toDouble(),
      json['vote_count'] as int,
    );

Map<String, dynamic> _$MovieDtoToJson(MovieDto instance) => <String, dynamic>{
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
    };
