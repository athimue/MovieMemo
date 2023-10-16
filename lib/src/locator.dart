import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_memo/src/data/datasources/local/app_database.dart';
import 'package:movie_memo/src/data/datasources/local/dao/movie_dao.dart';
import 'package:movie_memo/src/data/datasources/local/dao/serie_dao.dart';
import 'package:movie_memo/src/data/datasources/local/database_constants.dart';
import 'package:movie_memo/src/data/datasources/remote/api/tdmb_api_service.dart';
import 'package:movie_memo/src/data/repositories/movie_repository_impl.dart';
import 'package:movie_memo/src/data/repositories/search_repository_impl.dart';
import 'package:movie_memo/src/data/repositories/serie_repository_impl.dart';
import 'package:movie_memo/src/domain/repositories/movie_repository.dart';
import 'package:movie_memo/src/domain/repositories/search_repository.dart';
import 'package:movie_memo/src/domain/repositories/serie_repository.dart';
import 'package:movie_memo/src/domain/usecases/add_unwatched_movie_use_case.dart';
import 'package:movie_memo/src/domain/usecases/add_unwatched_serie_use_case.dart';
import 'package:movie_memo/src/domain/usecases/add_watched_movie_use_case.dart';
import 'package:movie_memo/src/domain/usecases/add_watched_serie_use_case.dart';
import 'package:movie_memo/src/domain/usecases/delete_unwatched_movie_use_case.dart';
import 'package:movie_memo/src/domain/usecases/delete_unwatched_serie_use_case.dart';
import 'package:movie_memo/src/domain/usecases/delete_watched_movie_use_case.dart';
import 'package:movie_memo/src/domain/usecases/delete_watched_serie_use_case.dart';
import 'package:movie_memo/src/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movie_memo/src/domain/usecases/get_popular_series_use_case.dart';
import 'package:movie_memo/src/domain/usecases/get_search_use_case.dart';
import 'package:movie_memo/src/domain/usecases/get_unwatched_movies_use_case.dart';
import 'package:movie_memo/src/domain/usecases/get_unwatched_series_use_case.dart';
import 'package:movie_memo/src/domain/usecases/get_watched_movies_use_case.dart';
import 'package:movie_memo/src/domain/usecases/watched_series_use_case.dart';
import 'package:movie_memo/src/domain/usecases/watch_movie_use_case.dart';
import 'package:movie_memo/src/domain/usecases/watch_serie_use_case.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  final db = await $FloorAppDatabase.databaseBuilder(databaseName).build();
  locator.registerSingleton<SerieDao>(db.serieDao);
  locator.registerSingleton<MovieDao>(db.movieDao);

  locator.registerSingleton<TdmbApiService>(
    TdmbApiService(Dio()),
  );

  // REPOSITORIES
  locator.registerSingleton<SerieRepository>(
    SerieRepositoryImpl(locator<TdmbApiService>(), locator<SerieDao>()),
  );

  locator.registerSingleton<MovieRepository>(
    MovieRepositoryImpl(locator<TdmbApiService>(), locator<MovieDao>()),
  );

  locator.registerSingleton<SearchRepository>(
    SearchRepositoryImpl(locator<TdmbApiService>()),
  );

  // USECASES

  locator.registerSingleton<GetPopularSeriesUseCase>(
    GetPopularSeriesUseCase(locator<SerieRepository>()),
  );

  locator.registerSingleton<GetPopularMoviesUseCase>(
    GetPopularMoviesUseCase(locator<MovieRepository>()),
  );

  locator.registerSingleton<GetSearchUseCase>(
    GetSearchUseCase(locator<SearchRepository>()),
  );

  // SERIES

  locator.registerSingleton<GetWatchedSeriesUseCase>(
    GetWatchedSeriesUseCase(locator<SerieRepository>()),
  );

  locator.registerSingleton<GetUnwatchedSeriesUseCase>(
    GetUnwatchedSeriesUseCase(locator<SerieRepository>()),
  );

  locator.registerSingleton<AddWatchedSerieUseCase>(
    AddWatchedSerieUseCase(locator<SerieRepository>()),
  );

  locator.registerSingleton<DeleteWatchedSerieUseCase>(
    DeleteWatchedSerieUseCase(locator<SerieRepository>()),
  );

  locator.registerSingleton<AddUnwatchedSerieUseCase>(
    AddUnwatchedSerieUseCase(locator<SerieRepository>()),
  );

  locator.registerSingleton<DeleteUnwatchedSerieUseCase>(
    DeleteUnwatchedSerieUseCase(locator<SerieRepository>()),
  );

  locator.registerSingleton<WatchSerieUseCase>(
    WatchSerieUseCase(locator<SerieRepository>()),
  );

  // MOVIE

  locator.registerSingleton<GetWatchedMoviesUseCase>(
    GetWatchedMoviesUseCase(locator<MovieRepository>()),
  );

  locator.registerSingleton<GetUnwatchedMoviesUseCase>(
    GetUnwatchedMoviesUseCase(locator<MovieRepository>()),
  );

  locator.registerSingleton<AddUnwatchedMovieUseCase>(
    AddUnwatchedMovieUseCase(locator<MovieRepository>()),
  );

  locator.registerSingleton<AddWatchedMovieUseCase>(
    AddWatchedMovieUseCase(locator<MovieRepository>()),
  );

  locator.registerSingleton<DeleteUnwatchedMovieUseCase>(
    DeleteUnwatchedMovieUseCase(locator<MovieRepository>()),
  );

  locator.registerSingleton<DeleteWatchedMovieUseCase>(
    DeleteWatchedMovieUseCase(locator<MovieRepository>()),
  );

  locator.registerSingleton<WatchMovieUseCase>(
    WatchMovieUseCase(locator<MovieRepository>()),
  );
}
