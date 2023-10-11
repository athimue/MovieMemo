// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkDto _$NetworkDtoFromJson(Map<String, dynamic> json) => NetworkDto(
      id: json['id'],
      logoPath: json['logo_path'],
      name: json['name'],
      originCountry: json['origin_country'],
    );

Map<String, dynamic> _$NetworkDtoToJson(NetworkDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logoPath,
      'name': instance.name,
      'origin_country': instance.originCountry,
    };
