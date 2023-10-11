// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_serie_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularSerieResponseDto _$PopularSerieResponseDtoFromJson(
        Map<String, dynamic> json) =>
    PopularSerieResponseDto(
      json['page'] as int,
      (json['results'] as List<dynamic>)
          .map((e) => PopularSerieDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total_pages'] as int,
      json['total_results'] as int,
    );

Map<String, dynamic> _$PopularSerieResponseDtoToJson(
        PopularSerieResponseDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
