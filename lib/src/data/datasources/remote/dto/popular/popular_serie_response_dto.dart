import 'package:movie_memo/src/data/datasources/remote/dto/popular/popular_serie_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'popular_serie_response_dto.g.dart';

@JsonSerializable()
class PopularSerieResponseDto {
  final int page;
  final List<PopularSerieDto> results;
  @JsonKey(name: "total_pages")
  final int totalPages;
  @JsonKey(name: "total_results")
  final int totalResults;

  PopularSerieResponseDto(
      this.page, this.results, this.totalPages, this.totalResults);

  factory PopularSerieResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PopularSerieResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PopularSerieResponseDtoToJson(this);
}
