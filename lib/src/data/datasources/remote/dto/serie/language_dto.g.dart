// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageDto _$LanguageDtoFromJson(Map<String, dynamic> json) => LanguageDto(
      englishName: json['english_name'] as String?,
      iso6391: json['iso_639_1'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$LanguageDtoToJson(LanguageDto instance) =>
    <String, dynamic>{
      'english_name': instance.englishName,
      'iso_639_1': instance.iso6391,
      'name': instance.name,
    };
