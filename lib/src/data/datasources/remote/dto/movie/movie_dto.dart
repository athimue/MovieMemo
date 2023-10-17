import 'package:json_annotation/json_annotation.dart';
import 'package:movie_memo/src/data/datasources/remote/dto/movie/belongs_to_collection_dto.dart';
import 'package:movie_memo/src/data/datasources/remote/dto/serie/genre_dto.dart';
import 'package:movie_memo/src/data/datasources/remote/dto/serie/language_dto.dart';
import 'package:movie_memo/src/data/datasources/remote/dto/serie/network_dto.dart';
import 'package:movie_memo/src/data/datasources/remote/dto/serie/production_dto.dart';
import 'package:movie_memo/src/domain/models/movie.dart';

part 'movie_dto.g.dart';

@JsonSerializable()
class MovieDto {
  @JsonKey(name: "adult")
  bool? adult;
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  @JsonKey(name: "belongs_to_collection")
  BelongsToCollectionDto? belongsToCollection;
  @JsonKey(name: "budget")
  int? budget;
  @JsonKey(name: "genres")
  List<GenreDto>? genres;
  @JsonKey(name: "homepage")
  String? homepage;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "imdb_id")
  String? imdbId;
  @JsonKey(name: "original_language")
  String? originalLanguage;
  @JsonKey(name: "original_title")
  String? originalTitle;
  @JsonKey(name: "overview")
  String? overview;
  @JsonKey(name: "popularity")
  double? popularity;
  @JsonKey(name: "poster_path")
  String? posterPath;
  @JsonKey(name: "production_companies")
  List<NetworkDto>? productionCompanies;
  @JsonKey(name: "production_countries")
  List<ProductionDto>? productionCountries;
  @JsonKey(name: "release_date")
  String? releaseDate;
  @JsonKey(name: "revenue")
  int? revenue;
  @JsonKey(name: "runtime")
  int? runtime;
  @JsonKey(name: "spoken_languages")
  List<LanguageDto>? spokenLanguages;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "tagline")
  String? tagline;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "video")
  bool? video;
  @JsonKey(name: "vote_average")
  double voteAverage;
  @JsonKey(name: "vote_count")
  int? voteCount;

  MovieDto(
      {this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homepage,
      required this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      required this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      required this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      required this.title,
      this.video,
      required this.voteAverage,
      this.voteCount});

  factory MovieDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDtoToJson(this);

  Movie parseMovieDto() => Movie(
      id: id,
      title: title ?? "",
      releaseDate: releaseDate ?? "",
      note: voteAverage,
      runtime: runtime ?? 0,
      picturePath: posterPath != null
          ? "https://image.tmdb.org/t/p/w92/$posterPath"
          : "");
}
