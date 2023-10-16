import 'package:movie_memo/src/domain/repositories/movie_repository.dart';

class DeleteWatchedMovieUseCase {
  final MovieRepository movieRepository;

  DeleteWatchedMovieUseCase(this.movieRepository);

  Future<void> invoke(int movieId) {
    return movieRepository.deleteWatchedMovie(movieId);
  }
}
