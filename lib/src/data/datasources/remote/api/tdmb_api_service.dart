import 'package:dio/dio.dart';
import 'package:movie_memo/src/data/datasources/remote/dto/serie_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'tdmb_api_service.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class TdmbApiService {
  factory TdmbApiService(Dio dio, {String baseUrl}) = _TdmbApiService;

  @GET('discover/tv')
  Future<SerieResponseDto> getSeries(@Query("api_key") String apiKey);
}
