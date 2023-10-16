import 'package:movie_memo/src/domain/repositories/movie_repository.dart';

class AddWatchedMovieUseCase {
  final MovieRepository movieRepository;

  AddWatchedMovieUseCase(this.movieRepository);

  Future<void> invoke(int serieId) {
    return movieRepository.addWatchedMovie(serieId);
  }
}
