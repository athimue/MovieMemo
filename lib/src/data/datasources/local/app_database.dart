import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:movie_memo/src/data/datasources/local/dao/serie_dao.dart';
import 'package:movie_memo/src/data/datasources/local/entity/serie_entity.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [SerieEntity])
abstract class AppDatabase extends FloorDatabase {
  SerieDao get serieDao;
}
