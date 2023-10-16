import 'package:movie_memo/src/domain/repositories/movie_repository.dart';

class DeleteUnwatchedMovieUseCase {
  final MovieRepository movieRepository;

  DeleteUnwatchedMovieUseCase(this.movieRepository);

  Future<void> invoke(int movieId) {
    return movieRepository.deleteUnwatchedMovie(movieId);
  }
}
