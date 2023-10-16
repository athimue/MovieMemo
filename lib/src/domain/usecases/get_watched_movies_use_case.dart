import 'package:movie_memo/src/domain/models/movie.dart';
import 'package:movie_memo/src/domain/repositories/movie_repository.dart';

class GetWatchedMoviesUseCase {
  final MovieRepository movieRepository;

  GetWatchedMoviesUseCase(this.movieRepository);

  Future<List<Movie>> invoke() {
    return movieRepository.getWatchedMovies();
  }
}
