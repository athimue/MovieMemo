import 'package:json_annotation/json_annotation.dart';
import 'package:movie_memo/src/domain/models/movie.dart';

part 'movie_dto.g.dart';

@JsonSerializable()
class MovieDto {
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

  const MovieDto(
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

  factory MovieDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDtoToJson(this);

  Movie parseMovieDto() => Movie(
      id: id,
      name: title,
      date: releaseDate,
      originalLanguage: originalLanguage,
      popularity: popularity,
      overview: overview,
      picturePath: "https://image.tmdb.org/t/p/w92/$posterPath");
}
