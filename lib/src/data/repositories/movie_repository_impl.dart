import 'package:movie_memo/src/data/datasources/local/dao/movie_dao.dart';
import 'package:movie_memo/src/data/datasources/local/entity/movie_entity.dart';
import 'package:movie_memo/src/data/datasources/remote/api/tdmb_api_service.dart';
import 'package:movie_memo/src/domain/models/movie.dart';
import 'package:movie_memo/src/domain/models/popular_movie.dart';
import 'package:movie_memo/src/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final TdmbApiService tdmbApiService;
  final MovieDao movieDao;

  MovieRepositoryImpl(this.tdmbApiService, this.movieDao);

  @override
  Future<List<PopularMovie>> getPopularMovies() async {
    try {
      final httpResponse = await tdmbApiService
          .getPopularMovies("9ee736e148e808222f04c1535dc80b64");
      if (httpResponse.results.isNotEmpty) {
        final response = httpResponse.results;
        final List<PopularMovie> result = response
            .map((movieDto) => movieDto.parsePopularMovieDto())
            .toList();
        return result;
      }
      return List.empty();
    } catch (e) {
      print(e);
      throw Error();
    }
  }

  @override
  Future<void> addUnwatchedMovie(int movieId) {
    return movieDao.insertMovie(MovieEntity(id: movieId, isWatched: false));
  }

  @override
  Future<void> addWatchedMovie(int movieId) {
    return movieDao.insertMovie(MovieEntity(id: movieId, isWatched: true));
  }

  @override
  Future<void> deleteUnwatchedMovie(int movieId) {
    return movieDao
        .deleteUnWatchedMovie(MovieEntity(id: movieId, isWatched: false));
  }

  @override
  Future<void> deleteWatchedMovie(int movieId) {
    return movieDao
        .deleteWatchedMovie(MovieEntity(id: movieId, isWatched: true));
  }

  @override
  Future<List<Movie>> getUnwatchedMovies() async {
    final unwatchedMovieEntities = await movieDao.getUnwatchedMovies();
    var unwatchedMovies = <Movie>[];
    for (MovieEntity movieEntity in unwatchedMovieEntities) {
      unwatchedMovies.add((await tdmbApiService.getMovie(
              "9ee736e148e808222f04c1535dc80b64", movieEntity.id.toString()))
          .parseMovieDto());
    }
    return unwatchedMovies;
  }

  @override
  Future<List<Movie>> getWatchedMovies() async {
    final watchedMovieEntities = await movieDao.getWatchedMovies();
    var watchedMovies = <Movie>[];
    for (MovieEntity movieEntity in watchedMovieEntities) {
      watchedMovies.add((await tdmbApiService.getMovie(
              "9ee736e148e808222f04c1535dc80b64", movieEntity.id.toString()))
          .parseMovieDto());
    }
    return watchedMovies;
  }

  @override
  Future<void> watchMovie(int movieId) {
    return movieDao.watchMovie(MovieEntity(id: movieId, isWatched: true));
  }
}
