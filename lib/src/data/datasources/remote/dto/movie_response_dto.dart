import 'package:movie_memo/src/data/datasources/remote/dto/movie_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_response_dto.g.dart';

@JsonSerializable()
class MovieResponseDto {
  final int page;
  final List<MovieDto> results;
  @JsonKey(name: "total_pages")
  final int totalPages;
  @JsonKey(name: "total_results")
  final int totalResults;

  MovieResponseDto(this.page, this.results, this.totalPages, this.totalResults);

  factory MovieResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseDtoToJson(this);
}
