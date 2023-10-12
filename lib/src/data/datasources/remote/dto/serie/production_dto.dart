import 'package:json_annotation/json_annotation.dart';

part 'production_dto.g.dart';

@JsonSerializable()
class ProductionDto {
  @JsonKey(name: "iso_3166_1")
  String? iso31661;

  @JsonKey(name: "name")
  String? name;

  ProductionDto({iso31661, name});

  factory ProductionDto.fromJson(Map<String, dynamic> json) =>
      _$ProductionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionDtoToJson(this);
}
