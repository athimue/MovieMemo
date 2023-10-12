// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  SerieDao? _serieDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `series_table` (`id` INTEGER NOT NULL, `isWatched` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  SerieDao get serieDao {
    return _serieDaoInstance ??= _$SerieDao(database, changeListener);
  }
}

class _$SerieDao extends SerieDao {
  _$SerieDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _serieEntityInsertionAdapter = InsertionAdapter(
            database,
            'series_table',
            (SerieEntity item) => <String, Object?>{
                  'id': item.id,
                  'isWatched': item.isWatched ? 1 : 0
                }),
        _serieEntityUpdateAdapter = UpdateAdapter(
            database,
            'series_table',
            ['id'],
            (SerieEntity item) => <String, Object?>{
                  'id': item.id,
                  'isWatched': item.isWatched ? 1 : 0
                }),
        _serieEntityDeletionAdapter = DeletionAdapter(
            database,
            'series_table',
            ['id'],
            (SerieEntity item) => <String, Object?>{
                  'id': item.id,
                  'isWatched': item.isWatched ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SerieEntity> _serieEntityInsertionAdapter;

  final UpdateAdapter<SerieEntity> _serieEntityUpdateAdapter;

  final DeletionAdapter<SerieEntity> _serieEntityDeletionAdapter;

  @override
  Future<List<SerieEntity>> getUnwatchedSeries() async {
    return _queryAdapter.queryList(
        'SELECT * FROM series_table WHERE isWatched = \'0\'',
        mapper: (Map<String, Object?> row) => SerieEntity(
            id: row['id'] as int, isWatched: (row['isWatched'] as int) != 0));
  }

  @override
  Future<List<SerieEntity>> getWatchedSeries() async {
    return _queryAdapter.queryList(
        'SELECT * FROM series_table WHERE isWatched = \'1\'',
        mapper: (Map<String, Object?> row) => SerieEntity(
            id: row['id'] as int, isWatched: (row['isWatched'] as int) != 0));
  }

  @override
  Future<void> insertSerie(SerieEntity serieEntity) async {
    await _serieEntityInsertionAdapter.insert(
        serieEntity, OnConflictStrategy.replace);
  }

  @override
  Future<void> watchSerie(SerieEntity serieEntity) async {
    await _serieEntityUpdateAdapter.update(
        serieEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteWatchedSerie(SerieEntity serieEntity) async {
    await _serieEntityDeletionAdapter.delete(serieEntity);
  }

  @override
  Future<void> deleteUnWatchedSerie(SerieEntity serieEntity) async {
    await _serieEntityDeletionAdapter.delete(serieEntity);
  }
}
