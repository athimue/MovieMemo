import 'package:movie_memo/src/data/datasources/remote/api/tdmb_api_service.dart';
import 'package:movie_memo/src/domain/models/movie.dart';
import 'package:movie_memo/src/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final TdmbApiService tdmbApiService;

  MovieRepositoryImpl(this.tdmbApiService);

  @override
  Future<List<Movie>> getPopularMovies() async {
    try {
      final httpResponse = await tdmbApiService
          .getPopularMovies("9ee736e148e808222f04c1535dc80b64");
      if (httpResponse.results.isNotEmpty) {
        final response = httpResponse.results;
        final List<Movie> result = response
            .map((movieDto) => movieDto.parsePopularMovieDto())
            .toList();
        return result;
      }
      return List.empty();
    } catch (e) {
      print(e);
      throw Error();
    }
  }
}
