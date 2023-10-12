import 'package:movie_memo/src/domain/models/popular_serie.dart';
import 'package:movie_memo/src/domain/models/serie.dart';

abstract class SerieRepository {
  Future<List<PopularSerie>> getPopularSeries();

  Future<List<Serie>> getUnwatchedSeries();

  Future<List<Serie>> getWatchedSeries();

  Future<void> addWatchedSerie(int serieId);

  Future<void> deleteWatchedSerie(int serieId);

  Future<void> addUnwatchedSeriee(int serieId);

  Future<void> deleteUnwatchedSerie(int serieId);

  Future<void> watchSerie(int serieId);
}
