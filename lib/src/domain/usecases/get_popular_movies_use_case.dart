import 'package:movie_memo/src/domain/models/popular_movie.dart';
import 'package:movie_memo/src/domain/repositories/movie_repository.dart';

class GetPopularMoviesUseCase {
  final MovieRepository movieRepository;

  GetPopularMoviesUseCase(this.movieRepository);

  Future<List<PopularMovie>> invoke() {
    return movieRepository.getPopularMovies();
  }
}
