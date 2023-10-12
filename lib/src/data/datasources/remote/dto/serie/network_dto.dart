import 'package:json_annotation/json_annotation.dart';

part 'network_dto.g.dart';

@JsonSerializable()
class NetworkDto {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "logo_path")
  String? logoPath;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "origin_country")
  String? originCountry;

  NetworkDto({id, logoPath, required this.name, originCountry});

  factory NetworkDto.fromJson(Map<String, dynamic> json) =>
      _$NetworkDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkDtoToJson(this);
}
