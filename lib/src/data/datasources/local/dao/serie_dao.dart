import 'package:floor/floor.dart';
import 'package:movie_memo/src/data/datasources/local/database_constants.dart';
import 'package:movie_memo/src/data/datasources/local/entity/serie_entity.dart';

@dao
abstract class SerieDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertSerie(SerieEntity serieEntity);

  @Query("SELECT * FROM $seriesTableName WHERE isWatched = '0'")
  Future<List<SerieEntity>> getUnwatchedSeries();

  @Query("SELECT * FROM $seriesTableName WHERE isWatched = '1'")
  Future<List<SerieEntity>> getWatchedSeries();

  @update
  Future<void> watchSerie(SerieEntity serieEntity);

  @delete
  Future<void> deleteWatchedSerie(SerieEntity serieEntity);

  @delete
  Future<void> deleteUnWatchedSerie(SerieEntity serieEntity);
}
