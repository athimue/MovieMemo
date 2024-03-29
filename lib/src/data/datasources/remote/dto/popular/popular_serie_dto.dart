import 'package:json_annotation/json_annotation.dart';
import 'package:movie_memo/src/domain/models/popular_serie.dart';

part 'popular_serie_dto.g.dart';

@JsonSerializable()
class PopularSerieDto {
  @JsonKey(name: "adult")
  final bool adult;
  @JsonKey(name: "backdrop_path")
  final String backdropPath;
  @JsonKey(name: "first_air_date")
  final String firstAirDate;
  @JsonKey(name: "genre_ids")
  final List<int> genreIds;
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "origin_country")
  final List<String> originCountry;
  @JsonKey(name: "original_language")
  final String originalLanguage;
  @JsonKey(name: "original_name")
  final String originalName;
  @JsonKey(name: "overview")
  final String overview;
  @JsonKey(name: "popularity")
  final double popularity;
  @JsonKey(name: "poster_path")
  final String posterPath;
  @JsonKey(name: "media_type")
  final String mediaType;
  @JsonKey(name: "vote_average")
  final double voteAverage;
  @JsonKey(name: "vote_count")
  final int voteCount;

  const PopularSerieDto(
      this.adult,
      this.backdropPath,
      this.firstAirDate,
      this.genreIds,
      this.id,
      this.name,
      this.originCountry,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.mediaType,
      this.voteAverage,
      this.voteCount);

  factory PopularSerieDto.fromJson(Map<String, dynamic> json) =>
      _$PopularSerieDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PopularSerieDtoToJson(this);

  PopularSerie parsePopularSerieDto() => PopularSerie(
      id: id,
      name: name,
      date: firstAirDate,
      country: originCountry.first,
      note: voteAverage,
      overview: overview,
      picturePath: "https://image.tmdb.org/t/p/w92/$posterPath");
}
