import 'package:movie_memo/src/domain/repositories/movie_repository.dart';

class AddUnwatchedMovieUseCase {
  final MovieRepository movieRepository;

  AddUnwatchedMovieUseCase(this.movieRepository);

  Future<void> invoke(int serieId) {
    return movieRepository.addUnwatchedMovie(serieId);
  }
}
