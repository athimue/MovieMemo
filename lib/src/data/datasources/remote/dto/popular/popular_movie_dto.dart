import 'package:json_annotation/json_annotation.dart';
import 'package:movie_memo/src/domain/models/popular_movie.dart';

part 'popular_movie_dto.g.dart';

@JsonSerializable()
class PopularMovieDto {
  @JsonKey(name: "adult")
  final bool adult;
  @JsonKey(name: "backdrop_path")
  final String backdropPath;
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "original_language")
  final String originalLanguage;
  @JsonKey(name: "original_title")
  final String originalTitle;
  @JsonKey(name: "overview")
  final String overview;
  @JsonKey(name: "poster_path")
  final String posterPath;
  @JsonKey(name: "media_type")
  final String mediaType;
  @JsonKey(name: "genre_ids")
  final List<int> genreIds;
  @JsonKey(name: "popularity")
  final double popularity;
  @JsonKey(name: "release_date")
  final String releaseDate;
  @JsonKey(name: "video")
  final bool video;
  @JsonKey(name: "vote_average")
  final double voteAverage;
  @JsonKey(name: "vote_count")
  final int voteCount;

  const PopularMovieDto(
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
      this.voteCount);

  factory PopularMovieDto.fromJson(Map<String, dynamic> json) =>
      _$PopularMovieDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMovieDtoToJson(this);

  PopularMovie parsePopularMovieDto() => PopularMovie(
      id: id,
      name: title,
      date: releaseDate,
      originalLanguage: originalLanguage,
      voteAverage: voteAverage,
      overview: overview,
      picturePath: "https://image.tmdb.org/t/p/w92/$posterPath");
}
