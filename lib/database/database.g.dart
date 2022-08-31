// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorTaskDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$TaskDatabaseBuilder databaseBuilder(String name) =>
      _$TaskDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$TaskDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$TaskDatabaseBuilder(null);
}

class _$TaskDatabaseBuilder {
  _$TaskDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$TaskDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$TaskDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<TaskDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$TaskDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$TaskDatabase extends TaskDatabase {
  _$TaskDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TaskDao? _taskDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
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
            'CREATE TABLE IF NOT EXISTS `Task` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT NOT NULL, `dateBegin` TEXT, `dateEnd` TEXT, `dateSave` TEXT NOT NULL, `message` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TaskDao get taskDao {
    return _taskDaoInstance ??= _$TaskDao(database, changeListener);
  }
}

class _$TaskDao extends TaskDao {
  _$TaskDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _taskInsertionAdapter = InsertionAdapter(
            database,
            'Task',
            (Task item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'dateBegin': item.dateBegin,
                  'dateEnd': item.dateEnd,
                  'dateSave': item.dateSave,
                  'message': item.message
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Task> _taskInsertionAdapter;

  @override
  Future<List<Task>> getTasks() async {
    return _queryAdapter.queryList('SELECT * FROM Task',
        mapper: (Map<String, Object?> row) => Task(
            id: row['id'] as int?,
            title: row['title'] as String,
            dateBegin: row['dateBegin'] as String?,
            dateEnd: row['dateEnd'] as String?,
            message: row['message'] as String,
            dateSave: row['dateSave'] as String));
  }

  @override
  Future<Task?> deleteTask(int id) async {
    return _queryAdapter.query('DELETE FROM TASK WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Task(
            id: row['id'] as int?,
            title: row['title'] as String,
            dateBegin: row['dateBegin'] as String?,
            dateEnd: row['dateEnd'] as String?,
            message: row['message'] as String,
            dateSave: row['dateSave'] as String),
        arguments: [id]);
  }

  @override
  Future<int> inserTask(Task task) {
    return _taskInsertionAdapter.insertAndReturnId(
        task, OnConflictStrategy.abort);
  }
}
