import 'package:json_annotation/json_annotation.dart';

part 'season_dto.g.dart';

@JsonSerializable()
class SeasonDto {
  @JsonKey(name: "air_date")
  String? airDate;
  @JsonKey(name: "episode_count")
  int? episodeCount;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "overview")
  String? overview;
  @JsonKey(name: "poster_path")
  String? posterPath;
  @JsonKey(name: "season_number")
  int? seasonNumber;
  @JsonKey(name: "vote_average")
  double? voteAverage;

  SeasonDto(
      {airDate,
      episodeCount,
      id,
      name,
      overview,
      posterPath,
      seasonNumber,
      voteAverage});

  factory SeasonDto.fromJson(Map<String, dynamic> json) =>
      _$SeasonDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonDtoToJson(this);
}
