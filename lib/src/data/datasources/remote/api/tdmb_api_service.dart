import 'package:dio/dio.dart';
import 'package:movie_memo/src/data/datasources/remote/dto/popular/popular_movie_response_dto.dart';
import 'package:movie_memo/src/data/datasources/remote/dto/popular/popular_serie_response_dto.dart';
import 'package:movie_memo/src/data/datasources/remote/dto/search/search_result_response_dto.dart';
import 'package:movie_memo/src/data/datasources/remote/dto/serie/serie_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'tdmb_api_service.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class TdmbApiService {
  factory TdmbApiService(Dio dio, {String baseUrl}) = _TdmbApiService;

  @GET('trending/tv/week')
  Future<PopularSerieResponseDto> getPopularSeries(
      @Query("api_key") String apiKey);

  @GET('trending/movie/week')
  Future<PopularMovieResponseDto> getPopularMovies(
      @Query("api_key") String apiKey);

  @GET('tv/{id}')
  Future<SerieDto> getSerie(@Query("api_key") String apiKey, @Path() String id);

  @GET('movie/{id}')
  Future<PopularMovieResponseDto> getMovie(
      @Query("api_key") String apiKey, @Path() String id);

  @GET('search/multi')
  Future<SearchResultResponseDto> getSearchResult(
      @Query("api_key") String apiKey, @Query("query") String query);
}
