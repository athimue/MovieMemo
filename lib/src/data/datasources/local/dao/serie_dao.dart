import 'package:floor/floor.dart';
import 'package:movie_memo/src/data/datasources/local/database_constants.dart';
import 'package:movie_memo/src/data/datasources/local/entity/serie_entity.dart';

@dao
abstract class SerieDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertSerie(SerieEntity serieEntity);

  @Query('SELECT * FROM $seriesTableName')
  Future<List<SerieEntity>> getUnwatchedSeries();

  @Query('SELECT * FROM $seriesTableName')
  Future<List<SerieEntity>> getWatchedSeries();

  @delete
  Future<void> deleteSerie(SerieEntity serieEntity);
}
