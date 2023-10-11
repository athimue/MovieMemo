import 'package:movie_memo/src/domain/models/movie.dart';
import 'package:movie_memo/src/domain/repositories/movie_repository.dart';

class GetPopularMoviesUseCase {
  final MovieRepository movieRepository;
  GetPopularMoviesUseCase(this.movieRepository);
  Future<List<Movie>> invoke() {
    return movieRepository.getPopularMovies();
  }
}
