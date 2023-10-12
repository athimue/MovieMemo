import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_memo/src/data/datasources/local/app_database.dart';
import 'package:movie_memo/src/data/datasources/local/dao/serie_dao.dart';
import 'package:movie_memo/src/data/datasources/local/database_constants.dart';
import 'package:movie_memo/src/data/datasources/remote/api/tdmb_api_service.dart';
import 'package:movie_memo/src/data/repositories/movie_repository_impl.dart';
import 'package:movie_memo/src/data/repositories/serie_repository_impl.dart';
import 'package:movie_memo/src/domain/repositories/movie_repository.dart';
import 'package:movie_memo/src/domain/repositories/serie_repository.dart';
import 'package:movie_memo/src/domain/usecases/add_watched_serie_use_case.dart';
import 'package:movie_memo/src/domain/usecases/get_Watched_series_use_case.dart';
import 'package:movie_memo/src/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movie_memo/src/domain/usecases/get_popular_series_use_case.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  final db = await $FloorAppDatabase.databaseBuilder(databaseName).build();
  locator.registerSingleton<SerieDao>(db.serieDao);

  locator.registerSingleton<TdmbApiService>(
    TdmbApiService(Dio()),
  );

  locator.registerSingleton<SerieRepository>(
    SerieRepositoryImpl(locator<TdmbApiService>(), locator<SerieDao>()),
  );

  locator.registerSingleton<MovieRepository>(
    MovieRepositoryImpl(locator<TdmbApiService>()),
  );

  locator.registerSingleton<GetPopularSeriesUseCase>(
    GetPopularSeriesUseCase(locator<SerieRepository>()),
  );

  locator.registerSingleton<GetPopularMoviesUseCase>(
    GetPopularMoviesUseCase(locator<MovieRepository>()),
  );

  locator.registerSingleton<GetWatchedSeriesUseCase>(
    GetWatchedSeriesUseCase(locator<SerieRepository>()),
  );

  locator.registerSingleton<AddWatchedSerieUseCase>(
    AddWatchedSerieUseCase(locator<SerieRepository>()),
  );
}
