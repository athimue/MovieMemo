import 'package:json_annotation/json_annotation.dart';

part 'author_dto.g.dart';

@JsonSerializable()
class AuthorDto {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "credit_id")
  String? creditId;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "gender")
  int? gender;
  @JsonKey(name: "profile_path")
  String? profilePath;

  AuthorDto({this.id, this.creditId, this.name, this.gender, this.profilePath});

  factory AuthorDto.fromJson(Map<String, dynamic> json) =>
      _$AuthorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorDtoToJson(this);
}
