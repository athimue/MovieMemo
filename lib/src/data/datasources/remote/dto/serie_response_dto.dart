import 'package:movie_memo/src/data/datasources/remote/dto/serie_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'serie_response_dto.g.dart';

@JsonSerializable()
class SerieResponseDto {
  final int page;
  final List<SerieDto> results;
  @JsonKey(name: "total_pages")
  final int totalPages;
  @JsonKey(name: "total_results")
  final int totalResults;

  SerieResponseDto(this.page, this.results, this.totalPages, this.totalResults);

  factory SerieResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SerieResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SerieResponseDtoToJson(this);
}
