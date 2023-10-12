import 'package:movie_memo/src/domain/models/serie.dart';

abstract class SerieRepository {
  Future<List<Serie>> getPopularSeries();

  Future<List<Serie>> getUnwatchedSeries();

  Future<List<Serie>> getWatchedSeries();

  Future<void> addWatchedSerie(int serieId);

  Future<void> addUnwatchedSeriee(int serieId);
}
