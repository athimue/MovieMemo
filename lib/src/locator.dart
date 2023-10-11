import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_memo/src/data/datasources/remote/api/tdmb_api_service.dart';
import 'package:movie_memo/src/data/repositories/serie_repository_impl.dart';
import 'package:movie_memo/src/domain/repositories/serie_repository.dart';
import 'package:movie_memo/src/domain/usecases/get_popular_series_use_case.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  //final db = await $FloorAppDatabase.databaseBuilder(databaseName).build();
  //locator.registerSingleton<AppDatabase>(db);

  locator.registerSingleton<TdmbApiService>(
    TdmbApiService(Dio()),
  );

  locator.registerSingleton<SerieRepository>(
    SerieRepositoryImpl(locator<TdmbApiService>()),
  );

  locator.registerSingleton<GetPopularSeriesUseCase>(
    GetPopularSeriesUseCase(locator<SerieRepository>()),
  );

  //locator.registerSingleton<DatabaseRepository>(
  //  DatabaseRepositoryImpl(locator<AppDatabase>()),
  //);
}
