import 'package:movie_memo/src/data/datasources/local/dao/serie_dao.dart';
import 'package:movie_memo/src/data/datasources/local/entity/serie_entity.dart';
import 'package:movie_memo/src/data/datasources/remote/api/tdmb_api_service.dart';
import 'package:movie_memo/src/domain/models/popular_serie.dart';
import 'package:movie_memo/src/domain/models/serie.dart';
import 'package:movie_memo/src/domain/repositories/serie_repository.dart';

class SerieRepositoryImpl implements SerieRepository {
  final TdmbApiService tdmbApiService;
  final SerieDao serieDao;

  SerieRepositoryImpl(this.tdmbApiService, this.serieDao);

  @override
  Future<List<PopularSerie>> getPopularSeries() async {
    try {
      final response = await tdmbApiService
          .getPopularSeries("9ee736e148e808222f04c1535dc80b64");
      if (response.results.isNotEmpty) {
        final List<PopularSerie> result = response.results
            .map((serieDto) => serieDto.parsePopularSerieDto())
            .toList();
        return result;
      }
      return List.empty();
    } catch (e) {
      throw Error();
    }
  }

  @override
  Future<List<Serie>> getWatchedSeries() async {
    final watchedSerieEntities = await serieDao.getWatchedSeries();
    var watchedSeries = <Serie>[];
    for (SerieEntity serieEntity in watchedSerieEntities) {
      watchedSeries.add((await tdmbApiService.getSerie(
              "9ee736e148e808222f04c1535dc80b64", serieEntity.id.toString()))
          .parseSerieDto());
    }
    return watchedSeries;
  }

  @override
  Future<List<Serie>> getUnwatchedSeries() async {
    final unwatchedSerieEntities = await serieDao.getUnwatchedSeries();
    var unwatchedSeries = <Serie>[];
    for (SerieEntity serieEntity in unwatchedSerieEntities) {
      unwatchedSeries.add((await tdmbApiService.getSerie(
              "9ee736e148e808222f04c1535dc80b64", serieEntity.id.toString()))
          .parseSerieDto());
    }
    return unwatchedSeries;
  }

  @override
  Future<void> addUnwatchedSeriee(int serieId) {
    return serieDao.insertSerie(SerieEntity(id: serieId, isWatched: false));
  }

  @override
  Future<void> addWatchedSerie(int serieId) {
    return serieDao.insertSerie(SerieEntity(id: serieId, isWatched: true));
  }

  @override
  Future<void> deleteWatchedSerie(int serieId) {
    return serieDao
        .deleteWatchedSerie(SerieEntity(id: serieId, isWatched: true));
  }

  @override
  Future<void> deleteUnwatchedSerie(int serieId) {
    return serieDao
        .deleteWatchedSerie(SerieEntity(id: serieId, isWatched: false));
  }

  @override
  Future<void> watchSerie(int serieId) {
    return serieDao.watchSerie(SerieEntity(id: serieId, isWatched: true));
  }
}
