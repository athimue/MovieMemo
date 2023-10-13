// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultResponseDto _$SearchResultResponseDtoFromJson(
        Map<String, dynamic> json) =>
    SearchResultResponseDto(
      json['page'] as int,
      (json['results'] as List<dynamic>)
          .map((e) => SearchResultDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total_pages'] as int,
      json['total_results'] as int,
    );

Map<String, dynamic> _$SearchResultResponseDtoToJson(
        SearchResultResponseDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
