// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movie_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMovieResponseDto _$PopularMovieResponseDtoFromJson(
        Map<String, dynamic> json) =>
    PopularMovieResponseDto(
      json['page'] as int,
      (json['results'] as List<dynamic>)
          .map((e) => PopularMovieDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total_pages'] as int,
      json['total_results'] as int,
    );

Map<String, dynamic> _$PopularMovieResponseDtoToJson(
        PopularMovieResponseDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
