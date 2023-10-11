import 'package:json_annotation/json_annotation.dart';

part 'language_dto.g.dart';

@JsonSerializable()
class LanguageDto {
  @JsonKey(name: "english_name")
  String? englishName;
  @JsonKey(name: "iso_639_1")
  String? iso6391;
  @JsonKey(name: "name")
  String? name;

  LanguageDto({this.englishName, this.iso6391, this.name});

  factory LanguageDto.fromJson(Map<String, dynamic> json) =>
      _$LanguageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageDtoToJson(this);
}
