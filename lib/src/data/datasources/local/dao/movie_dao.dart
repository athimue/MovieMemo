import 'package:floor/floor.dart';
import 'package:movie_memo/src/data/datasources/local/database_constants.dart';
import 'package:movie_memo/src/data/datasources/local/entity/movie_entity.dart';

@dao
abstract class MovieDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMovie(MovieEntity movieEntity);

  @Query("SELECT * FROM $moviesTableName WHERE isWatched = '0'")
  Future<List<MovieEntity>> getUnwatchedMovies();

  @Query("SELECT * FROM $moviesTableName WHERE isWatched = '1'")
  Future<List<MovieEntity>> getWatchedMovies();

  @update
  Future<void> watchMovie(MovieEntity movieEntity);

  @delete
  Future<void> deleteWatchedMovie(MovieEntity movieEntity);

  @delete
  Future<void> deleteUnWatchedMovie(MovieEntity movieEntity);
}
