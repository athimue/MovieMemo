// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serie_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerieResponseDto _$SerieResponseDtoFromJson(Map<String, dynamic> json) =>
    SerieResponseDto(
      json['page'] as int,
      (json['results'] as List<dynamic>)
          .map((e) => SerieDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total_pages'] as int,
      json['total_results'] as int,
    );

Map<String, dynamic> _$SerieResponseDtoToJson(SerieResponseDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
