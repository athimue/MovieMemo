import 'package:movie_memo/src/domain/models/movie.dart';
import 'package:movie_memo/src/domain/models/popular_movie.dart';

abstract class MovieRepository {
  Future<List<PopularMovie>> getPopularMovies();

  Future<List<Movie>> getUnwatchedMovies();

  Future<List<Movie>> getWatchedMovies();

  Future<void> addWatchedMovie(int movieId);

  Future<void> deleteWatchedMovie(int movieId);

  Future<void> addUnwatchedMovie(int movieId);

  Future<void> deleteUnwatchedMovie(int movieId);

  Future<void> watchMovie(int movieId);
}
