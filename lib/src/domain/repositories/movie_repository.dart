import 'package:movie_memo/src/domain/models/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getPopularMovies();
}
