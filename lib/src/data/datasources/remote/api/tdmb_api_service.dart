import 'package:dio/dio.dart';
import 'package:movie_memo/src/data/datasources/remote/dto/movie_response_dto.dart';
import 'package:movie_memo/src/data/datasources/remote/dto/serie_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'tdmb_api_service.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class TdmbApiService {
  factory TdmbApiService(Dio dio, {String baseUrl}) = _TdmbApiService;

  @GET('trending/tv/week')
  Future<SerieResponseDto> getPopularSeries(@Query("api_key") String apiKey);

  @GET('trending/movie/week')
  Future<MovieResponseDto> getPopularMovies(@Query("api_key") String apiKey);
}
