import 'package:movie_memo/src/domain/repositories/movie_repository.dart';

class WatchMovieUseCase {
  final MovieRepository movieRepository;

  WatchMovieUseCase(this.movieRepository);

  Future<void> invoke(int movieId) {
    return movieRepository.watchMovie(movieId);
  }
}
