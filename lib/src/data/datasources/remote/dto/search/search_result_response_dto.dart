import 'package:json_annotation/json_annotation.dart';
import 'package:movie_memo/src/data/datasources/remote/dto/search/search_result_dto.dart';

part 'search_result_response_dto.g.dart';

@JsonSerializable()
class SearchResultResponseDto {
  final int page;
  final List<SearchResultDto> results;
  @JsonKey(name: "total_pages")
  final int totalPages;
  @JsonKey(name: "total_results")
  final int totalResults;

  SearchResultResponseDto(
      this.page, this.results, this.totalPages, this.totalResults);

  factory SearchResultResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SearchResultResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultResponseDtoToJson(this);
}
