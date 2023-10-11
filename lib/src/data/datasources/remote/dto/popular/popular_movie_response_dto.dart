import 'package:json_annotation/json_annotation.dart';
import 'package:movie_memo/src/data/datasources/remote/dto/popular/popular_movie_dto.dart';

part 'popular_movie_response_dto.g.dart';

@JsonSerializable()
class PopularMovieResponseDto {
  final int page;
  final List<PopularMovieDto> results;
  @JsonKey(name: "total_pages")
  final int totalPages;
  @JsonKey(name: "total_results")
  final int totalResults;

  PopularMovieResponseDto(
      this.page, this.results, this.totalPages, this.totalResults);

  factory PopularMovieResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PopularMovieResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMovieResponseDtoToJson(this);
}
