// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponseDto _$MovieResponseDtoFromJson(Map<String, dynamic> json) =>
    MovieResponseDto(
      json['page'] as int,
      (json['results'] as List<dynamic>)
          .map((e) => MovieDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total_pages'] as int,
      json['total_results'] as int,
    );

Map<String, dynamic> _$MovieResponseDtoToJson(MovieResponseDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
