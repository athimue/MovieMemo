import 'package:json_annotation/json_annotation.dart';

part 'episode_dto.g.dart';

@JsonSerializable()
class EpisodeDto {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "overview")
  String? overview;
  @JsonKey(name: "vote_average")
  double? voteAverage;
  @JsonKey(name: "vote_count")
  int? voteCount;
  @JsonKey(name: "air_date")
  String? airDate;
  @JsonKey(name: "episode_number")
  int? episodeNumber;
  @JsonKey(name: "episode_type")
  String? episodeType;
  @JsonKey(name: "production_code")
  String? productionCode;
  @JsonKey(name: "runtime")
  int? runtime;
  @JsonKey(name: "season_number")
  int? seasonNumber;
  @JsonKey(name: "show_id")
  int? showId;
  @JsonKey(name: "still_path")
  String? stillPath;

  EpisodeDto(
      {id,
      name,
      overview,
      voteAverage,
      voteCount,
      airDate,
      episodeNumber,
      episodeType,
      productionCode,
      runtime,
      seasonNumber,
      showId,
      stillPath});

  factory EpisodeDto.fromJson(Map<String, dynamic> json) =>
      _$EpisodeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeDtoToJson(this);
}
