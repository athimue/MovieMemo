import 'package:movie_memo/src/domain/models/movie.dart';
import 'package:movie_memo/src/domain/repositories/movie_repository.dart';

class GetUnwatchedMoviesUseCase {
  final MovieRepository movieRepository;

  GetUnwatchedMoviesUseCase(this.movieRepository);

  Future<List<Movie>> invoke() {
    return movieRepository.getUnwatchedMovies();
  }
}
