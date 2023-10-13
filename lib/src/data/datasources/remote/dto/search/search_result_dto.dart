import 'package:json_annotation/json_annotation.dart';
import 'package:movie_memo/src/domain/models/search_result.dart';

part 'search_result_dto.g.dart';

@JsonSerializable()
class SearchResultDto {
  @JsonKey(name: "adult")
  final bool? adult;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "original_language")
  final String originalLanguage;
  @JsonKey(name: "original_title")
  final String? originalTitle;
  @JsonKey(name: "overview")
  final String overview;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "media_type")
  final String mediaType;
  @JsonKey(name: "genre_ids")
  final List<int>? genreIds;
  @JsonKey(name: "popularity")
  final double popularity;
  @JsonKey(name: "release_date")
  final String? releaseDate;
  @JsonKey(name: "video")
  final bool? video;
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  @JsonKey(name: "vote_count")
  final int? voteCount;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "original_name")
  final String? originalName;
  @JsonKey(name: "first_air_date")
  final String? firstAirDate;
  @JsonKey(name: "origin_country")
  final List<String>? originCountry;

  const SearchResultDto(
      this.adult,
      this.backdropPath,
      this.id,
      this.title,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.mediaType,
      this.genreIds,
      this.popularity,
      this.releaseDate,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.name,
      this.originalName,
      this.firstAirDate,
      this.originCountry);

  factory SearchResultDto.fromJson(Map<String, dynamic> json) =>
      _$SearchResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultDtoToJson(this);

  SearchResult parsePopularMovieDto() => SearchResult(
      id: id,
      name: title ?? name ?? "",
      date: releaseDate ?? firstAirDate ?? "",
      originalLanguage: originalLanguage,
      popularity: popularity,
      overview: overview,
      picturePath: posterPath != null
          ? "https://image.tmdb.org/t/p/w92/$posterPath"
          : "",
      mediaType: mediaType);
}
