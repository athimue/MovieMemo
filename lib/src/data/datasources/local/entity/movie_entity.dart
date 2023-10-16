import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

import 'package:movie_memo/src/data/datasources/local/database_constants.dart';

@Entity(tableName: moviesTableName)
class MovieEntity extends Equatable {
  @PrimaryKey()
  final int id;
  final bool isWatched;
  MovieEntity({
    required this.id,
    required this.isWatched,
  });
  @override
  List<Object> get props => [id, isWatched];
}
