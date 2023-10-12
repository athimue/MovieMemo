import 'package:json_annotation/json_annotation.dart';
import 'package:movie_memo/src/data/datasources/remote/dto/serie/author_dto.dart';
import 'package:movie_memo/src/data/datasources/remote/dto/serie/episode_dto.dart';
import 'package:movie_memo/src/data/datasources/remote/dto/serie/genre_dto.dart';
import 'package:movie_memo/src/data/datasources/remote/dto/serie/language_dto.dart';
import 'package:movie_memo/src/data/datasources/remote/dto/serie/network_dto.dart';
import 'package:movie_memo/src/data/datasources/remote/dto/serie/production_dto.dart';
import 'package:movie_memo/src/data/datasources/remote/dto/serie/season_dto.dart';
import 'package:movie_memo/src/domain/models/serie.dart';

part 'serie_dto.g.dart';

@JsonSerializable()
class SerieDto {
  @JsonKey(name: "adult")
  bool? adult;
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  @JsonKey(name: "created_by")
  List<AuthorDto> createdBy;
  @JsonKey(name: "episode_run_time")
  List<int>? episodeRunTime;
  @JsonKey(name: "first_air_date")
  String firstAirDate;
  @JsonKey(name: "genres")
  List<GenreDto>? genres;
  @JsonKey(name: "homepage")
  String? homepage;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "in_production")
  bool? inProduction;
  @JsonKey(name: "languages")
  List<String>? languages;
  @JsonKey(name: "last_air_date")
  String? lastAirDate;
  @JsonKey(name: "last_episode_to_air")
  EpisodeDto? lastEpisodeToAir;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "next_episode_to_air")
  EpisodeDto? nextEpisodeToAir;
  @JsonKey(name: "networks")
  List<NetworkDto> networks;
  @JsonKey(name: "number_of_episodes")
  int numberOfEpisodes;
  @JsonKey(name: "number_of_seasons")
  int numberOfSeasons;
  @JsonKey(name: "origin_country")
  List<String> originCountry;
  @JsonKey(name: "original_language")
  String? originalLanguage;
  @JsonKey(name: "original_name")
  String? originalName;
  @JsonKey(name: "overview")
  String overview;
  @JsonKey(name: "popularity")
  double? popularity;
  @JsonKey(name: "poster_path")
  String? posterPath;
  @JsonKey(name: "production_companies")
  List<NetworkDto>? productionCompanies;
  @JsonKey(name: "production_countries")
  List<ProductionDto>? productionCountries;
  @JsonKey(name: "seasons")
  List<SeasonDto>? seasons;
  @JsonKey(name: "spoken_languages")
  List<LanguageDto>? spokenLanguages;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "tagline")
  String? tagline;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "vote_average")
  double voteAverage;
  @JsonKey(name: "vote_count")
  int? voteCount;

  SerieDto(
      {this.adult,
      this.backdropPath,
      required this.createdBy,
      this.episodeRunTime,
      required this.firstAirDate,
      this.genres,
      this.homepage,
      required this.id,
      this.inProduction,
      this.languages,
      this.lastAirDate,
      this.lastEpisodeToAir,
      required this.name,
      this.nextEpisodeToAir,
      required this.networks,
      required this.numberOfEpisodes,
      required this.numberOfSeasons,
      required this.originCountry,
      this.originalLanguage,
      this.originalName,
      required this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.seasons,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.type,
      required this.voteAverage,
      this.voteCount});

  factory SerieDto.fromJson(Map<String, dynamic> json) =>
      _$SerieDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SerieDtoToJson(this);

  Serie parseSerieDto() => Serie(
      id: id,
      name: name,
      date: firstAirDate,
      author: createdBy.map((e) => e.name).toList(),
      country: originCountry.first,
      networks: networks.map((e) => e.name).toList(),
      numberOfEpisodes: numberOfEpisodes,
      numberOfSeasons: numberOfSeasons,
      note: voteAverage,
      picturePath: "https://image.tmdb.org/t/p/w92/$posterPath");
}
