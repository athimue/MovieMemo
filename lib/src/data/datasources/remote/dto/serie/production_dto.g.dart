// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionDto _$ProductionDtoFromJson(Map<String, dynamic> json) =>
    ProductionDto(
      iso31661: json['iso_3166_1'],
      name: json['name'],
    );

Map<String, dynamic> _$ProductionDtoToJson(ProductionDto instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
    };
